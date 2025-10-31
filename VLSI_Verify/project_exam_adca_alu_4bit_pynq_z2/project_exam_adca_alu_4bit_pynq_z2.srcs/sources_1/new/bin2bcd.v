`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/02/2025 04:41:50 PM
// Design Name: 
// Module Name: bin2bcd
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: Convert binary number (up to 5 bits) into 2-digit BCD (tens, ones)
// Uses shift-and-add-3 algorithm (double dabble).
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


// Module to convert 5-bit binary magnitude to two BCD digits (tens and ones)
module bin2bcd(
    input  wire signed [5:0] bin,   // -15 → 15
    output reg        sign,         // 1 = âm
    output reg [3:0]  tens,
    output reg [3:0]  ones
    );
    
    reg [5:0] abs_val;
    
    always @(*) begin
        // kiểm tra dấu
        if(bin < 0) begin
            sign = 1;
            abs_val = -bin;
        end else begin
            sign = 0;
            abs_val = bin;
        end

        // chỉ hiển thị tối đa 2 chữ số (từ -15 đến 15)
        tens = abs_val / 10;
        ones = abs_val % 10;
    end

endmodule


