`timescale 1ns / 1ps


module top (
    input clk_t,
    input rst_t,
    output [3:0] digit_t,   // segment pattern 0-9 
    output [6:0] sseg_t     // digit select signals
    );

    wire w_10Hz;
    wire [3:0] w_ones, w_tens, w_huns, w_ths;
    
    tenHz_gen(.clk_100MHz(clk_t), .reset(rst_t), .clk_10Hz(w_10Hz));
    
    digits(.clk_10Hz(w_10Hz), .reset(rst_t), .ones(w_ones), .tens(w_tens), .hundreds(w_huns), .thousands(w_ths));

    seg7_control(.clk_100MHz(clk_t), .reset(rst_t), .ones(w_ones), .tens(w_tens), .hundreds(w_huns), .thousands(w_ths),
        .sseg(sseg_t),      
        .digit(digit_t)     
    );

endmodule