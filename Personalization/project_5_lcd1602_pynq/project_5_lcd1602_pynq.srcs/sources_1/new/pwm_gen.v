module pwm_gen(
    input wire clk,
    output reg pwm_out
);
    reg [15:0] cnt = 0;

    always @(posedge clk) begin
        cnt <= cnt + 1;
        pwm_out <= cnt < 32768 ? 1'b0 : 1'b1;  // độ sáng 50%
    end
endmodule
