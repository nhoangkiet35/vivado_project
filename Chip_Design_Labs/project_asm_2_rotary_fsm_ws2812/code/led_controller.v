module led_controller #(
    parameter NUM_LEDS = 16
)(
    input  wire clk,
    input  wire rst,
    input  wire [1:0] mode,
    input  wire [1:0] color,
    input  wire [1:0] speed,
    output reg [NUM_LEDS*24-1:0] led_data,
    output wire ws2812_din
);
    localparam DELAY_SUPER = 20_000_000;        // 160ms @125MHz
    localparam DELAY_FAST  = 40_000_000;        // 320ms @125MHz
    localparam DELAY_MID   = 62_500_000;        // 500ms @125MHz
    localparam DELAY_LOW   = 125_000_000;       // 1s @125MHz
    localparam MAX_BRIGHT  = 255;               // độ sáng max (0-255)
    localparam STEP        = 1;                 // bước tăng/giảm brightness
    
    // ----------------------------------------------------------
    // Frame-based update counter
    // ----------------------------------------------------------
    reg [31:0] delay_cnt = 0;
    reg [31:0] refresh_max = 0;
    reg [7:0] idx = 0;      // counter cho chase/alternate
    reg start = 0;
    reg [7:0] brightness = 0; // counter cho fade
    reg dir = 1; // 1: tăng sáng, 0: giảm sáng
    wire chain_done;

    // ----------------------------------------------------------
    // WS2812 CHAIN (giữ nguyên module)
    // ----------------------------------------------------------
    ws2812_chain #(
        .NUM_LEDS(NUM_LEDS)
    ) chain_inst (
        .clk(clk),
        .rst(rst),
        .start(start),
        .led_data(led_data),
        .data_out(ws2812_din),
        .done(chain_done)
    );
    
    // refresh_max update (clocked)
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            refresh_max <= DELAY_LOW; 
        end else begin
            case(speed)
                2'd0: refresh_max <= DELAY_LOW;   // chậm
                2'd1: refresh_max <= DELAY_MID;   // vừa
                2'd2: refresh_max <= DELAY_FAST;  // nhanh
                2'd3: refresh_max <= DELAY_SUPER; // rất nhanh
                default: refresh_max <= DELAY_LOW;
            endcase
        end
    end

    // ----------------------------------------------------------
    // WS2812 Chain Trigger (start pulse every REFRESH_MAX)
    // ----------------------------------------------------------
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            idx <= 0;
            delay_cnt <= 0;
            start <= 0;
            brightness <= 0;
            dir <= 1;
        end else begin
            if (delay_cnt < refresh_max)
                delay_cnt <= delay_cnt + 1;
            else if (!start && !chain_done) begin
                delay_cnt <= 0;
                // Cập nhật độ sáng
                if (dir) brightness <= brightness + STEP;
                else brightness <= brightness - STEP;

                // Đổi hướng nếu chạm biên
                if (brightness >= MAX_BRIGHT - STEP) dir <= 0;
                else if (brightness <= STEP) dir <= 1;

                start <= 1;
            end else if (chain_done) begin
                start <= 0;
                // Quyết định LED chạy từ đầu → cuối rồi lặp lại
                idx <= (idx == NUM_LEDS-1) ? 0 : idx + 1;
            end
        end
    end
    
    // ----------------------------------------------------------
    // COLOR FUNCTION - 24-bit RGB
    // ----------------------------------------------------------
    function [23:0] get_color;
        input [1:0] color_id;
        input [7:0] phase; // for rainbow animation
        begin
            case (color_id)
                2'd0: get_color = {8'h00, 8'hFF, 8'h00};           // GREEN
                2'd1: get_color = {8'hFF, 8'h00, 8'h00};           // RED
                2'd2: get_color = {8'h00, 8'h00, 8'hFF};           // BLUE
                2'd3: get_color = {phase, phase >> 4, ~phase};     // RAINBOW-ish
                default: get_color = 24'h000000;
            endcase
        end
    endfunction

    // ----------------------------------------------------------
    // GENERATE LED ARRAY (combinational) - only place that drives led_data
    // ----------------------------------------------------------
    integer i;
    reg [23:0] col;

    always @(*) begin
        // default
        led_data = {NUM_LEDS*24{1'b0}};

        for (i = 0; i < NUM_LEDS; i = i + 1) begin
            col = get_color(color, idx);

            case (mode)
                // MODE 0 - Chase left-to-right
                2'd0: begin
                        led_data[i*24 +: 24] = (i == (idx % NUM_LEDS)) ? col : 24'h000000;
                end

                // MODE 1 - All blink (use bit 3 of idx as slow toggle)
                2'd1: begin
                        led_data[i*24 +: 24] = (idx[3]) ? col : 24'h000000;
                end

                // MODE 2 - Alternating blink (use LSB parity)
                2'd2: begin
                        led_data[i*24 +: 24] = ((i & 1) == idx[0]) ? col : 24'h000000;
                end

                // MODE 3 - Fade in/out (apply brightness)
                2'd3: begin
                    led_data[i*24 +: 24] = {
                        (col[23:16] & brightness),
                        (col[15:8]  & brightness),
                        (col[7:0]   & brightness)
                    };
                end

                default: led_data[i*24 +: 24] = 24'h000000;
            endcase
        end
    end

endmodule
