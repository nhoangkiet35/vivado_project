`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/31/2025 03:08:23 PM
// Design Name: 
// Module Name: char_mem
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


module char_mem(
    input  [4:0] addr,
    output [7:0] bus
    );
	 
	parameter LINES = 2;
	parameter CHARS_PER_LINE = 16;
	parameter BITS_PER_CHAR = 8;
	parameter STR_SIZE = LINES * CHARS_PER_LINE * BITS_PER_CHAR;
	
	parameter [0:STR_SIZE-1] str = " Hello, world!   Spartan-3E LCD ";

//	assign bus = str[{addr[4:0], 3'b000}+:8];
	assign bus = str[(addr * 8) +: 8];
endmodule

