module ws2812_controller(
    input clk,                 // Clock 50MHz
    input rst_n,               // Active-low reset
    input start,
    input [7:0] red,           // Màu đỏ
    input [7:0] green,         // Màu xanh lá
    input [7:0] blue,          // Màu xanh dương
    output reg data_out,
    output reg done
);

// Tham số thời gian (clock 50MHz)
parameter T1H = 40;    // ~0.8us
parameter T1L = 22;    // ~0.45us
parameter T0H = 20;    // ~0.4us
parameter T0L = 43;    // ~0.85us
parameter RES = 3000;  // >50us reset time

// Trạng thái FSM
typedef enum logic [2:0] {
    IDLE, LOAD, SEND_BIT_HIGH, SEND_BIT_LOW, RESET
} state_t;

state_t state;
reg [7:0] bit_index;
reg [11:0] cnt;
reg current_bit;
reg [23:0] shift_reg;

always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        state <= IDLE;
        data_out <= 0;
        done <= 0;
        bit_index <= 0;
        cnt <= 0;
        shift_reg <= 0;
    end else begin
        case (state)
            IDLE: begin
                done <= 0;
                data_out <= 0;
                if (start) begin
                    // Ghép dữ liệu GRB
                    shift_reg <= {green, red, blue};
                    bit_index <= 23;
                    state <= LOAD;
                end
            end

            LOAD: begin
                current_bit <= shift_reg[bit_index];
                state <= SEND_BIT_HIGH;
                cnt <= 0;
            end

            SEND_BIT_HIGH: begin
                data_out <= 1;
                cnt <= cnt + 1;
                if ((current_bit && cnt == T1H) || (!current_bit && cnt == T0H)) begin
                    cnt <= 0;
                    state <= SEND_BIT_LOW;
                end
            end

            SEND_BIT_LOW: begin
                data_out <= 0;
                cnt <= cnt + 1;
                if ((current_bit && cnt == T1L) || (!current_bit && cnt == T0L)) begin
                    cnt <= 0;
                    if (bit_index == 0) begin
                        state <= RESET;
                    end else begin
                        bit_index <= bit_index - 1;
                        state <= LOAD;
                    end
                end
            end

            RESET: begin
                data_out <= 0;
                cnt <= cnt + 1;
                if (cnt == RES) begin
                    state <= IDLE;
                    done <= 1;
                end
            end
        endcase
    end
end
endmodule