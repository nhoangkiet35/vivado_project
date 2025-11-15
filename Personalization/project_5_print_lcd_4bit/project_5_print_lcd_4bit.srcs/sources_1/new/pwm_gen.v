// pwm_gen.v
// Generic PWM. Input duty is N-bit unsigned (0 = 0%, max = 100%).
`timescale 1ns/1ps
module pwm_gen #(
    parameter COUNTER_WIDTH = 16  // width of internal counter; controls PWM resolution
)(
    input  wire clk,
    input  wire rstn,
    input  wire [COUNTER_WIDTH-1:0] duty, // duty (0..2^W-1)
    output reg  pwm_out
);
    reg [COUNTER_WIDTH-1:0] cnt;
    always @(posedge clk or negedge rstn) begin
        if (!rstn) begin
            cnt <= 0;
            pwm_out <= 0;
        end else begin
            cnt <= cnt + 1'b1;
            pwm_out <= (cnt < duty) ? 1'b1 : 1'b0;
        end
    end
endmodule
