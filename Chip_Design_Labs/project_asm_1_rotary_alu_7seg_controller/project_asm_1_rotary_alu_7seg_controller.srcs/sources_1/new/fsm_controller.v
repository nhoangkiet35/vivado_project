`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/25/2025 04:41:09 PM
// Design Name: 
// Module Name: fsm_controller
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


module fsm_controller (
    input clk,
    input rst,
    input rot_up,
    input rot_down,
    input sw_press,
    output reg  [1:0] state,   // 0..3
    output reg  [3:0] A,
    output reg  [3:0] B,
    output reg  [1:0] opcode
);
    localparam MINV = 4'd0;
    localparam MAXV = 4'd9;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            state <= 2'd0;
            A <= 4'd0;
            B <= 4'd0;
            opcode <= 2'd0;
        end else begin
            // rotation actions depend on state
            if (rot_up) begin
                case (state)
                    2'd0: if (A < MAXV) A <= A + 1;
                    2'd1: if (B < MAXV) B <= B + 1;
                    2'd2: opcode <= (opcode == 2'd3) ? 2'd0 : opcode + 1;
                    default: ;
                endcase
            end
            else if (rot_down) begin
                case (state)
                    2'd0: if (A > MINV) A <= A - 1;
                    2'd1: if (B > MINV) B <= B - 1;
                    2'd2: opcode <= (opcode == 2'd0) ? 2'd3 : opcode - 1;
                endcase
            end

            // return circle state pressed
            if (sw_press) begin
                if (state == 2'd3) state <= 2'd0;
                else state <= state + 1;
            end
        end
    end
endmodule
