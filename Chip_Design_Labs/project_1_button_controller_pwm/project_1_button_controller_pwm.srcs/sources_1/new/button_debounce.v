`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/29/2025 10:26:19 PM
// Design Name: 
// Module Name: button_debounce
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


module button_debounce #(
    parameter CLK_FREQ = 100_000_000,   // 100MHz
    parameter DEBOUNCE_MS = 5           // T debounce (ms)
    )(
    input clk,
    input rst,
    input btn_n,            // nút nhấn active-low
    output reg btn_state    // tín hiệu đã lọc
    );
    localparam integer COUNT_MAX = (CLK_FREQ / 1000) * DEBOUNCE_MS; // ~500000 cho 5ms

    reg [$clog2(COUNT_MAX):0] counter = 0;
    reg btn_sync_0, btn_sync_1; // synchronunce 2 stages
    // Đồng bộ hóa vào clock
    always @(posedge clk) begin
        btn_sync_0 <= btn_n;
        btn_sync_1 <= btn_sync_0;
    end
    // Lọc nhiễu bằng counter
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            btn_state <= 1'b1; 
            counter   <= 0;
        end else if (btn_sync_1 != btn_state) begin
            // nếu trạng thái thay đổi -> đếm thời gian xác nhận
            counter <= counter + 1;
            if (counter >= COUNT_MAX) begin
                btn_state <= btn_sync_1;
                counter   <= 0;
            end
        end else
            counter <= 0;
    end
endmodule
