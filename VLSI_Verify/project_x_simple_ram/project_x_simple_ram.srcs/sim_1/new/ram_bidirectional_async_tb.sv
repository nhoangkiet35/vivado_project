`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/27/2025 09:04:46 PM
// Design Name: 
// Module Name: ram_bidirectional_async_tb
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


module ram_bidirectional_async_tb();
    reg clk, we;
    reg [9:0] addr;
    reg [7:0] din, dout;

    ram_bidirectional_async uut (.clk(clk), .we(we), .addr(addr), .din(din), .dout(dout));
    
    always #5 clk = ~clk;

    initial begin
        clk = 0; we = 0; addr = 0; din = 0; #3;

        // Ghi dữ liệu vào RAM
        #10; we = 1; addr = 4'h2; din = 8'hAA;   // ghi 0xAA vào ô 2
        #10; we = 1; addr = 4'h5; din = 8'h55;   // ghi 0x55 vào ô 5
        #10; we = 0;

        // Đọc dữ liệu từ RAM
        #10; addr = 4'h2;           // đọc ô 2 -> 0xAA
        #10; addr = 4'h5;           // đọc ô 5 -> 0x55

        #20 $finish;
    end
endmodule
