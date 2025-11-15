`timescale 1ns/1ps

module tb_top_single;
    // Clock và reset
    logic clk;
    logic reset_n;

    // Output từ top module
    wire data_out;

    // Instantiate DUT (Device Under Test)
    top_single dut (
        .clk        (clk),
        .rst_n      (reset_n),  // nếu module bạn dùng active-high reset
        .led_data   (data_out)
    );

    // Clock 125 MHz (chu kỳ 8 ns)
    initial clk = 0;
    always #4 clk = ~clk;

    // Reset sequence
    initial begin
        reset_n = 0;
        #100;
        reset_n = 1;
    end

    // Dump waveform cho GTKWave / Vivado / ModelSim
    initial begin
        $dumpfile("tb_top_single.vcd");
        $dumpvars(0, tb_top_single);
    end

    // In ra tín hiệu để theo dõi
    initial begin
        $display("[%0t] Simulation start", $time);
        #2000;
        $monitor("[%0t ns] data_out = %b", $time, data_out);
    end

    // Chạy mô phỏng trong 5 ms
    initial begin
        #5_000_000;  // 5 ms
        $display("[%0t] Simulation finished", $time);
        $finish;
    end

endmodule
