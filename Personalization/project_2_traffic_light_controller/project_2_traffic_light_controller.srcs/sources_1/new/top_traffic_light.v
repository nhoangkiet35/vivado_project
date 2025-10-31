`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/30/2025 04:32:15 PM
// Design Name: 
// Module Name: top_traffic_light
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


`timescale 1ns / 1ps
module top_traffic_light(
    input  wire clk100mhz,  // clock hệ thống
    input  wire btn_reset,  // nút reset
    output wire [2:0] leds1, // {R1,Y1,G1}
    output wire [2:0] leds2  // {R2,Y2,G2}
);

    wire clk_1hz;

    // Bộ chia clock 100MHz -> 1Hz
    clk_divider div_inst (
        .clk_in(clk100mhz),
        .rst(btn_reset),
        .clk_out(clk_1hz)
    );

    // Bộ điều khiển đèn giao thông
    traffic_light_controller ctrl_inst (
        .clk(clk_1hz),
        .rst(btn_reset),
        .R1(leds1[2]), .Y1(leds1[1]), .G1(leds1[0]),
        .R2(leds2[2]), .Y2(leds2[1]), .G2(leds2[0])
    );

endmodule

