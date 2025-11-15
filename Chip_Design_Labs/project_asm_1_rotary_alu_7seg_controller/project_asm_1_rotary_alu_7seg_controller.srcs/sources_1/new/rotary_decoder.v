`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/25/2025 04:36:14 PM
// Design Name: 
// Module Name: rotary_decoder
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


// Mỗi chu kỳ (00→01→11→10→00) tạo 1 inc/dec duy nhất.
module rotary_decoder (
    input  wire clk,                 // clock 125 MHz
    input  wire rst,                 // reset active high
    input  wire enc_a, enc_b,        // tín hiệu từ encoder
    output reg  step_up, step_down   // xung output
);
    // 1) Đồng bộ tín hiệu chống metastability
    reg enc_a1, enc_a2, enc_b1, enc_b2;
    always @(posedge clk) begin
        enc_a1 <= enc_a;  enc_a2 <= enc_a1;
        enc_b1 <= enc_b;  enc_b2 <= enc_b1;
    end

    // 4 trạng thái hợp lệ: 00,01,11,10
    wire [1:0] curr = {enc_a2, enc_b2};
    reg  [1:0] prev;

    // accumulator đếm chuyển động liên tục
    // CW: +1 mỗi bước
    // CCW: -1 mỗi bước
    integer acc;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            prev       <= 2'b00;
            acc        <= 0;
            step_up   <= 0;
            step_down <= 0;
        end else begin
            step_up   <= 0;
            step_down <= 0;

            if (curr != prev) begin
                case ({prev, curr})
                    // ---- CW steps ----
                    4'b00_10, 4'b10_11, 4'b11_01, 4'b01_00:
                        acc <= acc + 1;

                    // ---- CCW steps ----
                    4'b00_01, 4'b01_11, 4'b11_10, 4'b10_00:
                        acc <= acc - 1;

                    // ---- Noise, glitch, bounce ----
                    default: acc <= 0;   // reset cycle
                endcase

                prev <= curr;

                // =============== FULL CYCLE FINISH (1 DETENT) ===============
                if (acc == 4) begin
                    step_up <= 1;
                    acc <= 0;
                end else if (acc == -4) begin
                    step_down <= 1;
                    acc <= 0;
                end
            end
        end
    end
endmodule
