`timescale 1ns/1ps

module tb_seven_seg_display;

    reg clk;
    reg rst_n;

    wire SER;
    wire SRCLK;
    wire RCLK;

    // Instantiate DUT (Device Under Test)
    seven_seg_display uut (
        .clk(clk),
        .rst_n(rst_n),
        .SER(SER),
        .SRCLK(SRCLK),
        .RCLK(RCLK)
    );

    // Clock 100 MHz -> 10 ns period
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // Reset logic
    initial begin
        rst_n = 0;
        #100;
        rst_n = 1;
    end

    // Simulation time
    initial begin
        // Run simulation for 10 ms
        #10_000_000;
        $finish;
    end

    // Monitor waveform
    initial begin
        $display("Simulation started...");
        $monitor("Time=%0t | SER=%b SRCLK=%b RCLK=%b", $time, SER, SRCLK, RCLK);
    end

endmodule
