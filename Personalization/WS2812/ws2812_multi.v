module ws2812_multi #(
    parameter NUM_LED = 8
)(
    input  wire clk,
    input  wire rst_n,
    input  wire start,
    input  wire [23:0] rgb_data [0:NUM_LED-1],
    output reg        led_data,
    output reg        ready
);
    localparam T0H = 20, T0L = 42;
    localparam T1H = 40, T1L = 22;
    localparam RES = 3000;

    reg [12:0] timer;
    reg [5:0] bit_cnt;
    reg [5:0] led_idx;
    reg [23:0] shift_reg;
    reg state;

    localparam IDLE = 0, SEND = 1;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            timer <= 0;
            bit_cnt <= 0;
            led_idx <= 0;
            shift_reg <= 0;
            led_data <= 0;
            ready <= 1;
            state <= IDLE;
        end else begin
            case (state)
                IDLE: begin
                    ready <= 1;
                    if (start) begin
                        state <= SEND;
                        shift_reg <= rgb_data[0];
                        led_idx <= 0;
                        bit_cnt <= 0;
                        timer <= 0;
                        ready <= 0;
                    end
                end

                SEND: begin
                    if (bit_cnt < 24) begin
                        if (timer == 0) begin
                            led_data <= shift_reg[23];
                            timer <= shift_reg[23] ? T1H : T0H;
                        end else if (timer == 1) begin
                            led_data <= 0;
                            timer <= shift_reg[23] ? T1L : T0L;
                            shift_reg <= {shift_reg[22:0], 1'b0};
                            bit_cnt <= bit_cnt + 1;
                        end else begin
                            timer <= timer - 1;
                        end
                    end else begin
                        if (led_idx < NUM_LED - 1) begin
                            led_idx <= led_idx + 1;
                            shift_reg <= rgb_data[led_idx + 1];
                            bit_cnt <= 0;
                            timer <= 0;
                        end else begin
                            if (timer < RES) begin
                                led_data <= 0;
                                timer <= timer + 1;
                            end else begin
                                state <= IDLE;
                            end
                        end
                    end
                end
            endcase
        end
    end
endmodule
