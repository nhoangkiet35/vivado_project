//==============================================================
// tb_ws2812_rainbow.sv
// Testbench cho top_ws2812_rainbow
// Clock: 125 MHz (8 ns chu kỳ)
//==============================================================
`timescale 1ns/1ps

module tb_ws2812_rainbow;
    //=======================
    // Tín hiệu testbench
    //=======================
    logic clk_125mhz;
    logic reset_btn;
    wire ws2812_data;

    //=======================
    // Khởi tạo DUT
    //=======================
    top_ws2812_rainbow dut (
        .clk_125mhz(clk_125mhz),
        .reset_btn(reset_btn),
        .ws2812_data(ws2812_data)
    );

    //=======================
    // Tạo clock 125 MHz
    //=======================
    initial clk_125mhz = 0;
    always #4 clk_125mhz = ~clk_125mhz; // 8 ns period = 125 MHz

    //=======================
    // Reset ban đầu
    //=======================
    initial begin
        reset_btn = 1;
        #100;
        reset_btn = 0;
        #200;
        reset_btn = 1;
    end

    //=======================
    // Ghi waveform để quan sát
    //=======================
    initial begin
        $dumpfile("tb_ws2812_rainbow.vcd");
        $dumpvars(0, tb_ws2812_rainbow);
    end

    //=======================
    // Giới hạn thời gian mô phỏng
    //=======================
    initial begin
        #1_500_000; // 1.5 ms mô phỏng (có thể tăng)
        $display("\n=== Simulation Complete ===");
        $finish;
    end

    //=======================
    // Monitor tín hiệu WS2812
    //=======================
    integer bit_count = 0;
    integer high_count = 0;
    integer low_count = 0;
    time t_high, t_low;

    always @(posedge ws2812_data) begin
        t_high = $time;
    end

    always @(negedge ws2812_data) begin
        t_low = $time;
        high_count = t_low - t_high;
    end

    always @(posedge clk_125mhz) begin
        if (ws2812_data)
            low_count = 0;
        else
            low_count += 1;

        // Phát hiện khoảng RESET (>=50µs)
        if (low_count >= 6250) begin
            $display("[%0t ns] --- WS2812 RESET detected ---", $time);
            low_count = 0;
        end
    end

    //=======================
    // Hiển thị log màu (theo timer nội bộ)
    //=======================
    // Vì ws2812_rainbow có fade_cnt tăng mỗi ~0.1s, ta in mỗi 1ms
    initial begin
        $display("Simulation start. Monitoring color updates...");
        repeat (50) begin
            #1_000_000; // 1 ms
            $display("[%0t ns] Fading rainbow colors...", $time);
        end
    end

endmodule
