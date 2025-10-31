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
    input  wire clk,                 // clock 100MHz
    input  wire rst,                 // reset active high
    input  wire enc_a, enc_b,        // tín hiệu từ encoder
    output reg  step_up, step_down   // xung output
);
    // --- Hybrid reset:  2-stage synchronizers ---
    reg a_s1, a_s2;
    reg b_s1, b_s2;
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            a_s1 <= 0; a_s2 <= 0;
            b_s1 <= 0; b_s2 <= 0;
        end else begin
            a_s1 <= enc_a; a_s2 <= a_s1;
            b_s1 <= enc_b; b_s2 <= b_s1;
        end
    end
    
    // Lưu trạng thái hiện tại và trước đó của 2 bit A,B
    wire [1:0] ab = {a_s2, b_s2};

    // --- Theo dõi chuỗi 4 pha ---
    reg [1:0] last_ab;
    reg [2:0] seq_count;    // đếm số bước đã đi trong 1 chu kỳ
    reg direction;          // 1=CW, 0=CCW

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            last_ab   <= 2'b00;
            seq_count <= 0;
            direction <= 0;
            step_up   <= 0;
            step_down <= 0;
        end else begin
            step_up   <= 0;   // mặc định không phát xung
            step_down <= 0;

            // Nếu trạng thái A/B thay đổi
            if (ab != last_ab) begin
                // --- Xác định hướng quay ---
                // Khi A != B, hướng = (A xor last_B)
                direction <= (a_s2 ^ last_ab[0]);

                // Nếu khác trạng thái cũ => tăng bộ đếm bước
                seq_count <= seq_count + 1;
                last_ab   <= ab;

                // Nếu quay đủ 4 bước và quay về 00 => phát xung
                if (seq_count == 3 && ab == 2'b00) begin
                    if (direction) step_up <= 1;
                    else step_down <= 1;
                    seq_count <= 0;
                end
            end
        end
    end

endmodule
