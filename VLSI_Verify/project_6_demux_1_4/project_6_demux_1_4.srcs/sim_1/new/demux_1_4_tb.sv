`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/20/2025 07:08:27 PM
// Design Name: 
// Module Name: demux_1_4_tb
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


module demux_1_4_tb();
    reg I;
    reg [1:0] S;
    wire [3:0] Y;
    
    demux_1_4 demux_dut(I, S, Y);
    
    initial begin
		$monitor("time=%d \t I=%b \t S=%b \t Y=%b",$time,I,S,Y);
		S = 2'b00; I=0; #10;
		S = 2'b00; I=1; #10;
		//...
		S = 2'b01; I=0; #10;
		S = 2'b01; I=1; #10;
		//...
		S = 2'b10; I=0; #10;
		S = 2'b10; I=1; #10;
		//...
		S = 2'b11; I=0; #10;
		S = 2'b11; I=1; #10;
		$stop;
    end
endmodule
