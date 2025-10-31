`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/26/2025 04:53:26 PM
// Design Name: 
// Module Name: d_sync_ff_tb
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


module d_sync_ff_tb();
    reg clk, rst_p, D;
    wire Q;

    d_sync_ff uut(clk, rst_p, D, Q);

    always #5 clk = ~clk;

    initial begin
        $monitor("time=%d \t D=%b \t CLK=%b \t RST=%b \t Q=%b", $time, D, clk, rst_p, Q);
        clk = 0; D = 0; rst_p = 0; #10
        rst_p = 1;
        D = 1; #20;

        D = 0; #20;

        // async reset assertion => Q async
        rst_p = 0; D = 1; #30;
        rst_p = 1; #20;

        // => Q no changes
        D = 0;
        rst_p = 0; #10;
        rst_p = 1; #20;
    	$stop;
    end
endmodule
