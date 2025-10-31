`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/30/2025 04:30:23 PM
// Design Name: 
// Module Name: clk_divider
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


// clk_divider.v - chia clock 100MHz xuống 1Hz (1 xung/giây)
module clk_divider(
    input  wire clk_in,    // 100MHz
    input  wire rst,       // active high
    output reg  clk_out    // 1Hz
);
    parameter DIVISOR = 100_000_000 / 2;  // nửa chu kỳ 0.5s

    reg [31:0] count;

    always @(posedge clk_in or posedge rst) begin
        if (rst) begin
            count <= 0;
            clk_out <= 0;
        end else if (count == DIVISOR - 1) begin
            count <= 0;
            clk_out <= ~clk_out;
        end else begin
            count <= count + 1;
        end
    end
endmodule
