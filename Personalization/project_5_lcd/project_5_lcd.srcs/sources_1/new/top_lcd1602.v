module top_lcd1602(
    input  wire clk_125mhz,
    output wire [7:0] lcd_db,
    output wire lcd_rs,
    output wire lcd_rw,
    output wire lcd_v0,
    output wire lcd_e
);

    pwm_gen pwm_contrast (
        .clk(clk_125mhz),
        .pwm_out(lcd_v0)
    );

    lcd_driver u1 (
        .clk(clk_125mhz),
        .lcd_db(lcd_db),
        .lcd_rs(lcd_rs),
        .lcd_rw(lcd_rw),
        .lcd_e(lcd_e)
    );

endmodule
