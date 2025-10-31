`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/07/2025 07:47:13 PM
// Design Name: 
// Module Name: alu_display_top
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


module alu_display_top(
    input  wire clk,      // 100 MHz from board
    input  wire rst,      // active high
    input  wire en,
    input  wire [3:0] swA,
    input  wire [3:0] swB,
    input  wire [1:0] opcode, // choose ALU operation
//    output wire signed [5:0] alu_result,
    output wire SCLK,
    output wire RCLK,
    output wire DIO
    );

    // instantiate ALU
    wire signed [5:0] alu_result;
    wire ack;
    
    alu u_alu (
        .A(swA),
        .B(swB),
        .op(opcode),
        .en(en),
        .ack(ack),
        .result(alu_result)
    );

    // compute abs value and sign
    wire is_negative;
    reg [5:0] abs_val;
    assign is_negative = (alu_result < 0);

    always @(*) begin
        if (alu_result < 0)
            abs_val = -alu_result;
        else
            abs_val = alu_result;
    end

    // split into decimal digits (since abs_val <= 15 normally)
    reg [3:0] digit_units;
    reg [3:0] digit_tens;
    reg [3:0] digit_hundreds;
    reg [3:0] digit_thousands; // used for minus sign if negative

    always @(*) begin
        // default
        digit_units = 4'd0;
        digit_tens = 4'd0;
        digit_hundreds = 4'd10;
        digit_thousands = 4'd10;

        // compute tens/units
        digit_tens = (abs_val / 10) % 10;
        digit_units = abs_val % 10;


        // thousands position used for minus sign if negative
        if (is_negative) begin
            // we use reserved code 4'hF to mean '-'
            digit_thousands = 4'hF;
        end
    end

    // connect to your existing digit_scan (expects d0..d3)
    // In your existing code: d0 = units, d1 = tens, d2 = hundreds, d3 = thousands
    digit_scan show (
        .clk(clk),
        .rst(rst),
        .d0(digit_units),
        .d1(digit_tens),
        .d2(digit_hundreds),
        .d3(digit_thousands),
        .SCLK(SCLK),
        .RCLK(RCLK),
        .DIO(DIO)
    );

endmodule

