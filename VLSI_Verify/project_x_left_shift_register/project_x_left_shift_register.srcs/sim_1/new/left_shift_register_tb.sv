`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/25/2025 09:22:46 PM
// Design Name: 
// Module Name: left_shift_register_tb
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


module left_shift_register_tb();
	reg clk, rst_p, Din;
	wire [3:0] Q;
	
    left_shift_register uut(.clk (clk), .rst_p(rst_p), .Din(Din), .Q(Q));
    always #5 clk = ~clk;
	
	initial begin
		clk = 0;
		Din = 1;
		rst_p = 0; #7;

		rst_p = 1; #10;

		Din = 1; #20;
		Din = 0; #20;
		Din = 0; #20;
		Din = 1; #20;
		
		Din = 1; #20;
		Din = 1; #20;
		Din = 0; #20;
		Din = 0; #20;
		
		$finish;
	end
endmodule
