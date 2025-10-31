`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/09/2025 12:04:33 PM
// Design Name: 
// Module Name: switches_to_leds
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


module switches_to_leds (
    input  [3:0] i_switch,
    output [3:0] o_led
);
    assign o_led = i_switch;
endmodule
