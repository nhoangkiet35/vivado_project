`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/25/2025 04:39:47 PM
// Design Name: 
// Module Name: alu_calc
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


module alu_calc (
    input  wire [3:0] A,
    input  wire [3:0] B,
    input  wire [1:0] opcode, // 00:+, 01:- (abs), 10:and, 11:or
    output reg  [4:0] result  // 5 bits
);
    always @(*) begin
        case (opcode)
            2'b00: result = A + B;
            2'b01: result = (A >= B) ? (A - B) : (B - A);
            2'b10: result = A & B;
            2'b11: result = A | B;
            default: result = 0;
        endcase
    end
endmodule
