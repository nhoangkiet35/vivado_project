`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/26/2025 06:54:06 PM
// Design Name: 
// Module Name: t_ff
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


module t_ff(
    input clk,
    input rst_p, // async active-low reset
    input T,
    output reg Q
    );
    always @ (posedge clk or negedge rst_p) begin
        if(!rst_p) Q <= 1'b0;
        else Q <= T ? ~Q : Q;
    end
endmodule
