`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module: brightness_ctrl
// Mô tả: Mỗi lần nhấn nút -> tăng duty cycle PWM
//////////////////////////////////////////////////////////////////////////////////
module brightness_ctrl (
    input  wire clk,
    input  wire rst,
    input  wire btn_state,        // Đầu vào từ debounce
    output reg [7:0] duty_value   // Độ sáng (0–255)
);
    reg btn_prev = 0;
    wire btn_pressed = (btn_state && ~btn_prev);

    always @(posedge clk) begin
        btn_prev <= btn_state;
    end

    always @(posedge clk or posedge rst) begin
        if (rst)
            duty_value <= 0;
        else if (btn_pressed)
            duty_value <= (duty_value >= 8'd250) ? 8'd0 : duty_value + 8'd50;
    end
endmodule
