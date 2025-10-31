// top module: nối rotary encoder vào hiển thị 7-seg qua shift register 74HC595
module top_rotary_7seg(
    input  wire clk_100MHz,
    input  wire rst,            // hệ thống reset
    // Rotary encoder pins (nối KY-040)
    input  wire rot_a,
    input  wire rot_b,
    input  wire rot_sw,         // nút nhấn SW (thường active low)
    // Outputs to 74HC595 -> LED 7-seg
    output wire SCLK,
    output wire RCLK,
    output wire DIO
);

    // --- instantiate rotary encoder ---
    wire inc_pulse;
    wire dec_pulse;
    wire sw_pressed;

    rotary_encoder #(
        .CLK_FREQ(100_000_000),
        .DEBOUNCE_MS(5)
    ) u_rot (
        .clk(clk_100MHz),
        .rst(rst),
        .rot_a_raw(rot_a),
        .rot_b_raw(rot_b),
        .sw_raw(rot_sw),
        .inc(inc_pulse),
        .dec(dec_pulse),
        .sw_pressed(sw_pressed)
    );
    
    // --- counter controlled by rotary ---
    wire [3:0] d0, d1, d2, d3;
    counter4digit_enc u_cnt (
        .clk(clk_100MHz),
        .rst(rst),
        .inc_pulse(inc_pulse),
        .dec_pulse(dec_pulse),
        .sw_reset(sw_pressed),
        .digit0(d0),
        .digit1(d1),
        .digit2(d2),
        .digit3(d3)
    );

    // --- reuse your digit_scan module to drive 74HC595 ---
    digit_scan u_scan (
        .clk(clk_100MHz),
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