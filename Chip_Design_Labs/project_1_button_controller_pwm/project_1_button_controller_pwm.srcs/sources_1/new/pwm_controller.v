`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/29/2025 10:34:16 PM
// Design Name: 
// Module Name: pwm_controller
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


module pwm_controller(
    input clk,
    input rst,
    input btn_up_n,
    input btn_down_n,
    output reg [3:0] duty
    );
    reg btn_up_prev, btn_down_prev;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            duty <= 4'd0;
            btn_up_prev   <= 1'b1;
            btn_down_prev <= 1'b1;
        end else begin
            if (!btn_up_n && btn_up_prev && duty < 4'd15)
                duty <= duty + 1;
            else if (!btn_down_n && btn_down_prev && duty > 4'd0)
                duty <= duty - 1;

            btn_up_prev   <= btn_up_n;
            btn_down_prev <= btn_down_n;
        end
    end
endmodule
