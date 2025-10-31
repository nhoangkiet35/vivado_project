`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/02/2025 04:37:40 PM
// Design Name: 
// Module Name: alu
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 4-bit ALU (add, sub, AND, OR). For subtraction, outputs the
// absolute magnitude in a 5-bit bus and a sign flag (1 = negative, 0 = positive).
// This version is written to be synthesizable and safer for combinational logic.
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


// Module definition for the 4-bit ALU with sign handling for subtraction
module alu(
    input  wire [3:0] A,
    input  wire [3:0] B,
    input  wire [1:0] op,
    input  wire en,
    output reg ack,
    output reg  signed [5:0] result   // dùng 6 bit cho đủ (-15 đến 15)
    );
    
    always @(*) begin
        if (en == 0) begin
            result = 6'bZ; // Set result to high impedance (Z state)
            ack = 1'b0;
        end else begin 
            case(op)
                2'b00: result = A + B;     // cộng
                2'b01: result = A - B;     // trừ
                2'b10: result = A & B;     // AND
                2'b11: result = A | B;     // OR
                default: result = 0;
            endcase
            ack = 1'b1;
        end
    end
endmodule

