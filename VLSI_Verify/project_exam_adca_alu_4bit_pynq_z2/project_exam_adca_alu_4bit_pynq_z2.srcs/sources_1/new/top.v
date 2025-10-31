`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/02/2025 04:49:54 PM
// Design Name: 
// Module Name: top
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: Top-level design connecting ALU, bin2bcd, and seg7_control.
//              Takes input from switches, displays result on 7-seg.
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


// Top module integrating ALU, BCD conversion, and 7-segment control
module top(
    input  wire clk,
    input  wire rst,
    input  wire en,
    input  wire [3:0] A,
    input  wire [3:0] B,
    input  wire [1:0] op,
    output wire [6:0] seg,
    output wire [3:0] an,
    output wire ack,
    output wire signed [5:0] result
    );

    wire signed [5:0] result_t;
    wire sign; 
    wire [3:0] tens, ones;
    
    alu alu_u(.A(A), .B(B), .op(op), .result(result_t), .en(en), .ack(ack));
    bin2bcd b2b(.bin(result_t), .sign(sign), .tens(tens), .ones(ones));
    seg7_driver drv(.clk(clk), .rst(rst), .sign(sign), .tens(tens), .ones(ones), .an(an), .seg(seg));
    
    assign result = result_t;
    
endmodule

