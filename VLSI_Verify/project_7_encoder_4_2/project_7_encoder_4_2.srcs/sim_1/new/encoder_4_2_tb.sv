`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/20/2025 07:25:24 PM
// Design Name: 
// Module Name: encoder_4_2_tb
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


module encoder_4_2_tb();
    reg [3:0] I;
    wire [1:0] Y;
    
    encoder_4_2 encode_dut (I, Y);
    
    initial begin
		$monitor("time=%d \t I=%b \t Y=%b",$time,I,Y);
        I = 4'b0001; #10; // => 00
        I = 4'b0010; #10; // => 01
        I = 4'b0100; #10; // => 10
        I = 4'b1000; #10; // => 11
        $stop;
    end
endmodule
