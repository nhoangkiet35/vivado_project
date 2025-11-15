`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/01/2025 08:30:06 PM
// Design Name: 
// Module Name: pwm_1hz
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


module pwm_1hz(
    input  clk,
    output vo_pwm    
    );
    // PWM 1Hz tạo tín hiệu điều chỉnh tương phản LCD
    reg [26:0] counter = 0;          // cần đếm tới 100_000_000 (27 bit là đủ)
    reg pwm_out = 0;
    parameter integer PERIOD = 100_000_000;  // 1Hz tại 100MHz
    parameter integer DUTY   = 30_000_000;   // duty 30%

    always @(posedge clk) begin
        if (counter < PERIOD - 1)
            counter <= counter + 1;
        else
            counter <= 0;

        pwm_out <= (counter < DUTY) ? 1'b1 : 1'b0;
    end

    assign vo_pwm = pwm_out;  // PWM đưa ra chân VO
endmodule
