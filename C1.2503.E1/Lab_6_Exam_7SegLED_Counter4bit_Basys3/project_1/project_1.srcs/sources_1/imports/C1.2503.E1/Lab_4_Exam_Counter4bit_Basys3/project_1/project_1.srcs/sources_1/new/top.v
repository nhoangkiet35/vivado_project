`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/23/2025 07:17:09 PM
// Design Name: 
// Module Name: top
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



module top(
    input clk_100MHz_t,
    input rst_n_t,
    output [3:0] digit_t,
    output [6:0] sseg_t
    );
    
    wire wire_clk_1Hz;
    wire [3:0] wire_count;
    
    clk_divider_1hz IC1 (
        .clk_100MHz(clk_100MHz_t),
        .rst_n(rst_n_t),
        .clk_1Hz(wire_clk_1Hz)
    );
    
    counter_4bit IC2 ( 
        .clk(wire_clk_1Hz), 
        .rst_n(rst_n_t), 
        .count(wire_count)
    );
    
    LED_7Seg IC3 (
        .count(wire_count),
        .sseg(sseg_t),
        .digit(digit_t)
    );
endmodule
