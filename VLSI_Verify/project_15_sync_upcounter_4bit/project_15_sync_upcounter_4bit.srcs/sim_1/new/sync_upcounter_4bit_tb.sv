`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/26/2025 09:13:45 PM
// Design Name: 
// Module Name: sync_upcounter_4bit_tb
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


module sync_upcounter_4bit_tb();
    reg clk, rst_p;
    wire [3:0] Q;

    // Instantiate DUT
    sync_upcounter_4bit uut (.clk(clk),.rst_p(rst_p),.Q(Q));

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // Stimulus
    initial begin
        // Reset ban đầu
        rst_p = 0;
        #12 rst_p = 1;   // release reset

        // Run trong 200ns
        #200;

        // Reset lại
        rst_p = 0;
        #10 rst_p = 1;
        #100 $finish;
    end

    // Monitor output
    initial begin
        $monitor("Time=%d \t | CLK=%b \t | Q=%b", $time, clk, Q);
    end
endmodule
