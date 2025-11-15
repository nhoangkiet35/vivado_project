module led_fade_top (
    input  wire clk,   // 125 MHz clock
    input  wire rst,
    output wire data_out
);
    parameter NUM_LEDS   = 16;
    parameter DELAY_MAX  = 2_000_000; // delay để làm mượt fade (125 MHz -> ~16ms mỗi step)
    parameter MAX_BRIGHT = 255;       // độ sáng max (0-255)
    parameter STEP       = 1;         // bước tăng/giảm brightness

    reg [NUM_LEDS*24-1:0] led_data = 0;
    reg [31:0] delay_cnt = 0;
    reg start = 0;
    reg [7:0] brightness = 0;
    reg dir = 1; // 1: tăng sáng, 0: giảm sáng
    wire chain_done;

    ws2812_chain #(.NUM_LEDS(NUM_LEDS)) chain_inst (
        .clk(clk),
        .rst(rst),
        .start(start),
        .led_data(led_data),
        .data_out(data_out),
        .done(chain_done)
    );

    // Fade control
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            delay_cnt <= 0;
            start <= 0;
            brightness <= 0;
            dir <= 1;
        end else begin
            if (delay_cnt < DELAY_MAX)
                delay_cnt <= delay_cnt + 1;
            else if (!start && !chain_done) begin
                delay_cnt <= 0;
                // Cập nhật độ sáng
                if (dir)
                    brightness <= brightness + STEP;
                else
                    brightness <= brightness - STEP;

                // Đổi hướng nếu chạm biên
                if (brightness >= MAX_BRIGHT - STEP)
                    dir <= 0;
                else if (brightness <= STEP)
                    dir <= 1;

                start <= 1;
            end else if (chain_done) begin
                start <= 0;
            end
        end
    end

    // Gán dữ liệu LED: tất cả LED cùng sáng với độ sáng "brightness"
    integer i;
    always @(*) begin
        for (i = 0; i < NUM_LEDS; i = i + 1) begin
            if (i % 4 == 0)
                led_data[i*24 +: 24] = {brightness, 8'd0, 8'd0};
            else if (i % 4 == 2)
                led_data[i*24 +: 24] = {8'd0, 8'd0, brightness}; 
            else if (i % 4 == 3)
                led_data[i*24 +: 24] = {brightness, brightness, 8'd0};
            else
                led_data[i*24 +: 24] = {brightness, brightness, brightness};
            
            // 24'hRR0000 -> màu xanh lá mờ dần sáng lên
            // Đỏ           {8'd0, brightness, 8'd0}
            // Xanh lá      {brightness, 8'd0, 8'd0}
            // Xanh dương	{8'd0, 8'd0, brightness}
            // Trắng        {brightness, brightness, brightness}
            // Vàng         {brightness, brightness, 8'd0}
        end
    end
endmodule
