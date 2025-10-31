`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/21/2025 07:34:16 PM
// Design Name: 
// Module Name: button_led_buzzer
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module button_led_buzzer (
    input wire clk,       // Clock hệ thống
    input wire rst,       // Tín hiệu reset (active low)
    input wire [4:0] btn, // 5 nút nhấn BTN1 - BTN5
    output reg [2:0] led, // 3 LED (LED1 - LED3)
    output reg buzzer     // Còi buzzer
);


    reg [23:0] counter;   // Bộ đếm để chia tần số clock (tạo hiệu ứng nhấp nháy LED)
    reg blink_state;      // Cờ bật/tắt chế độ nhấp nháy LED
    reg buzz_state;       // Trạng thái buzzer (chưa sử dụng trong thiết kế này)


    // Phát hiện nút nhấn (ở đây chỉ dùng BTN3, active low)
    wire btn_pressed = ~(btn[2]); 


    always @(posedge clk or negedge rst) begin
        if (!rst) begin
            led <= 3'b000;      // Tắt LED khi reset
            buzzer <= 1'b0;     // Tắt buzzer khi reset
            counter <= 24'd0;   // Reset bộ đếm
            blink_state <= 1'b0;// Tắt chế độ nhấp nháy LED
        end else begin
            // Xử lý khi nhấn nút
            if (btn_pressed) begin
                buzzer <= 1'b1;            // Buzzer kêu "bíp" khi nhấn
                blink_state <= ~blink_state; // Đảo trạng thái chế độ nhấp nháy LED
            end else begin
                buzzer <= 1'b0; // Tắt buzzer khi thả nút
            end


            // Bộ chia clock để tạo hiệu ứng LED nhấp nháy
            counter <= counter + 1;
            if (counter == 24'd10_000_000) begin
                counter <= 24'd0;
                if (blink_state) begin
                    led <= ~led;    // Đảo trạng thái LED (nhấp nháy)
                end else begin
                    led <= 3'b000;  // Tắt LED nếu không ở chế độ nhấp nháy
                end
            end
        end
    end


endmodule
