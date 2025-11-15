// ✅ Không nên đổi (liên quan đến timing WS2812)
module ws2812_driver (
    input  wire clk,       // 125 MHz
    input  wire rst,
    input  wire start,
    input  wire [23:0] color,
    output reg  data_out,
    output reg  done
);
    // Adjusted timing (slightly safer margins)
    parameter T0H    = 55;   // 0.44 µs
    parameter T1H    = 105;  // 0.84 µs
    parameter PERIOD = 160;  // 1.28 µs

    reg [7:0] bit_index = 0;
    reg [8:0] counter = 0;
    reg [23:0] shift_reg = 0;
    reg sending = 0;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            bit_index <= 0;
            counter <= 0;
            sending <= 0;
            data_out <= 0;
            done <= 0;
        end else begin
            if (start && !sending) begin
                shift_reg <= color;
                bit_index <= 0;
                counter <= 0;
                sending <= 1;
                done <= 0;
            end else if (sending) begin
                counter <= counter + 1;
                if (counter < ((shift_reg[23]) ? T1H : T0H))
                    data_out <= 1;
                else
                    data_out <= 0;

                if (counter >= PERIOD) begin
                    counter <= 0;
                    shift_reg <= {shift_reg[22:0], 1'b0};
                    bit_index <= bit_index + 1;
                    if (bit_index == 23) begin
                        sending <= 0;
                        done <= 1;
                    end
                end
            end else begin
                done <= 0;
            end
        end
    end
endmodule
