`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/30/2025 03:46:04 PM
// Design Name: 
// Module Name: tb_traffic_light
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


module tb_traffic_light();
    reg clk;
    reg rst;
    wire R1, Y1, G1, R2, Y2, G2;

    // Kết nối với module UUT (Unit Under Test)
    traffic_light_controller uut (
        .clk(clk),
        .rst(rst),
        .R1(R1), .Y1(Y1), .G1(G1),
        .R2(R2), .Y2(Y2), .G2(G2)
    );

    always #50 clk = ~clk;

    // Mô phỏng chính
    initial begin
        // Bước 1: Reset hệ thống
        clk = 0;
        rst = 1;
        #200;        // giữ reset trong 200ns
        rst = 0;

        // Bước 2: Mô phỏng trong khoảng thời gian đủ dài để qua hết 4 trạng thái
        #100_000;       // chạy mô phỏng

        // Kết thúc
        $display("Simulation completed.");
        $finish;
    end

    // In trạng thái LED ra terminal
    initial begin
        $monitor("Time=%0dns | R1=%b Y1=%b G1=%b || R2=%b Y2=%b G2=%b",
                 $time, R1, Y1, G1, R2, Y2, G2);
    end

endmodule
