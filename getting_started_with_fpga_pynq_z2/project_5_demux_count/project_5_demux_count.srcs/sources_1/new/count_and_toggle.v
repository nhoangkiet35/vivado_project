`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/09/2025 04:31:37 PM
// Design Name: 
// Module Name: count_and_toggle
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


module count_and_toggle #(
    parameter integer COUNT_LIMIT = 10
) (
    input  wire i_clk,
    input  wire i_enable,
    output reg  o_toggle = 1'b0
);
    // đảm bảo counter có giá trị khởi đầu hợp lệ
    localparam WIDTH = $clog2(COUNT_LIMIT);
    reg [WIDTH-1:0] r_counter = 0;

    always @(posedge i_clk) begin
        if (!i_enable) begin
            r_counter <= 0;
            o_toggle  <= 1'b0;
        end
        else if (r_counter == COUNT_LIMIT - 1) begin
            r_counter <= 0;
            o_toggle  <= ~o_toggle;
        end
        else
            r_counter <= r_counter + 1;
    end
endmodule
