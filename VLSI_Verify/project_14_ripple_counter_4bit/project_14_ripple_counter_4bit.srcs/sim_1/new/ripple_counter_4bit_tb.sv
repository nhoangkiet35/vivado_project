`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/26/2025 08:08:46 PM
// Design Name: 
// Module Name: ripple_counter_4bit_tb
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


module ripple_counter_4bit_tb();
    logic clk;
    logic rst_p;
    logic [3:0] Q;

    // Instantiate the counter
    ripple_counter_4bit uut (.clk(clk), .rst_p(rst_p), .Q(Q));

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk;  // T clock = 10ns
    end

    // Simulus
    initial begin
        rst_p = 0; #10;     // reset counter
        rst_p = 1; #200;    // release reset
        
        rst_p = 0; #10;     // reset again
        rst_p = 1; #100;
        $stop;
    end

    // Monitor output
    initial begin
        $monitor("Time=%0t \t | RST=%b \t | Q=%b", $time, rst_p, Q);
    end
endmodule
