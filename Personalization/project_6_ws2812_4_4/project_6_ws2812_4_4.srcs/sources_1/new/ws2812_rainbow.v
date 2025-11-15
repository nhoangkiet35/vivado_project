//==============================================================
// ws2812_rainbow.v
// Hiệu ứng cross-fade rainbow tuần tự cho WS2812 4x4 (16 LED)
// Clock: 125 MHz
//==============================================================
module ws2812_rainbow (
    input  wire clk,
    input  wire reset_p,
    output wire data
);
    //=======================
    // WS2812 Timing (125 MHz)
    //=======================
    localparam T0H   = 50;      // 0.4 µs
    localparam T1H   = 100;     // 0.8 µs
    localparam T0L   = 106;     // 0.85 µs
    localparam T1L   = 56;      // 0.45 µs
    localparam TRESET = 6250;   // ≥50 µs

    //=======================
    // LED Parameters
    //=======================
    localparam LED_COUNT = 16;
    localparam COLOR_BITS = 24; // GRB
    localparam TOTAL_BITS = LED_COUNT * COLOR_BITS;

    //=======================
    // Internal registers
    //=======================
    reg [23:0] color [0:LED_COUNT-1];
    reg [7:0] fade_cnt = 0;
    reg [15:0] led_idx = 0;
    reg [31:0] color_timer = 0;

    //=======================
    // Rainbow color generator
    //=======================
    function [23:0] hsv_to_rgb;
        input [7:0] hue;
        reg [7:0] region, remainder, p, q, t;
        reg [7:0] r, g, b;
        begin
            region = hue / 43;
            remainder = (hue - (region * 43)) * 6;

            case(region)
                0: begin r = 255; g = remainder; b = 0; end
                1: begin r = 255 - remainder; g = 255; b = 0; end
                2: begin r = 0; g = 255; b = remainder; end
                3: begin r = 0; g = 255 - remainder; b = 255; end
                4: begin r = remainder; g = 0; b = 255; end
                default: begin r = 255; g = 0; b = 255 - remainder; end
            endcase
            hsv_to_rgb = {g, r, b}; // GRB order
        end
    endfunction

    //=======================
    // Rainbow color update
    //=======================
    always @(posedge clk or posedge reset_p) begin
        if (reset_p) begin
            fade_cnt <= 0;
            color_timer <= 0;
        end else begin
            color_timer <= color_timer + 1;
            if (color_timer == 12_500_000) begin // ~0.1s
                color_timer <= 0;
                fade_cnt <= fade_cnt + 1;
            end
        end
    end

    //=======================
    // Assign colors to each LED (shifted rainbow)
    //=======================
    integer i;
    always @(*) begin
        for (i = 0; i < LED_COUNT; i = i + 1)
            color[i] = hsv_to_rgb(fade_cnt + (i * 16));
    end

    //=======================
    // WS2812 Serializer
    //=======================
    reg [31:0] cnt = 0;
    reg [31:0] bit_index = 0;
    reg data_reg = 0;
    reg state = 0;

    localparam S_IDLE = 0, S_SEND = 1, S_RESET = 2;
    
    integer led_num;
    integer color_bit;
    reg bit_val;

    always @(posedge clk or posedge reset_p) begin
        if (reset_p) begin
            cnt <= 0;
            bit_index <= 0;
            data_reg <= 0;
            state <= S_SEND;
        end else begin
            case (state)
                S_SEND: begin
                    if (bit_index < TOTAL_BITS) begin
                        // Determine which bit we're sending
                        led_num = bit_index / 24;
                        color_bit = 23 - (bit_index % 24);
                        bit_val = color[led_num][color_bit];

                        cnt <= cnt + 1;
                        if (bit_val) begin
                            if (cnt < T1H) data_reg <= 1;
                            else if (cnt < (T1H + T1L)) data_reg <= 0;
                            else begin
                                cnt <= 0;
                                bit_index <= bit_index + 1;
                            end
                        end else begin
                            if (cnt < T0H) data_reg <= 1;
                            else if (cnt < (T0H + T0L)) data_reg <= 0;
                            else begin
                                cnt <= 0;
                                bit_index <= bit_index + 1;
                            end
                        end
                    end else begin
                        bit_index <= 0;
                        cnt <= 0;
                        state <= S_RESET;
                    end
                end

                S_RESET: begin
                    cnt <= cnt + 1;
                    data_reg <= 0;
                    if (cnt >= TRESET) begin
                        cnt <= 0;
                        state <= S_SEND;
                    end
                end
            endcase
        end
    end

    assign data = data_reg;

endmodule
