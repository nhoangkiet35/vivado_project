module top(
    input clk_125MHz,
    input rst,
    input rotaryA,
    input rotaryB,
    output SCLK,
    output RCLK,
    output DIO
);
    wire up, down;
    wire [3:0] d0, d1, d2, d3;

    // decode rotary
    rotary_decoder u_rot(
        .clk(clk_125MHz),
        .rst(rst),
        .A(rotaryA),
        .B(rotaryB),
        .pulse_up(up),
        .pulse_down(down)
    );

    // counter
    rotary_counter u_cnt(
        .clk(clk_125MHz),
        .rst(rst),
        .pulse_up(up),
        .pulse_down(down),
        .d0(d0),
        .d1(d1),
        .d2(d2),
        .d3(d3)
    );

    // 4-digit 7seg display driver (giữ nguyên)
    digit_scan u_scan(
        .clk(clk_125MHz),
        .rst(rst),
        .d0(d0),
        .d1(d1),
        .d2(d2),
        .d3(d3),
        .SCLK(SCLK),
        .RCLK(RCLK),
        .DIO(DIO)
    );

endmodule
