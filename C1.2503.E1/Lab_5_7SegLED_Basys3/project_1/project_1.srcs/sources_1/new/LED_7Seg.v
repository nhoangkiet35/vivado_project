`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/26/2025 07:18:18 PM
// Design Name: 
// Module Name: LED_7Seg
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module LED_7Seg(
    input [3:0] count,
    output [6:0] sseg,
    output [3:0] digit
    );
    assign digit = 4'b1101; // output được gán phép gán giá trị
    
//  sai nên dúng binary wire count_internal = 4'd9; // Không thể gán giá trị trực tiếp input, nên thêm biến riêng reg gán số 9 (decimal)
    wire [3:0] count_internal = 4'b1001; // 9

    // sseg không thể gán giá trị trong always, nên thêm biến riêng reg    
    reg [6:0] ssegt;
    assign sseg = ssegt;
    
    always @ (*) begin
        case (count_internal)
            4'b0000: ssegt = 7'b1000000; // 0
            4'b0001: ssegt = 7'b1111001; // 1
            4'b0010: ssegt = 7'b0100100; // 2
            4'b0011: ssegt = 7'b0110000; // 3
            4'b0100: ssegt = 7'b0011001; // 4
            4'b0101: ssegt = 7'b0010010; // 5
            4'b0110: ssegt = 7'b0000010; // 6
            4'b0111: ssegt = 7'b1111000; // 7
            4'b1000: ssegt = 7'b0000000; // 8
            4'b1001: ssegt = 7'b0010000; // 9
            4'b1010: ssegt = 7'b0001000; // A
            4'b1011: ssegt = 7'b0000011; // b
            4'b1100: ssegt = 7'b1000110; // C 
            4'b1101: ssegt = 7'b0100001; // D 
            4'b1110: ssegt = 7'b0000110; // E
            4'b1111: ssegt = 7'b0001110; // F
            default: ssegt = 7'b1111111; // Blank
        endcase
    end
endmodule
