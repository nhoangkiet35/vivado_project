`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/29/2025 10:39:07 PM
// Design Name: 
// Module Name: top_pwm
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


module top_pwm(
    input clk_100MHz,
    input rst,
    input btn_up_n_raw,
    input btn_down_n_raw,
    input en,
    output pwm
    );
    wire [3:0] duty_target, duty_smooth;
    wire clk_1khz;
    wire btn_up_n_deb, btn_down_n_deb;

    // clock divider: 100MHz -> 1kHz
    clock_divider #(.DIVIDER(100_000)) u_div (
        .clk_in(clk_100MHz),
        .rst(rst),
        .clk_out(clk_1khz)
    );
    
    // debounce cho 2 nút
    button_debounce #(.CLK_FREQ(100_000_000), .DEBOUNCE_MS(5)) db_up (
        .clk(clk_100MHz),
        .rst(rst),
        .btn_n(btn_up_n_raw),
        .btn_state(btn_up_n_deb)
    );
    button_debounce #(.CLK_FREQ(100_000_000), .DEBOUNCE_MS(5)) db_down (
        .clk(clk_100MHz),
        .rst(rst),
        .btn_n(btn_down_n_raw),
        .btn_state(btn_down_n_deb)
    );
    
    // xác định duty_target
    pwm_controller u_ctrl (
        .clk(clk_100MHz),
        .rst(rst),
        .btn_up_n(btn_up_n_deb),
        .btn_down_n(btn_down_n_deb),
        .duty(duty_target)
    );
    
    // di chuyển dần dần về duty_target
    pwm_fader #(.CLK_FREQ(100_000_000), .STEP_MS(50)) u_fader (
        .clk(clk_100MHz),
        .rst(rst),
        .duty_target(duty_target),
        .duty_smooth(duty_smooth)
    );
    
    // pwm generator
    pwm_generator u_pwm (
        .clk_1khz(clk_1khz),
        .en(en),
        .duty(duty_smooth),
        .pwm(pwm)
    );
endmodule
