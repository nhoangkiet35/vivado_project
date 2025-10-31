`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/29/2025 10:56:09 PM
// Design Name: 
// Module Name: pwm_fader
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


module pwm_fader #(
    parameter CLK_FREQ = 100_000_000,  // 100MHz
    parameter STEP_MS  = 50            // mỗi 50ms thay đổi 1 bước
    )(
    input clk,
    input rst,
    input [3:0] duty_target,            // giá trị từ controller
    output reg [3:0] duty_smooth
    );
    localparam integer COUNT_MAX = (CLK_FREQ / 1000) * STEP_MS;
    reg [$clog2(COUNT_MAX)-1:0] counter = 0;
    

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            counter     <= 0;
            duty_smooth <= 0;
        end else begin
            if (counter >= COUNT_MAX - 1) begin
                counter <= 0;
                // Dịch duty dần dần về duty_target
                if (duty_smooth < duty_target)
                    duty_smooth <= duty_smooth + 1;
                else if (duty_smooth > duty_target)
                    duty_smooth <= duty_smooth - 1;
            end else
                counter <= counter + 1;
        end
    end
endmodule
