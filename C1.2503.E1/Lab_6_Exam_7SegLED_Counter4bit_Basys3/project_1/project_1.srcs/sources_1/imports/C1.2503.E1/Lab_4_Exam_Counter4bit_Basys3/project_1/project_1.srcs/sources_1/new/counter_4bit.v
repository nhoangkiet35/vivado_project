`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/23/2025 04:51:38 PM
// Design Name: 
// Module Name: counter_4bit
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


module counter_4bit( 
    input clk, 
    input rst_n, 
    output reg [3:0] count // Counter 4 bit 
    );
    always @ (posedge clk or negedge rst_n) begin 
        if(!rst_n) count <= 4'b0000; 
        else count <= count + 1; 
    end 
endmodule
