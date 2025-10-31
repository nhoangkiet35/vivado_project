`timescale 1ns/1ps
module tb_sevenseg_driver_fade;

    reg clk, rst_n;
    wire SER, SRCLK, RCLK;

    sevenseg_driver_fade uut (
        .clk(clk),
        .rst_n(rst_n),
        .SER(SER),
        .SRCLK(SRCLK),
        .RCLK(RCLK)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 100 MHz
    end

    initial begin
        rst_n = 0;
        #100;
        rst_n = 1;
    end

    initial begin
        #10000000;
        $finish;
    end

endmodule
