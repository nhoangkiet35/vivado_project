module led_master_top (
    input  wire clk,        // 125 MHz
    input  wire rst,
    input  wire A, B,       // Rotary encoder inputs
    output wire data_out    // WS2812 output
);
    parameter NUM_LEDS = 16;

    wire [2:0] pattern_select;
    rotary_ctrl rotary_inst (
        .clk(clk),
        .rst(rst),
        .A(A),
        .B(B),
        .pattern_select(pattern_select)
    );

    // pattern data
    reg [NUM_LEDS*24-1:0] led_data = 0;
    reg [31:0] delay_cnt = 0;
    reg start = 0;
    wire chain_done;

    ws2812_chain #(.NUM_LEDS(NUM_LEDS)) chain_inst (
        .clk(clk),
        .rst(rst),
        .start(start),
        .led_data(led_data),
        .data_out(data_out),
        .done(chain_done)
    );

    // Timing
    parameter DELAY_MAX = 25_000_000;
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            delay_cnt <= 0;
            start <= 0;
        end else begin
            if (delay_cnt < DELAY_MAX)
                delay_cnt <= delay_cnt + 1;
            else if (!start && !chain_done) begin
                delay_cnt <= 0;
                start <= 1;
            end else if (chain_done)
                start <= 0;
        end
    end

    // Pattern state
    reg [7:0] fade_brightness = 0;
    reg fade_dir = 1;
    reg [15:0] hue_offset = 0;

    // Pattern generator
    integer i;
    always @(*) begin
        led_data = 0;
        case (pattern_select)
            3'd0: begin // Chase
                for (i = 0; i < NUM_LEDS; i = i + 1)
                    led_data[i*24 +: 24] = (i == (delay_cnt / 2_000_000) % NUM_LEDS) ? 24'hFF0000 : 24'h000000;
            end
            3'd1: begin // All Blink
                for (i = 0; i < NUM_LEDS; i = i + 1)
                    led_data[i*24 +: 24] = ((delay_cnt >> 24) & 1) ? 24'h00FF00 : 24'h000000;
            end
            3'd2: begin // Alternating Blink
                for (i = 0; i < NUM_LEDS; i = i + 1)
                    led_data[i*24 +: 24] = (((i + ((delay_cnt >> 24) & 1)) % 2) == 0) ? 24'h0000FF : 24'h000000;
            end
            3'd3: begin // Fade
                for (i = 0; i < NUM_LEDS; i = i + 1)
                    led_data[i*24 +: 24] = {8'd0, fade_brightness, 8'd0};
            end
            3'd4: begin // Rainbow
                for (i = 0; i < NUM_LEDS; i = i + 1)
                    led_data[i*24 +: 24] = hsv_to_rgb((hue_offset + i*64) % 1536);
            end
            default: led_data = 0;
        endcase
    end

    // Fade brightness logic
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            fade_brightness <= 0;
            fade_dir <= 1;
        end else begin
            if (fade_dir)
                fade_brightness <= fade_brightness + 1;
            else
                fade_brightness <= fade_brightness - 1;

            if (fade_brightness == 255)
                fade_dir <= 0;
            else if (fade_brightness == 0)
                fade_dir <= 1;
        end
    end

    // Rainbow hue rotation
    always @(posedge clk or posedge rst) begin
        if (rst) hue_offset <= 0;
        else hue_offset <= hue_offset + 3;
    end

    // HSV to RGB conversion (GRB order for WS2812)
    function [23:0] hsv_to_rgb;
        input [15:0] hue;
        reg [7:0] r, g, b;
        reg [15:0] region, remainder;
        begin
            region = (hue / 256) % 6;
            remainder = hue % 256;
            case (region)
                0: begin r = 255; g = remainder; b = 0; end
                1: begin r = 255 - remainder; g = 255; b = 0; end
                2: begin r = 0; g = 255; b = remainder; end
                3: begin r = 0; g = 255 - remainder; b = 255; end
                4: begin r = remainder; g = 0; b = 255; end
                5: begin r = 255; g = 0; b = 255 - remainder; end
                default: begin r = 0; g = 0; b = 0; end
            endcase
            hsv_to_rgb = {g, r, b};
        end
    endfunction
endmodule
