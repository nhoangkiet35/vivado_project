`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/21/2025 08:56:43 PM
// Design Name: 
// Module Name: rotary_360
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


module rotary_360(
    input clk,               // clock hệ thống
    input rst_p,             // reset đồng bộ
    input A,                 // phase A (CLK pin)
    input B,                 // phase B (DT pin)
    output reg dir,          // 1 = CW, 0 = CCW
    output reg [3:0] led     // 4 LED hiển thị
    );

    // Lưu trạng thái hiện tại và trước đó của 2 bit A,B
    reg [1:0] prev_state, curr_state;
    // Đếm bước xoay step counter (0-3)
    reg [3:0] count;       

    always @(posedge clk or posedge rst_p) begin
        if (rst_p) begin
            prev_state <= 2'b00;
            curr_state <= 2'b00;
            count <= 4'd0;
            dir <= 1'b0;
        end else begin
            curr_state <= {A, B}; // đọc tín hiệu A,B hiện tại
            // Kiểm tra hướng quay dựa trên sự thay đổi giữa 2 trạng thái
            case ({prev_state, curr_state})
                // --- CW (Clockwise) ---
                4'b0010, // 00 -> 10
                4'b1011, // 10 -> 11
                4'b1101, // 11 -> 01
                4'b0100: // 01 -> 00
                    begin
                        dir <= 1'b1; // CW
                        count <= count + 1;
                    end
                // --- CCW (Counter-Clockwise) ---
                4'b0001, // 00 -> 01
                4'b0111, // 01 -> 11
                4'b1110, // 11 -> 10
                4'b1000: // 10 -> 00
                    begin
                        dir <= 1'b0; // CCW
                        count <= count - 1;
                    end
                default: ; // không thay đổi 
            endcase
            prev_state <= curr_state; // cập nhật trạng thái cũ
        end
    end

    // LED chạy vòng lặp theo count
    always @(posedge clk or posedge rst_p) begin
        if (rst_p)
            led <= 4'b0001;
        else begin
            case (count[1:0])  // chỉ lấy 2 bit thấp để tạo vòng lặp 0-3
                2'b00: led <= 4'b0001;
                2'b01: led <= 4'b0010;
                2'b10: led <= 4'b0100;
                2'b11: led <= 4'b1000;
            endcase
        end
    end
endmodule
