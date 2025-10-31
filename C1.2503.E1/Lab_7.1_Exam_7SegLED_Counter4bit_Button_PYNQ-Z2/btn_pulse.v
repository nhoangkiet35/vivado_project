module btn_pulse (
    input clk,
    input rst_p,
    input btn_level,      // tín hiệu nút đã debounce
    output reg btn_tick   // xung 1 clock khi phát hiện nhấn
);
    reg btn_level_d;

    always @(posedge clk or posedge rst_p) begin
        if (rst_p) begin
            btn_level_d <= 0;
            btn_tick    <= 0;
        end else begin
            btn_tick    <= btn_level & ~btn_level_d; // phát hiện cạnh lên
            btn_level_d <= btn_level;
        end
    end
endmodule