`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/09/2025 04:31:37 PM
// Design Name: 
// Module Name: demux
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


module demux_1_to_4 (
    input  wire i_data,
    input  wire [1:0] i_sel,
    output wire [3:0] o_data
);
    assign o_data[0] = (i_sel == 2'b00) ? i_data : 1'b0;
    assign o_data[1] = (i_sel == 2'b01) ? i_data : 1'b0;
    assign o_data[2] = (i_sel == 2'b10) ? i_data : 1'b0;
    assign o_data[3] = (i_sel == 2'b11) ? i_data : 1'b0;
    // assign o_data = (i_data == 1'b1) ? (4'b0001 << i_sel) : 4'b0000;
endmodule
