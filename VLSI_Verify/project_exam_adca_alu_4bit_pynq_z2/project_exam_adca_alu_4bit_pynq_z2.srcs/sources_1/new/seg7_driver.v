`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/04/2025 01:49:25 AM
// Design Name: 
// Module Name: seg7_driver
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


module seg7_driver(
    input  wire clk,
    input  wire rst,
    input  wire sign,
    input  wire [3:0] tens,
    input  wire [3:0] ones,
    output reg [3:0] an,
    output wire [6:0] seg
    );
    
    reg [1:0] digit_sel;
    reg [3:0] digit_val;
    reg dash;

    // clock divider để quét (tầm 1kHz)
    reg [15:0] cnt;
    always @(posedge clk or posedge rst) begin
        if(rst) cnt <= 0;
        else cnt <= cnt + 1;
    end
    always @(posedge clk or posedge rst) begin
        if(rst) digit_sel <= 0;
        else if(cnt == 0) digit_sel <= digit_sel + 1;
    end
    
    always @(*) begin
        dash = 0;
        case(digit_sel)
            2'b00: begin
                an = 4'b1110; digit_val = ones; dash=0;
            end
            2'b01: begin
                an = 4'b1101; digit_val = tens; dash=0;
            end
            2'b10: begin
                an = 4'b1011; digit_val = 4'd0; dash=sign; // hiển thị dấu trừ nếu âm
            end
            default: begin
                an = 4'b0111; digit_val = 4'd0; dash=0;
            end
        endcase
    end
    
    seg7_decoder decoder(.digit(digit_val), .dash(dash), .seg(seg));
    
endmodule

