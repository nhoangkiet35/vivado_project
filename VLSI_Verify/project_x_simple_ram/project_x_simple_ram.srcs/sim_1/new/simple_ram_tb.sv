`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/27/2025 07:15:37 PM
// Design Name: 
// Module Name: simple_ram_tb
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


module simple_ram_tb();
    reg clk, we, re;
    reg [9:0] addr;
    reg [7:0] din;
    wire [7:0] dout;

    // Khởi tạo RAM
    simple_ram uut (.clk(clk), .we(we), .re(re), .addr(addr), .din(din), .dout(dout));

    // Tạo xung clock
    always #5 clk = ~clk;

    initial begin
        // Khởi tạo tín hiệu
        clk = 0; we = 0; re = 0; addr = 0; din = 0;

        // Ghi dữ liệu vào một số ô nhớ
        #10;
        we = 1; addr = 10'h3; din = 8'hA5;  // ghi A5 vào ô địa chỉ 3
        #10;
        we = 1; addr = 10'h5; din = 8'h3C;          // ghi 3C vào ô địa chỉ 5
        #10;

        // Đọc lại dữ liệu
        we = 0; din = 8'hX;
        #10;
        re = 1; 
        addr = 10'h3;           // đọc địa chỉ 3 => A5
        #10;
        addr = 10'h5;           // đọc địa chỉ 5 => 3C
        #50;

        $finish;
    end
endmodule
