`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/04/2025 01:52:12 AM
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


module top_tb();
    reg clk;
    reg rst;
    reg en;
    reg [3:0] A;
    reg [3:0] B;
    reg [1:0] op;
//    wire signed [5:0] result;
    wire SCLK;
    wire RCLK;
    wire DIO;
    
    // instantiate DUT
    alu_display_top uut (
        .clk(clk),
        .rst(rst),
        .swA(A),
        .swB(B),
        .opcode(op),
//        .alu_result(result),
        .en(en),
        .SCLK(SCLK),
        .RCLK(RCLK),
        .DIO(DIO)
    );

    // generate clock 100MHz (10ns period)
    always #5 clk = ~clk;

    initial begin
        // init
        clk = 0; rst = 1; en = 0;
        A = 0; B = 0; op = 0;
        
        #20 rst = 0; en = 1;

        // Test 1: A=5, B=7, op=00 (cộng)
        A = 4'd5; B = 4'd7; op = 2'b00;
        #10;   // đợi 100us

        // Test 2: A=8, B=2, op=01 (trừ)
        A = 4'd8; B = 4'd2; op = 2'b01;
        #10;

        // Test 3: A=5, B=3, op=10 (AND)
        A = 4'd5; B = 4'd3; op = 2'b10;
        #10;

        // Test 4: A=6, B=3, op=11 (OR)
        A = 4'd6; B = 4'd3; op = 2'b11;
        #10;

        $stop;
    end

endmodule

