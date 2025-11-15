`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/31/2025 03:15:32 PM
// Design Name: 
// Module Name: tb_top
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


module tb_top;
    reg clk = 0;
    wire lcd_rs, lcd_rw, lcd_en;
    wire [3:0] lcd_data;

    // Instantiate top module
    top uut (
        .clk(clk),
        .lcd_rs(lcd_rs),
        .lcd_rw(lcd_rw),
        .lcd_e(lcd_e),
        .sf_d(lcd_data)
    );

    // Clock 100 MHz
    always #5 clk = ~clk;

    initial begin
        $dumpfile("lcd_tb.vcd");
        $dumpvars(0, tb_top);
        #1000000 $finish;
    end
endmodule

