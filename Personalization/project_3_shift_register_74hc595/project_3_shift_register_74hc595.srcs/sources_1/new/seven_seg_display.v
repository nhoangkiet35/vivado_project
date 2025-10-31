module seven_seg_display (
    input clk,
    input rst_n,
    output SER,
    output SRCLK,
    output RCLK
);

    reg [3:0] digits [3:0];   // Dữ liệu 4 chữ số
    reg [1:0] current_digit;
    reg [7:0] seg_data;
    reg [7:0] digit_sel;
    reg start;
    wire busy;

    // Instantiate shift register
    wire [15:0] data_out = {seg_data, digit_sel};
    shift_register_74hc595 shift_inst(
        .clk(clk),
        .rst_n(rst_n),
        .start(start),
        .data_in(data_out),
        .SER(SER),
        .SRCLK(SRCLK),
        .RCLK(RCLK),
        .busy(busy)
    );

    // Mã 7 đoạn cho Common Anode
    function [7:0] seg_map;
        input [3:0] num;
        case(num)
            4'd0: seg_map = ~8'b00111111;
            4'd1: seg_map = ~8'b00000110;
            4'd2: seg_map = ~8'b01011011;
            4'd3: seg_map = ~8'b01001111;
            4'd4: seg_map = ~8'b01100110;
            4'd5: seg_map = ~8'b01101101;
            4'd6: seg_map = ~8'b01111101;
            4'd7: seg_map = ~8'b00000111;
            4'd8: seg_map = ~8'b01111111;
            4'd9: seg_map = ~8'b01101111;
            default: seg_map = ~8'b00000000;
        endcase
    endfunction

    reg [15:0] refresh_cnt;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            digits[0] <= 4'd1;
            digits[1] <= 4'd2;
            digits[2] <= 4'd3;
            digits[3] <= 4'd4;
            current_digit <= 0;
            refresh_cnt <= 0;
            start <= 0;
        end else begin
            refresh_cnt <= refresh_cnt + 1;

            // Quét từng digit sau mỗi 1ms (với clk 100MHz thì chọn 100000)
            if (refresh_cnt == 100000) begin
                refresh_cnt <= 0;
                current_digit <= current_digit + 1;
                if (current_digit == 3)
                    current_digit <= 0;

                seg_data <= seg_map(digits[current_digit]);

                // Chọn digit (active LOW)
                case(current_digit)
                    2'd0: digit_sel <= 8'b1110_1111;
                    2'd1: digit_sel <= 8'b1101_1111;
                    2'd2: digit_sel <= 8'b1011_1111;
                    2'd3: digit_sel <= 8'b0111_1111;
                endcase

                if (!busy)
                    start <= 1;
            end else begin
                start <= 0;
            end
        end
    end
endmodule
