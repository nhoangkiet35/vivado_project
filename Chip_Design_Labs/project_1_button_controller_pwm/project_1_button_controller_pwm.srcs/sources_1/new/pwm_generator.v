`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/29/2025 10:36:55 PM
// Design Name: 
// Module Name: pwm_generator
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


/* mục tiêu: sinh ra một tín hiệu sóng vuông có chu kỳ cố định, nhưng độ rộng xung (duty cycle) thay đổi được.
 * Nó được dùng rất nhiều để điều khiển độ sáng LED, tốc độ động cơ, âm lượng, ...
*/
module pwm_generator(
    input clk_1khz,     // mỗi chu kỳ clock dài 1ms
    input en,           // enable active-low
    input [3:0] duty,
    output reg pwm
    );
    reg [3:0] counter = 0; // bộ đếm 4-bit (đếm 0..15)

    always @(posedge clk_1khz) begin
        if (!en) begin
            pwm <= 0; // LED sáng
        end else begin
            counter <= counter + 1;
            pwm <= (counter < duty) ? 1'b1 : 1'b0; // LED sáng thỏa điều kiện
        end
    end
endmodule
