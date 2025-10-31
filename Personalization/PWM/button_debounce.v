`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module: button_debounce
// Mô tả: Chống dội nút và đồng bộ vào clock
//////////////////////////////////////////////////////////////////////////////////
module button_debounce (
    input  wire clk,        // Clock 100 MHz
    input  wire btn_in,     // Nút nhấn gốc
    output reg  btn_state   // Tín hiệu sau khi chống dội
);
    reg btn_sync_0, btn_sync_1;
    reg [19:0] counter = 0;     // Đếm chống dội

    // Đồng bộ tín hiệu nút vào domain clock
    always @(posedge clk) begin
        btn_sync_0 <= btn_in;
        btn_sync_1 <= btn_sync_0;
    end

    // Chống dội (debounce)
    always @(posedge clk) begin
        if (btn_sync_1 == btn_state)
            counter <= 0;
        else begin
            counter <= counter + 1;
            if (counter == 20'd999999) begin   // ~10 ms với 100MHz clock
                btn_state <= btn_sync_1;
                counter   <= 0;
            end
        end
    end
endmodule
