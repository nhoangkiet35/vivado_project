`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module: pwm_generator
// Mô tả: So sánh counter với duty để tạo tín hiệu PWM
//////////////////////////////////////////////////////////////////////////////////
module pwm_generator #(
    parameter integer WIDTH = 8     // Độ rộng bộ đếm
)(
    input  wire clk,                // Clock 100 MHz
    input  wire rst,
    input  wire [WIDTH-1:0] duty,   // Giá trị duty (0..MAX)
    output reg  pwm_out
);
    // MAX count (tần số PWM = clk_freq / MAX)
    localparam integer MAX = (1 << WIDTH) - 1;

    reg [WIDTH-1:0] counter = 0;

    always @(posedge clk or posedge rst) begin
        if (rst)
            counter <= 0;
        else if (counter == MAX)
            counter <= 0;
        else
            counter <= counter + 1;
    end

    always @(posedge clk or posedge rst) begin
        if (rst) 
            pwm_out <= 0;
        else 
            pwm_out <= (counter < duty);
    end
endmodule
