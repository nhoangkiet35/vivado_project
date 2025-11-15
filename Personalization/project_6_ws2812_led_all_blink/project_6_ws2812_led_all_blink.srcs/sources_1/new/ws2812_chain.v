module ws2812_chain #(
    parameter NUM_LEDS = 16
)(
    input  wire clk,        // 125 MHz
    input  wire rst,
    input  wire start,
    input  wire [NUM_LEDS*24-1:0] led_data,
    output wire data_out,
    output reg  done
);

    localparam RESET_CYCLES = 10_000; // 80 µs @125MHz

    reg [23:0] current_color;
    reg [7:0] led_index = 0;
    reg driver_start = 0;
    wire driver_done;

    reg [15:0] reset_counter = 0;
    reg [1:0] state = 0;

    localparam S_IDLE  = 0,
               S_SEND  = 1,
               S_RESET = 2;

    ws2812_driver driver (
        .clk(clk),
        .rst(rst),
        .start(driver_start),
        .color(current_color),
        .data_out(data_out),
        .done(driver_done)
    );

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            led_index <= 0;
            done <= 0;
            driver_start <= 0;
            reset_counter <= 0;
            state <= S_IDLE;
        end else begin
            case (state)
                S_IDLE: begin
                    done <= 0;
                    if (start) begin
                        led_index <= 0;
                        current_color <= led_data[(NUM_LEDS*24-1) -: 24];
                        driver_start <= 1;
                        state <= S_SEND;
                    end
                end

                S_SEND: begin
                    driver_start <= 0;
                    if (driver_done) begin
                        // CHỈ gửi thêm nếu chưa tới LED cuối
                        if (led_index == NUM_LEDS - 1) begin
                            state <= S_RESET;
                            reset_counter <= 0;
                        end else begin
                            led_index <= led_index + 1;
                            current_color <= led_data[(NUM_LEDS*24-1) - (led_index+1)*24 -: 24];
                            driver_start <= 1;
                        end
                    end
                end

                S_RESET: begin
                    reset_counter <= reset_counter + 1;
                    if (reset_counter >= RESET_CYCLES) begin
                        done <= 1;
                        state <= S_IDLE;
                    end
                end
            endcase
        end
    end
endmodule
