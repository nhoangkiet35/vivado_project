`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/09/2025 03:28:24 PM
// Design Name: 
// Module Name: led_toggle
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

/*
 * Trong mạch hoạt động theo cạnh xung clock (posedge i_clk), các biến kiểu reg (như 
 * prev_switch) chỉ được cập nhật sau khi toàn bộ khối always kết thúc — tức là 
 * ở cuối chu kỳ clock hiện tại.
 *
 * Khi clock vừa lên cạnh (posedge i_clk):
 * 1. FPGA đọc giá trị hiện tại của i_switch_1 và giá trị cũ của prev_switch.
 * 2. Dùng hai giá trị này để kiểm tra điều kiện if (~i_switch_1 & prev_switch).
 * 3. Sau đó cuối chu kỳ clock, prev_switch mới được cập nhật bằng i_switch_1.
*/ 
module led_toggle (
    input  wire i_clk,
    input  wire i_switch_1,
    output wire o_led_1
);

    reg r_led_1 = 1'b0;
    reg r_switch_1 = 1'b0;

    always @(posedge i_clk) begin
        r_switch_1 <= i_switch_1;

        // Toggle LED on falling edge of switch
        if (~i_switch_1 && r_switch_1)
            r_led_1 <= ~r_led_1;
    end

    assign o_led_1 = r_led_1;
endmodule
