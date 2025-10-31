`timescale 1ns / 1ps

module LED_7Seg_SW(
    input [3:0] count,     // số 4-bit
    output reg [6:0] sseg, // 7-seg (abcdefg)
    output [3:0] digit     // chọn digit (Basys3 có 4 LED 7 đoạn)
);
    assign digit = 4'b1110; // chỉ bật digit 0 (ngoài cùng bên phải)

    always @(*) begin
        case(count)
            4'd0: sseg = 7'b1000000; // 0
            4'd1: sseg = 7'b1111001; // 1
            4'd2: sseg = 7'b0100100; // 2
            4'd3: sseg = 7'b0110000; // 3
            4'd4: sseg = 7'b0011001; // 4
            4'd5: sseg = 7'b0010010; // 5
            4'd6: sseg = 7'b0000010; // 6
            4'd7: sseg = 7'b1111000; // 7
            4'd8: sseg = 7'b0000000; // 8
            4'd9: sseg = 7'b0010000; // 9
            4'd10: sseg = 7'b0001000; // A
            4'd11: sseg = 7'b0000011; // b
            4'd12: sseg = 7'b1000110; // C
            4'd13: sseg = 7'b0100001; // d
            4'd14: sseg = 7'b0000110; // E
            4'd15: sseg = 7'b0001110; // F
            default: sseg = 7'b1111111;
        endcase
    end
endmodule
