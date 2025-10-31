`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/03/2025 07:45:18 PM
// Design Name: 
// Module Name: top_tb
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


module tb_top;

    reg clk;
    reg rst;
    reg [3:0] ar;
    wire [3:0] an;
    wire [6:0] seg;

    top uut (
        .clk(clk),
        .rst(rst),
        .ar(ar),
        .an(an),
        .seg(seg)
    );

    // Clock 100MHz
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // Test stimulus
    initial begin
        rst = 1; ar = 4'b0000;
        #50 rst = 0;   // nhả reset sau 50ns

        // chạy từ 0 -> 15
        #10 ar = 4'b0001;
        #10 ar = 4'b0010;
        #10 ar = 4'b0011;
        #10 ar = 4'b0100;
        #10 ar = 4'b0101;
        #10 ar = 4'b0110;
        #10 ar = 4'b0111;
        #10 ar = 4'b0001;

        #20;
        $finish;
    end
endmodule

