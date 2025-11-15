module led_allblink_top (
    input  wire clk,   // 125MHz
    input  wire rst,
    output wire data_out
);
    parameter NUM_LEDS = 16;
    parameter DELAY_MAX = 62_500_000; // 0.5s

    reg [NUM_LEDS*24-1:0] led_data = 0;
    reg [31:0] delay_cnt = 0;
    reg start = 0;
    reg blink_state = 0;
    wire chain_done;

    ws2812_chain #(.NUM_LEDS(NUM_LEDS)) chain_inst (
        .clk(clk),
        .rst(rst),
        .start(start),
        .led_data(led_data),
        .data_out(data_out),
        .done(chain_done)
    );

    // Blink logic
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            delay_cnt <= 0;
            blink_state <= 0;
            start <= 0;
        end else begin
            if (delay_cnt < DELAY_MAX)
                delay_cnt <= delay_cnt + 1;
            else if (!start && !chain_done) begin
                delay_cnt <= 0;
                blink_state <= ~blink_state;
                start <= 1;
            end else if (chain_done) begin
                start <= 0;
            end
        end
    end

    // Toàn bộ LED cùng bật/tắt
    integer i;
    always @(*) begin
        for (i = 0; i < NUM_LEDS; i = i + 1)
            led_data[i*24 +: 24] = (blink_state) ? 24'hFF0000 : 24'h000000; // xanh lá sáng toàn dãy
    end
endmodule
