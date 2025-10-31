`timescale 1ns / 1ps
module tb_led_rgb_pwm;
    reg clk = 0;
    reg rst = 1;
    reg [15:0] red_duty, green_duty, blue_duty;
    wire led_r, led_g, led_b;

    led_rgb_pwm uut (
        .clk(clk),
        .rst(rst),
        .red_duty(red_duty),
        .green_duty(green_duty),
        .blue_duty(blue_duty),
        .led_r(led_r),
        .led_g(led_g),
        .led_b(led_b)
    );

    always #5 clk = ~clk; // 100 MHz clock

    initial begin
        #20 rst = 0;
        red_duty   = 16'h1000;
        green_duty = 16'h4000;
        blue_duty  = 16'h8000;
        #100000 $finish;
    end
endmodule
