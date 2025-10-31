module shift_register_74hc595 (
    input clk,              // clock hệ thống
    input rst_n,            // reset tích cực thấp
    input start,            // bắt đầu truyền dữ liệu
    input [15:0] data_in,   // dữ liệu 16 bit (seg + digit)
    output reg SER,         // Data
    output reg SRCLK,       // Shift clock
    output reg RCLK,        // Latch clock
    output reg busy         // Đang gửi dữ liệu
);

    reg [4:0] bit_cnt;
    reg [15:0] shift_reg;
    reg [2:0] state;

    localparam IDLE = 0, LOAD = 1, SHIFT = 2, LATCH = 3;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            SER <= 0;
            SRCLK <= 0;
            RCLK <= 0;
            bit_cnt <= 0;
            shift_reg <= 0;
            state <= IDLE;
            busy <= 0;
        end else begin
            case (state)
                IDLE: begin
                    SRCLK <= 0;
                    RCLK <= 0;
                    busy <= 0;
                    if (start) begin
                        shift_reg <= data_in;
                        bit_cnt <= 0;
                        busy <= 1;
                        state <= SHIFT;
                    end
                end

                SHIFT: begin
                    SER <= shift_reg[15];
                    SRCLK <= 1;
                    shift_reg <= {shift_reg[14:0], 1'b0};
                    bit_cnt <= bit_cnt + 1;
                    if (bit_cnt == 15)
                        state <= LATCH;
                    else
                        state <= LOAD;
                end

                LOAD: begin
                    SRCLK <= 0;
                    state <= SHIFT;
                end

                LATCH: begin
                    RCLK <= 1;
                    state <= IDLE;
                end
            endcase
        end
    end
endmodule
