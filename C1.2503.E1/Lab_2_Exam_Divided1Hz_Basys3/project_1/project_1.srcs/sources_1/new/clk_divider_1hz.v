`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/21/2025 07:37:34 PM
// Design Name: 
// Module Name: clk_divider_1hz
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


module clk_divider_1hz(
    input wire clk_100MHz,   
    input wire rst_n,        
    output reg clk_1Hz
);


    parameter DIVISOR = 100_000_000; 
    reg [26:0] counter;       


    always @(posedge clk_100MHz or negedge rst_n) begin
        if (~rst_n) begin
            counter <= 0;    
            clk_1Hz <= 0;    
        end else begin
            if (counter == (DIVISOR/2 - 1)) begin
                counter <= 0; 
                clk_1Hz <= ~clk_1Hz; 
            end else begin
                counter <= counter + 1; 
            end
        end
    end
endmodule

