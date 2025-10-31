module debounce_project_top (
    input  wire i_clk,
    input  wire i_switch,
    output wire o_led
);
    wire debounced_switch;

    // Giảm debounce limit để mô phỏng nhanh
    debounce_filter #(.DEBOUNCE_LIMIT(10)) debounce_inst (
        .i_clk(i_clk),
        .i_bouncy(i_switch),
        .o_debounced(debounced_switch)
    );

    led_toggle led_toggle_inst (
        .i_clk(i_clk),
        .i_switch(debounced_switch),
        .o_led(o_led)
    );
endmodule
