`timescale 1ns / 1ps

module top(
    input clk_100MHz_t,        // 100MHz
    input rst_n_t,      // reset
    input button_t,     // button từ Basys3
    output [6:0] sseg_t, // LED 7 đoạn
    output [3:0] digit_t
);
    wire btn_debounced;
    wire [3:0] wire_count;

    btn_debounce IC1(
        .clk(clk_100MHz_t),
        .btn_in(button_t),
        .btn_out(btn_debounced)
    );

    counter_4bit IC2(
        .clk(btn_debounced),
        .rst_n(rst_n_t),
        .count(wire_count)
    );

    LED_7Seg_SW IC3(
        .count(wire_count),
        .sseg(sseg_t),
        .digit(digit_t)
    );
endmodule
