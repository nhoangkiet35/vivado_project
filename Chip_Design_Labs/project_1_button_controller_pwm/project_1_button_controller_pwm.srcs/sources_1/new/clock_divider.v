`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/29/2025 10:42:50 PM
// Design Name: 
// Module Name: clock_divider
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


module clock_divider #(
    parameter DIVIDER = 100_000   // 100MHz / 100_000 = 1kHz = 1ms 
    )(
    input clk_in,
    input rst,
    output reg clk_out
    );
    reg [$clog2(DIVIDER)-1:0] count = 0;

    always @(posedge clk_in or posedge rst) begin
        if (rst) begin
            count   <= 0;
            clk_out <= 0;
        end else if (count == (DIVIDER/2 - 1)) begin
            clk_out <= ~clk_out;
            count   <= 0;
        end else
            count <= count + 1;
    end
endmodule
