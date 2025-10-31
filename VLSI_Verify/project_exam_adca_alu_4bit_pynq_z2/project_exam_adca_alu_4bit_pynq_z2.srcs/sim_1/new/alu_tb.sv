`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/02/2025 04:52:20 PM
// Design Name: 
// Module Name: alu_tb
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


module alu_tb();
    reg [3:0] a, b;
    reg en;
    reg [1:0] opcode;
    wire [4:0] magnitude;
    wire sign;
    wire ack;
    
    // Instantiate the ALU
    alu u_alu (
        .a(a),
        .b(b),
        .en(en),
        .opcode(opcode),
        .magnitude(magnitude),
        .sign(sign),
        .ack(ack)
    );
    
    initial begin
        // Initialize inputs
        a = 0; b = 0; en = 0; opcode = 0;
        
        // Test case 1: Enable off
        #20 en = 0;
        #10 $display("Test 1: en=0, magnitude=%b, sign=%b, ack=%b", magnitude, sign, ack);
        
        // Enable on
        en = 1;
        
        // Test case 2: Addition 5 + 3 = 8
        #10 a = 4'd5; b = 4'd3; opcode = 2'b00;
        #10 $display("Test 2: 5+3, magnitude=%d, sign=%b, ack=%b", magnitude, sign, ack);
        
        // Test case 3: Subtraction 5 - 3 = 2 (positive)
        #10 a = 4'd5; b = 4'd3; opcode = 2'b01;
        #10 $display("Test 3: 5-3, magnitude=%d, sign=%b, ack=%b", magnitude, sign, ack);
        
        // Test case 4: Subtraction 3 - 5 = 2 (negative)
        #10 a = 4'd3; b = 4'd5; opcode = 2'b01;
        #10 $display("Test 4: 3-5, magnitude=%d, sign=%b, ack=%b", magnitude, sign, ack);
        
        // Test case 5: AND 5 & 3 = 1
        #10 a = 4'd5; b = 4'd3; opcode = 2'b10;
        #10 $display("Test 5: 5&3, magnitude=%d, sign=%b, ack=%b", magnitude, sign, ack);
        
        // Test case 6: OR 5 | 3 = 7
        #10 a = 4'd5; b = 4'd3; opcode = 2'b11;
        #10 $display("Test 6: 5|3, magnitude=%d, sign=%b, ack=%b", magnitude, sign, ack);
        
        // Test case 7: Max addition 15 + 15 = 30
        #10 a = 4'd15; b = 4'd15; opcode = 2'b00;
        #10 $display("Test 7: 15+15, magnitude=%d, sign=%b, ack=%b", magnitude, sign, ack);
        
        // Test case 8: Subtraction 0 - 1 = 1 (negative)
        #10 a = 4'd0; b = 4'd1; opcode = 2'b01;
        #10 $display("Test 8: 0-1, magnitude=%d, sign=%b, ack=%b", magnitude, sign, ack);
        #20 $finish;
    end
endmodule
