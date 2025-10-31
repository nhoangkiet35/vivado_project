`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/26/2025 08:52:47 PM
// Design Name: 
// Module Name: sync_upcounter_4bit
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


module sync_upcounter_4bit(
    input clk,
    input rst_p,    // async active-low reset
    output [3:0] Q
    );
    // JK Flip-Flops: J=K=1 => Toggle
    wire J2 = Q[0] & Q[1];        // Q2 toggles when Q0 & Q1=1
    wire K2 = Q[0] & Q[1];

    wire J3 = Q[0] & Q[1] & Q[2]; // Q3 toggles when Q0&Q1&Q2=1
    wire K3 = Q[0] & Q[1] & Q[2];

    // Instantiate 4 JK Flip-Flops
    jk_ff IC_1(.clk(clk), .rst_p(rst_p), .J(1'b1), .K(1'b1), .Q(Q[0]));
    jk_ff IC_2(.clk(clk), .rst_p(rst_p), .J(Q[0]), .K(Q[0]), .Q(Q[1]));
    jk_ff IC_3(.clk(clk), .rst_p(rst_p), .J(J2)  , .K(K2)  , .Q(Q[2]));
    jk_ff IC_4(.clk(clk), .rst_p(rst_p), .J(J2)  , .K(K3)  , .Q(Q[3]));
endmodule
