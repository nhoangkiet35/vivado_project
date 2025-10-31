`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/09/2025 04:31:37 PM
// Design Name: 
// Module Name: demux_count_top
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


module demux_count_top (
    input  wire i_clk,
    input  wire [1:0] i_switch,
    output wire [3:0] o_led
);
    wire w_toggle;

    count_and_toggle u_counter (
        .i_clk(i_clk),
        .i_enable(1'b1),
        .o_toggle(w_toggle)
    );

    demux_1_to_4 u_demux (
        .i_data(w_toggle),
        .i_sel(i_switch),
        .o_data(o_led)
    );
endmodule
