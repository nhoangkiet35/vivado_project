`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Top-level: LED sáng dần mỗi khi nhấn nút
// Board: PYNQ-Z2 (Clock 100 MHz)
//////////////////////////////////////////////////////////////////////////////////
module top_led_button_pwm (
    input  wire clk,     // 100 MHz clock
    input  wire rst,     // Nút reset (nếu có)
    input  wire btn,     // Nút nhấn
    output wire led      // LED điều khiển
);

    wire btn_state;
    wire [7:0] duty;

    // 1. Chống dội nút
    button_debounce debounce_inst (
        .clk(clk),
        .btn_in(btn),
        .btn_state(btn_state)
    );

    // 2. Điều khiển độ sáng
    brightness_ctrl brightness_inst (
        .clk(clk),
        .rst(rst),
        .btn_state(btn_state),
        .duty_value(duty)
    );

    // 3. Tạo PWM
    pwm_generator pwm_inst (
        .clk(clk),
        .rst(rst),
        .duty(duty),
        .pwm_out(led)
    );

endmodule
