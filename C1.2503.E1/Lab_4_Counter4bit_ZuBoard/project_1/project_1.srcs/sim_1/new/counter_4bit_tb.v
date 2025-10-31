`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/23/2025 07:55:21 PM
// Design Name: 
// Module Name: counter_4bit_tb
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


module counter_4bit_tb;
    reg clk;
    reg rst_n;
    wire [3:0] count;
    
    // Khởi tạo bộ đếm 4 bit
    counter_4bit uut (
        .clk(clk), 
        .rst_n(rst_n), 
        .count(count)
    );
    
    // Tạo xung đồng hồ 10ns
    always #5 clk = ~clk;
    
    initial begin
        // Khởi tạo tín hiệu
        clk = 0;
        rst_n = 0;
        
        // Giữ reset trong một khoảng thời gian
        #10 rst_n = 1;
        
        // Chạy mô phỏng trong 200ns
        #1000;
        
        // Kết thúc mô phỏng
        $stop;
    end
    
    // Xuất giá trị của bộ đếm ra terminal
    initial begin
        $monitor("Time = %0t, Count = %b", $time, count);
    end
endmodule

