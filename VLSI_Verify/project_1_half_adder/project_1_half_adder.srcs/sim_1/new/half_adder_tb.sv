`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/18/2025 07:40:54 PM
// Design Name: 
// Module Name: half_adder_tb
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


module half_adder_tb();
	reg a, b;
	wire s,c;

	half_adder_df fa_dut(a,b,s,c);
	
	initial begin
	   	$monitor("time=%d \t a=%b \t b=%b \t s=%b \t c=%b",$time,a,b,s,c);
		// TC1: {a,b}=2'b00		
        a = 0; b = 0; #10;
        // TC2: {a,b}=2'b01
        a = 0; b = 1; #10;
        // TC3: {a,b}=2'b10
        a = 1; b = 0; #10;
        // TC4: {a,b}=2'b11
        a = 1; b = 1; #10;
        $stop;
	end
endmodule
