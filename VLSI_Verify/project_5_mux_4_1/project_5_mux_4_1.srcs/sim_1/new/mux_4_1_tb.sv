`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/20/2025 06:34:32 PM
// Design Name: 
// Module Name: mux_4_1_tb
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


module mux_4_1_tb();
    reg [3:0] I;
    reg [1:0] S;
    wire Y;

    mux_4_1 mux_dut(I, S, Y);

    initial begin
        $monitor("time=%d \t I=%b \t S=%b \t Y=%b",$time,S,I,Y);
        I = 4'b0101;
        S = 2'b00; #10;
        S = 2'b10; #10;
        S = 2'b01; #10;
        S = 2'b11; #10;
        S = 2'b01; #10;
        $stop;
    end
endmodule
