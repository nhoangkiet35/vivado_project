module shift_reg_74hc595 (
    input clk,            // Clock
    input rst_n,          // Reset active low
    input [15:0] data_in, // 16-bit data to shift out
    input start,          // Start signal
    output reg busy,      // Busy flag (1 while shifting)
    output reg SER,       // Serial data
    output reg SRCLK,     // Shift clock
    output reg RCLK       // Latch clock
);

    reg [4:0] bit_cnt;
    reg [15:0] shift_buf;
    reg [2:0] state;

    localparam IDLE = 0, LOAD = 1, SHIFT = 2, LATCH = 3, DONE = 4;

    always @(posedge clk or negedge rst_n) begin
        if(!rst_n) begin
            SER <= 0;
            SRCLK <= 0;
            RCLK <= 0;
            busy <= 0;
            state <= IDLE;
            bit_cnt <= 0;
        end else begin
            case(state)
                IDLE: begin
                    RCLK <= 0;
                    SRCLK <= 0;
                    busy <= 0;
                    if(start) begin
                        shift_buf <= data_in;
                        state <= LOAD;
                        busy <= 1;
                    end
                end

                LOAD: begin
                    bit_cnt <= 0;
                    state <= SHIFT;
                end

                SHIFT: begin
                    SER <= shift_buf[15 - bit_cnt];
                    SRCLK <= 1;
                    #1 SRCLK <= 0; // tạo xung clock ngắn
                    if(bit_cnt == 15)
                        state <= LATCH;
                    else
                        bit_cnt <= bit_cnt + 1;
                end

                LATCH: begin
                    RCLK <= 1;
                    #1 RCLK <= 0;
                    state <= DONE;
                end

                DONE: begin
                    busy <= 0;
                    state <= IDLE;
                end
            endcase
        end
    end

endmodule
