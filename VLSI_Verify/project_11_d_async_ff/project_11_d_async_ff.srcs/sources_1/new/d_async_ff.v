`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/25/2025 06:50:08 PM
// Design Name: 
// Module Name: d_async_ff
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


module d_async_ff(
    input clk,
    input rst_p,
    input D,
    output reg Q
    );
    always @(posedge clk or negedge rst_p) begin
        if(!rst_p) Q <= 1'b0;
        else Q <= D;
    end
endmodule
