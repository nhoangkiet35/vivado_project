module led_toggle (
    input  wire i_clk,
    input  wire i_switch,
    output reg  o_led = 0
);
    reg prev_switch = 0;

    always @(posedge i_clk) begin
        // Lưu lại trạng thái cũ của nút
        prev_switch <= i_switch;

        // Khi phát hiện cạnh xuống (1 -> 0), đảo LED
        if (prev_switch && !i_switch)
            o_led <= ~o_led;
    end
endmodule
