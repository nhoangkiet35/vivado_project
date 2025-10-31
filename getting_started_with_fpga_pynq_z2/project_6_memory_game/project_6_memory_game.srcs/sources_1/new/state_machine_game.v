// state_machine_game.v
module state_machine_game #(
    parameter integer CLKS_PER_SEC = 100_000_000,
    parameter integer GAME_LIMIT   = 6
) (
    input  wire        i_clk,
    input  wire [3:0]  i_switch,   // debounced switches
    output reg  [3:0]  o_score = 4'd0,
    output wire [3:0]  o_led
);
    // State encoding (localparam for Verilog)
    localparam [2:0]
        START        = 3'd0,
        PATTERN_OFF  = 3'd1,
        PATTERN_SHOW = 3'd2,
        WAIT_PLAYER  = 3'd3,
        INCR_SCORE   = 3'd4,
        LOSER        = 3'd5,
        WINNER       = 3'd6;

    reg [2:0] r_state = START;

    // pattern storage: 11 entries of 2 bits
    reg [1:0] r_pattern [0:10];
    reg [3:0] r_prev_switch = 4'b0000;
    reg       r_button_dv    = 1'b0;
    reg [1:0] r_button_id    = 2'b00;
    reg [2:0] r_index        = 3'd0;

    // toggle generator for timing show/off (use 4 phases per second => CLKS_PER_SEC/4)
    wire [21:0] w_lfsr_data;
    wire        w_toggle;
    wire        w_count_en;

    // Initialize pattern from LFSR when in START
    always @(posedge i_clk) begin
        // detect falling edge of switches (prev & ~curr)
        r_prev_switch <= i_switch;

        // detect single-button falling edge
        if ((r_prev_switch & ~i_switch) != 4'b0000) begin
            r_button_dv <= 1'b1;
            case (r_prev_switch & ~i_switch)
                4'b0001: r_button_id <= 2'd0;
                4'b0010: r_button_id <= 2'd1;
                4'b0100: r_button_id <= 2'd2;
                4'b1000: r_button_id <= 2'd3;
                default: r_button_id <= 2'd0;
            endcase
        end else begin
            r_button_dv <= 1'b0;
        end
    end

    // Main FSM
    always @(posedge i_clk) begin
        // default keep state unless changed
        case (r_state)
            START: begin
                // stay until user releases start condition (e.g. initial press combination)
                // We assume user presses multiple switches to reset; design dependent
                if (~|i_switch && r_button_dv) begin
                    o_score <= 4'd0;
                    r_index <= 3'd0;
                    r_state <= PATTERN_OFF;
                end
            end

            PATTERN_OFF: begin
                // wait for falling edge of toggle (w_toggle pulses)
                if (!w_toggle) begin
                    // when toggle falls, show next pattern element
                    r_state <= PATTERN_SHOW;
                end
            end

            PATTERN_SHOW: begin
                if (!w_toggle) begin
                    // after show phase completes for this element
                    if (o_score == r_index) begin
                        r_index <= 3'd0;
                        r_state <= WAIT_PLAYER;
                    end else begin
                        r_index <= r_index + 1'b1;
                        r_state <= PATTERN_OFF;
                    end
                end
            end

            WAIT_PLAYER: begin
                if (r_button_dv) begin
                    // compare pressed button to pattern at r_index
                    if (r_pattern[r_index] == r_button_id && r_index == o_score) begin
                        r_index <= 3'd0;
                        r_state <= INCR_SCORE;
                    end else if (r_pattern[r_index] != r_button_id) begin
                        r_state <= LOSER;
                    end else begin
                        r_index <= r_index + 1'b1;
                    end
                end
            end

            INCR_SCORE: begin
                o_score <= o_score + 1'b1;
                if (o_score == GAME_LIMIT - 1)
                    r_state <= WINNER;
                else
                    r_state <= PATTERN_OFF;
            end

            WINNER: begin
                o_score <= 4'hA; // show A
            end

            LOSER: begin
                o_score <= 4'hF; // show F
            end

            default: r_state <= START;
        endcase
    end

    // Load random pattern into r_pattern when in START
    always @(posedge i_clk) begin
        if (r_state == START) begin
            r_pattern[0]  <= w_lfsr_data[1:0];
            r_pattern[1]  <= w_lfsr_data[3:2];
            r_pattern[2]  <= w_lfsr_data[5:4];
            r_pattern[3]  <= w_lfsr_data[7:6];
            r_pattern[4]  <= w_lfsr_data[9:8];
            r_pattern[5]  <= w_lfsr_data[11:10];
            r_pattern[6]  <= w_lfsr_data[13:12];
            r_pattern[7]  <= w_lfsr_data[15:14];
            r_pattern[8]  <= w_lfsr_data[17:16];
            r_pattern[9]  <= w_lfsr_data[19:18];
            r_pattern[10] <= w_lfsr_data[21:20];
        end
    end

    // o_led: if in PATTERN_SHOW, show single LED according to pattern; otherwise mirror switches
    assign o_led = (r_state == PATTERN_SHOW) ? (4'b0001 << r_pattern[r_index]) : i_switch;

    // enable counter during show/off phase
    assign w_count_en = (r_state == PATTERN_SHOW || r_state == PATTERN_OFF);

    // counter toggle instance: use CLKS_PER_SEC/4 so that one full cycle ~1 second split in 4 phases
    count_and_toggle #(.COUNT_LIMIT(10)) u_count (
        .i_clk(i_clk),
        .i_enable(w_count_en),
        .o_toggle(w_toggle)
    );

    // LFSR for random pattern
    lfsr_22 u_lfsr (
        .i_clk(i_clk),
        .o_lfsr_data(w_lfsr_data)
    );

endmodule
