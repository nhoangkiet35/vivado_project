`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/23/2025 04:56:08 PM
// Design Name: 
// Module Name: tb_counter_4bit
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


module tb_counter_4bit;

    // Testbench signals
    reg rst_n_tb;
    reg clk_1Hz_tb;
    wire [3:0] count_tb;

    // Clock generation: 100MHz → period = 10ns
    initial begin
        clk_1Hz_tb = 0;
        forever #5 clk_1Hz_tb = ~clk_1Hz_tb;  // toggle every 5ns → 100MHz clock
    end

    // DUT Instantiation
    counter_4bit uut_counter (
        .clk(clk_1Hz_tb),
        .rst_n(rst_n_tb),
        .count(count_tb)
    );

    // Test stimulus
    initial begin
        // Dump waveforms for GTKWave or Vivado simulator
        $dumpfile("tb_counter_4bit.vcd");
        $dumpvars(0, tb_counter_4bit);

        // Apply reset
        rst_n_tb = 0;
        #20;                // Hold reset for 20ns
        rst_n_tb = 1;       // Release reset
        
        #200;

        // Apply reset again while running
        rst_n_tb = 0;
        #20;
        rst_n_tb = 1;
        
        // Run simulation long enough to see counter wrap-around
        #500;
        $finish;
    end

endmodule
