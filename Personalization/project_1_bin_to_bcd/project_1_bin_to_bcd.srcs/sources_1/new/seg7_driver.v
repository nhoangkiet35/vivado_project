`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/03/2025 07:40:09 PM
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


module seg7_driver (
    input clk,                 // 100MHz
    input rst,                 // reset đồng bộ
    input [3:0] tens,
    input [3:0] ones,
    output reg [3:0] an,
    output reg [6:0] seg
);
    reg [1:0] digit_select;
    reg [15:0] refresh_counter;

    wire [6:0] seg_tens, seg_ones;

    seg7_decoder d1(.bcd(tens), .seg(seg_tens));
    seg7_decoder d0(.bcd(ones), .seg(seg_ones));

    // Counter chia clock
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            refresh_counter <= 0;
            digit_select <= 0;
        end else begin
            refresh_counter <= refresh_counter + 1;
            digit_select <= refresh_counter[15:14];
        end
    end

    // Multiplex chọn digit
    always @(*) begin
        an  = 4'b1111;
        seg = 7'b1111111;
        case(digit_select)
            2'b00: begin an = 4'b1110; seg = seg_ones; end
            2'b01: begin an = 4'b1101; seg = seg_tens; end
            2'b10: begin an = 4'b1011; seg = 7'b1111111; end
            2'b11: begin an = 4'b0111; seg = 7'b1111111; end
        endcase
    end
endmodule


