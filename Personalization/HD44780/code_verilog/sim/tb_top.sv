`timescale 1ns/1ps
module tb_top;
    reg clk = 0;
    reg rst = 1;
    wire lcd_rs, lcd_rw, lcd_en;
    wire [3:0] lcd_data;

    // Instantiate top module
    top uut (
        .clk(clk),
        .rst(rst),
        .lcd_rs(lcd_rs),
        .lcd_rw(lcd_rw),
        .lcd_en(lcd_en),
        .lcd_data(lcd_data)
    );

    // Clock 100 MHz
    always #5 clk = ~clk;

    initial begin
        $dumpfile("lcd_tb.vcd");
        $dumpvars(0, tb_top);
        #100 rst = 0;
        #1000000 $finish;
    end
endmodule
