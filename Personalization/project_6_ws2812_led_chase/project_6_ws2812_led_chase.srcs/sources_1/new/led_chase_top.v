module led_chase_top (
    input  wire clk,   // 125MHz
    input  wire rst,
    output wire data_out
);
    parameter NUM_LEDS = 16;
    parameter DELAY_MAX = 62_500_000; // 0.5s

    reg [NUM_LEDS*24-1:0] led_data = 0;
    reg [3:0] current_led = 0;
    reg [31:0] delay_cnt = 0;
    reg start = 0;
    wire chain_done;

    // ✅ Giữ nguyên (đã xử lý giao tiếp, timing, index)
    ws2812_chain #(.NUM_LEDS(NUM_LEDS)) chain_inst (
        .clk(clk),
        .rst(rst),
        .start(start),
        .led_data(led_data),
        .data_out(data_out),
        .done(chain_done)
    );

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            current_led <= 0;
            delay_cnt <= 0;
            start <= 0;
        end else begin
            if (delay_cnt < DELAY_MAX)
                delay_cnt <= delay_cnt + 1;
            else if (!start && !chain_done) begin
                delay_cnt <= 0;
                start <= 1;
            end else if (chain_done) begin
                start <= 0;
                // Quyết định LED chạy từ đầu → cuối rồi lặp lại
                current_led <= (current_led == NUM_LEDS-1) ? 0 : current_led + 1;
            end
        end
    end

    integer i;
    always @(*) begin
        led_data = 0;
        for (i = 0; i < NUM_LEDS; i = i + 1)
            // Điều kiện quyết định xét từng LED một 
            led_data[i*24 +: 24] = (i == current_led) ? 24'hFF0000 : 24'h000000; // HEX: G - R - B
    end
endmodule
