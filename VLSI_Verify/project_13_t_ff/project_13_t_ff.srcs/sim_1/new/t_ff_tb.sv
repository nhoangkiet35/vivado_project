`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/26/2025 06:57:56 PM
// Design Name: 
// Module Name: t_ff_tb
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


module t_ff_tb();
    reg clk, rst_p, T;
    wire Q;
    
    t_ff uut(clk, rst_p, T, Q);
    
    always #5 clk = ~clk;
    // Task with arguments
    task set_T(input value, output reg T);
        begin
            @(posedge clk)
            // #7; // take delay
            T = value;
        end
    endtask
    
    initial begin
        $monitor("time=%d \t T=%b \t CLK=%b \t RST=%b \t Q=%b", $time, T, clk, rst_p, Q);
        clk = 0; T = 0; rst_p = 0; #10

        rst_p = 1;
        set_T(1, T); #20;

        set_T(0, T); #20;

        rst_p = 0; set_T(1, T); #30;
        rst_p = 1; #20;

        set_T(0, T);
        rst_p = 0; #10;
        rst_p = 1; #20;
    	$stop;
    end
endmodule
