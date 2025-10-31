// state_machine_project_top.v
// Top module: connects debounce -> game FSM -> 7-seg

module state_machine_project_top (
    input  wire        i_clk,
    input  wire [3:0]  i_switch,    // raw switches/buttons
    output wire [3:0]  o_led,       // LEDs
    output wire [6:0]  o_segment,   // 7-seg segments a..g
    output wire        o_digit      // digit enable (single digit)
);

    // FAST SIMULATION SETTINGS
    localparam integer GAME_LIMIT     = 4;
    localparam integer CLKS_PER_SEC   = 1000;     // giảm clock logic xuống 1kHz cho mô phỏng
    localparam integer DEBOUNCE_LIMIT = 3;        // lọc nhiễu cực nhanh
    

    wire [3:0] w_switch_debounced;
    wire [3:0] w_score;
    wire [6:0] w_segment;

    // Debounce generator
    genvar i;
    generate
        for (i = 0; i < 4; i = i + 1) begin : GEN_DEBOUNCE
            debounce_filter #(
                .DEBOUNCE_LIMIT(DEBOUNCE_LIMIT)
            ) u_debounce (
                .i_clk(i_clk),
                .i_bouncy(i_switch[i]),
                .o_debounced(w_switch_debounced[i])
            );
        end
    endgenerate

    // Game FSM core
    state_machine_game #(
        .CLKS_PER_SEC(CLKS_PER_SEC),
        .GAME_LIMIT(GAME_LIMIT)
    ) u_game (
        .i_clk(i_clk),
        .i_switch(w_switch_debounced),
        .o_score(w_score),
        .o_led(o_led)
    );

    // 7-seg display (score)
    binary_to_7segment u_bcd (
        .i_clk(i_clk),
        .i_binary_num(w_score),
        .o_segment(w_segment)
    );

    assign o_segment = w_segment;
    assign o_digit   = 1'b0; // enable first digit (active low/high depends on hardware)

endmodule
