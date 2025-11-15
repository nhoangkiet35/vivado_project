// top_lcd1602.v
`timescale 1ns/1ps
module top_lcd1602 #(
    parameter CLK_FREQ_HZ = 100_000_000,
    parameter PWM_WIDTH = 16
)(
    input  wire clk,
    input  wire rstn,       // active low
    // LCD pins
    output wire [3:0] lcd_data, // D7..D4
    output wire lcd_rs,
    output wire lcd_en,
    output wire lcd_rw,
    output wire lcd_vo     // PWM output for VO (contrast)
);

    // Instantiate char_mem
    wire [4:0] mem_addr;
    wire [7:0] mem_bus;
    char_mem rom (
        .addr(mem_addr),
        .bus(mem_bus)
    );

    // Controller
    reg start_pulse;
    wire controller_done;
    lcd1602_controller #(.CLK_FREQ_HZ(CLK_FREQ_HZ)) controller (
        .clk(clk),
        .rstn(rstn),
        .start(start_pulse),
        .mem_addr(mem_addr),
        .mem_bus(mem_bus),
        .lcd_data(lcd_data),
        .lcd_rs(lcd_rs),
        .lcd_en(lcd_en),
        .lcd_rw(lcd_rw),
        .done(controller_done)
    );

    // Auto-start after reset: hold start one cycle after reset release
    reg start_reg;
    always @(posedge clk or negedge rstn) begin
        if (!rstn) begin
            start_reg <= 0;
            start_pulse <= 0;
        end else begin
            if (!start_reg) begin
                // first cycle after reset: pulse start for controller
                start_pulse <= 1;
                start_reg <= 1;
            end else begin
                start_pulse <= 0;
            end
        end
    end

    // PWM for contrast: choose duty to taste (half duty default)
    wire pwm_out;
    // set duty to 50% of (2^PWM_WIDTH - 1)
    localparam DUTY_HALF = (1 << (PWM_WIDTH-1));
    pwm_gen #(.COUNTER_WIDTH(PWM_WIDTH)) pwm (
        .clk(clk),
        .rstn(rstn),
        .duty(DUTY_HALF),
        .pwm_out(pwm_out)
    );
    assign lcd_vo = pwm_out;

endmodule
