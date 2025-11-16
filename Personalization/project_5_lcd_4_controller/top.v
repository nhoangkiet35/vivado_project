`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/31/2025 03:09:23 PM
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
	input clk, 
	output lcd_rs,
	output lcd_rw,
	output lcd_e, 
	output vo_pwm,
	output [11:8] sf_d
    ); 

	wire [7:0] char_mem_bus;
	wire [4:0] char_mem_addr;
	
	assign lcd_rw = 0;
	
	pwm_1hz(.clk(clk), .vo_pwm(vo_pwm));
	
	char_mem char_mem (char_mem_addr, char_mem_bus);
	lcd lcd_1602 (clk, lcd_rs, lcd_rw, lcd_e, sf_d, char_mem_addr, char_mem_bus);

endmodule

