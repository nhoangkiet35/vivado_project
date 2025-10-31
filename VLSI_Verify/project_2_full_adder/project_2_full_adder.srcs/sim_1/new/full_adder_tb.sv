`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/18/2025 08:25:14 PM
// Design Name: 
// Module Name: full_adder_tb
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


module full_adder_tb();
	reg a, b, cin;
	wire s,cout;

	full_adder fa_dut(a,b,cin,s,cout);

	initial begin
		$monitor("time=%d \t a=%b \t b=%b \t cin=%b \t s=%b \t cout=%b",$time,a,b,cin,s,cout);
		//{cin,a,b}=3'b000 
         a = 0; b = 0; cin = 0; #10;
        //{cin,a,b}=3'b001
         a = 0; b = 0; cin = 1; #10;
         //{cin,a,b}=3'b010
         a = 0; b = 1; cin = 0; #10;
         //{cin,a,b}=3'b011
         a = 0; b = 1; cin = 1; #10;
         //{cin,a,b}=3'b100
         a = 1; b = 0; cin = 0; #10;
         //{cin,a,b}=3'b101 
         a = 1; b = 0; cin = 1; #10;
         //{cin,a,b}=3'b110
         a = 1; b = 1; cin = 0; #10;
         //{cin,a,b}=3'b111
         a = 1; b = 1; cin = 1; #10;
         $stop;
	end
endmodule
