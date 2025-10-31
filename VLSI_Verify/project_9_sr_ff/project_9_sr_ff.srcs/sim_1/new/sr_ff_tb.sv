`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/20/2025 08:58:59 PM
// Design Name: 
// Module Name: sr_ff_tb
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


module sr_ff_tb();
    reg clk = 0;
    reg S, R, rst_p;
    wire Q, Q_reverse;
    
    sr_ff sr_ff_uut (S, R, clk, rst_p, Q, Q_reverse);
    
    always #5 clk = ~clk;
    
    initial begin
        $monitor("time=%d \t S=%b \t R=%b \t CLK=%b \t RST=%b \t Q=%b \t Q'=%b", $time, S, R, clk, rst_p, Q, Q_reverse);
        S = 0; R = 0; #10;  // no changes
        S = 0; R = 1; #20;  // reset
        S = 0; R = 0; #20;  // no changes - HOLD SET
        S = 1; R = 0; #20;  // set
        S = 1; R = 1; #20;  // invalid
        S = 0; R = 0; #20;  // no changes - HOLD INVALID
        rst_p = 0; #20;
        $stop;
    end
endmodule
