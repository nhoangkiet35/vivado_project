`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/12/2025 06:45:11 PM
// Design Name: 
// Module Name: top
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


module top(
    input clk_t,
    input rst_p_t,
    input btn_up_t,
    input btn_down_t,
    output [3:0] digit_t,
    output [6:0] sseg_t
    );
    wire btn_up_db, btn_down_db;
    wire btn_up_tick, btn_down_tick;
    wire [3:0] count_t;
    
    debounce IC1(.clk(clk_t), .rst_p(rst_p_t), .btn_in(btn_up_t), .btn_out(btn_up_db));
    debounce IC2(.clk(clk_t), .rst_p(rst_p_t), .btn_in(btn_down_t), .btn_out(btn_down_db));
    
    btn_pulse IC3(.clk(clk_t), .rst_p(rst_p_t), .btn_level(btn_up_db), .btn_tick(btn_up_tick)
);
    btn_pulse IC4(.clk(clk_t), .rst_p(rst_p_t), .btn_level(btn_down_db), .btn_tick(btn_down_tick));

    counter_4bit IC5(
.clk(clk_t), .rst_p(rst_p_t), .bnt_down(btn_down_tick), .bnt_up(btn_up_tick), .count(count_t)
);
    led_7seg IC6(.count(count_t), .sseg(sseg_t), .digit(digit_t)
);
    
endmodule
