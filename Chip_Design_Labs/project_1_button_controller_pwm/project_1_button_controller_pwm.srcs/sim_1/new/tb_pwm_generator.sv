`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/30/2025 02:06:06 PM
// Design Name: 
// Module Name: tb_pwm_generator
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


module tb_pwm_generator();
    reg clk_1khz;
    reg en;               // enable active-low
    reg [3:0] duty;
    wire pwm;

    // Instance của DUT (Device Under Test)
    pwm_generator uut (
        .clk_1khz(clk_1khz),
        .en(en),
        .duty(duty),
        .pwm(pwm)
    );
    // Tạo clock 1kHz (chu kỳ 1ms)
    initial begin
        clk_1khz = 0;
        forever #0.5 clk_1khz = ~clk_1khz; // 1kHz clock
    end
    // Mô phỏng thay đổi duty và enable
    initial begin
        $display("Time(us)\tEN_N\tDUTY\tPWM");
        $monitor("%6d\t%b\t%2d\t%b", $time, en, duty, pwm);

        // Giai đoạn 1: disable
        en = 1; duty = 0; #2;

        // Giai đoạn 2: bật PWM với duty = 4/16 = 25%
        en = 0; duty = 4'd4; #20;

        // Giai đoạn 3: duty = 8/16 = 50%
        duty = 4'd8; #20;

        // Giai đoạn 4: duty = 12/16 = 75%
        duty = 4'd12; #20;

        // Giai đoạn 5: duty = 15/16 ≈ 94%
        duty = 4'd15; #20;

        // Giai đoạn 6: tắt PWM
        en = 1; #20;

        $stop;
    end
endmodule
