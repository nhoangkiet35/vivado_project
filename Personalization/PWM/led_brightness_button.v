`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Project: LED Brightness Increase on Button Press
// Board: PYNQ-Z2 (Clock 100 MHz)
// Author: ChatGPT (GPT-5)
// Description:
//   Mỗi lần nhấn nút, LED sẽ sáng dần thêm một mức.
//   Khi đạt mức sáng tối đa, sẽ quay lại mức thấp nhất.
//////////////////////////////////////////////////////////////////////////////////

module led_brightness_button (
    input  wire clk,        // 100 MHz clock
    input  wire rst,        // Active-high reset
    input  wire btn,        // Button input
    output wire led         // LED output
);

    //==============================
    // 1. Debounce Button
    //==============================
    reg [19:0] db_count = 0;       // bộ đếm chống dội
    reg btn_sync_0, btn_sync_1;
    reg btn_state = 0;

    // Đồng bộ button về clock domain
    always @(posedge clk) begin
        btn_sync_0 <= btn;
        btn_sync_1 <= btn_sync_0;
    end

    // Chống dội bằng bộ đếm
    always @(posedge clk) begin
        if (btn_sync_1 == btn_state)
            db_count <= 0;
        else begin
            db_count <= db_count + 1;
            if (db_count == 20'd999999) begin
                btn_state <= btn_sync_1;
                db_count <= 0;
            end
        end
    end

    //==============================
    // 2. Detect Rising Edge (nhấn)
    //==============================
    reg btn_prev = 0;
    wire btn_pressed = (btn_state && ~btn_prev);

    always @(posedge clk)
        btn_prev <= btn_state;

    //==============================
    // 3. Brightness Control
    //==============================
    reg [7:0] duty_value = 0;  // 0–255 brightness levels

    always @(posedge clk or posedge rst) begin
        if (rst)
            duty_value <= 0;
        else if (btn_pressed)
            duty_value <= (duty_value >= 8'd250) ? 8'd0 : duty_value + 8'd50;
    end

    //==============================
    // 4. PWM Generator
    //==============================
    reg [7:0] pwm_counter = 0;

    always @(posedge clk or posedge rst) begin
        if (rst)
            pwm_counter <= 0;
        else
            pwm_counter <= pwm_counter + 1;
    end

    assign led = (pwm_counter < duty_value);

endmodule
