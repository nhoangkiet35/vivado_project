`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/21/2025 07:39:52 PM
// Design Name: 
// Module Name: freq_div_100Mhz_to_1Hz_tb
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


module freq_div_100Mhz_to_1Hz_tb;
    reg clk_in;
    reg rst_n;
    wire clk_out;
    
    // Khởi tạo module chia tần số
    clk_divider_1hz uut (
        .clk_100MHz(clk_in),
        .rst_n(rst_n),
        .clk_1Hz(clk_out)
    );
    
    // Tạo xung đồng hồ 100MHz (chu kỳ 10ns)
    always #5 clk_in = ~clk_in;
    
    initial begin
        // Khởi tạo tín hiệu
        clk_in = 0;
        rst_n = 0;
        #20 rst_n = 1; // Nhả reset sau 20ns
        
        // Chạy mô phỏng trong khoảng 1s để quan sát clk_out
        #1_000_000_000;
        
        // Kết thúc mô phỏng
        $stop;
    end
    
    // Xuất trạng thái tín hiệu
    initial begin
        $monitor("Time = %0t, clk_out = %b", $time, clk_out);
    end
endmodule
