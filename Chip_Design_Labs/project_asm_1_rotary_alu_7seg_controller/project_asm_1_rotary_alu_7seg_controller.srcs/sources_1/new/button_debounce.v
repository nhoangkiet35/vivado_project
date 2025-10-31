`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/25/2025 04:39:18 PM
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
    parameter CLK_FREQ = 100_000_000,
    parameter DEBOUNCE_MS = 20
)(
    input  wire clk,
    input  wire rst,
    input  wire btn_in,     // raw input, assumed pulled-up externally -> pressed = 0
    output reg  press_pulse // 1-clock pulse (clk) when press detected
);
    localparam integer MAX = (CLK_FREQ/1000) * DEBOUNCE_MS;
    reg [31:0] counter;
    reg stable;
    reg last_stable;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            counter <= 0;
            stable <= 1;
            last_stable <= 1;
            press_pulse <= 0;
        end else begin
            press_pulse <= 0;
            if (btn_in == stable) begin
                counter <= 0;
            end else begin
                if (counter < MAX) counter <= counter + 1;
                else begin
                    last_stable <= stable;
                    stable <= btn_in;
                    counter <= 0;
                    if (last_stable == 1 && stable == 0) begin
                        press_pulse <= 1; // falling edge stable -> pressed
                    end
                end
            end
        end
    end
endmodule

