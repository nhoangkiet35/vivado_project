`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/20/2025 06:08:05 PM
// Design Name: 
// Module Name: full_subtractor_tb
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


module full_subtractor_tb();
    reg a, b, Bin;
    wire D, Bout;
    
    full_subtractor fs_dut(a, b, Bin, D, Bout);
    
    initial begin
		$monitor("time=%d \t a=%b \t b=%b \t Bin=%b \t D=%b \t Bout=%b",$time,a,b,Bin,D,Bout);
         a = 0; b = 0; Bin = 0; #10;
         a = 0; b = 0; Bin = 1; #10;
         a = 0; b = 1; Bin = 0; #10;
         a = 0; b = 1; Bin = 1; #10;
         a = 1; b = 0; Bin = 0; #10;
         a = 1; b = 0; Bin = 1; #10;
         a = 1; b = 1; Bin = 0; #10;
         a = 1; b = 1; Bin = 1; #10;
        $stop;
	end
endmodule
