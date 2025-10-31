`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/20/2025 05:48:22 PM
// Design Name: 
// Module Name: half_subtractor_tb
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


module half_subtractor_tb();
    reg a, b;
    wire D, B;

    half_subtractor fa_dut(a, b, D, B);

    initial begin
        $monitor("At time %0t: a=%b b=%b, difference=%b, borrow=%b",$time, a,b,D,B);
		//{a,b}=2'b00
        a = 0; b = 0; #10;
        //{a,b}=2'b01
        a = 0; b = 1; #10;
        //{a,b}=2'b10
        a = 1; b = 0; #10;
        //{a,b}=2'b11
        a = 1; b = 1; #10;
        $stop;
    end
endmodule
