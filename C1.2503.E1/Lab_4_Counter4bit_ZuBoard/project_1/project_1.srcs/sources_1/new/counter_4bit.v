`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/23/2025 07:49:09 PM
// Design Name: 
// Module Name: counter_4bit
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


module counter_4bit(
    input clk,              // Đồng hồ
    input rst_n,            // Reset (tích cực mức thấp)
    output reg [3:0] count  // Giá trị bộ đếm 4 bit
);
    // Quy trình đếm, mỗi lần có tín hiệu đồng hồ
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)          // Nếu reset thì giá trị bộ đếm là 0
            count <= 4'b0000;
        else                 // Nếu không có reset, tăng giá trị bộ đếm
            count <= count + 1;
    end


endmodule
