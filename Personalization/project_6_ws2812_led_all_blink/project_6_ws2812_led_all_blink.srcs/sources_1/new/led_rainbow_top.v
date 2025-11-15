module led_rainbow_top (
    input  wire clk,   // 125MHz
    input  wire rst,
    output wire data_out
);
    parameter NUM_LEDS   = 16;
    parameter DELAY_MAX  = 2_000_000; // delay để hiệu ứng chạy mượt (~16ms)
    parameter HUE_STEP   = 2;         // tốc độ đổi màu (1-5 là đẹp)

    reg [NUM_LEDS*24-1:0] led_data = 0;
    reg [31:0] delay_cnt = 0;
    reg start = 0;
    reg [15:0] hue_offset = 0; // góc màu cơ bản
    wire chain_done;

    ws2812_chain #(.NUM_LEDS(NUM_LEDS)) chain_inst (
        .clk(clk),
        .rst(rst),
        .start(start),
        .led_data(led_data),
        .data_out(data_out),
        .done(chain_done)
    );

    // Timing điều khiển hiệu ứng rainbow
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            delay_cnt <= 0;
            hue_offset <= 0;
            start <= 0;
        end else begin
            if (delay_cnt < DELAY_MAX)
                delay_cnt <= delay_cnt + 1;
            else if (!start && !chain_done) begin
                delay_cnt <= 0;
                hue_offset <= hue_offset + HUE_STEP;
                start <= 1;
            end else if (chain_done) begin
                start <= 0;
            end
        end
    end

    // Convert hue -> RGB
    function [23:0] hsv_to_rgb;
        input [15:0] hue; // 0-359 scaled to 0-1535 for 6 color segments
        reg [7:0] r, g, b;
        reg [15:0] region, remainder;
        begin
            region = (hue / 256) % 6;      // xác định vùng màu (0-5)
            remainder = hue % 256;         // độ pha trộn giữa 2 màu
            case (region)
                0: begin r = 255; g = remainder; b = 0; end             // Red → Yellow
                1: begin r = 255 - remainder; g = 255; b = 0; end       // Yellow → Green
                2: begin r = 0; g = 255; b = remainder; end             // Green → Cyan
                3: begin r = 0; g = 255 - remainder; b = 255; end       // Cyan → Blue
                4: begin r = remainder; g = 0; b = 255; end             // Blue → Magenta
                5: begin r = 255; g = 0; b = 255 - remainder; end       // Magenta → Red
                default: begin r = 0; g = 0; b = 0; end
            endcase
            hsv_to_rgb = {g, r, b}; // WS2812 order = GRB
        end
    endfunction

    // Gán dữ liệu LED theo rainbow pattern
    integer i;
    always @(*) begin
        for (i = 0; i < NUM_LEDS; i = i + 1) begin
            // Mỗi LED lệch pha hue một chút để tạo hiệu ứng cầu vồng chạy
            led_data[i*24 +: 24] = hsv_to_rgb((hue_offset + i*64) % 1536);
        end
    end
endmodule
