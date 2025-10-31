`timescale 1ns / 1ps

module btn_debounce(
    input clk,          // clock 100MHz trên Basys3
    input btn_in,       // nút nhấn thô
    output reg btn_out  // tín hiệu đã khử rung
);
    reg [26:0] counter;
    reg btn_sync;

    always @(posedge clk) begin
        btn_sync <= btn_in;  // đồng bộ
        if (btn_sync == btn_out)
            counter <= 0;
        else begin
            counter <= counter + 1;
            if (counter == 20'hFFFFF)
                btn_out <= btn_sync;
        end
    end
endmodule
