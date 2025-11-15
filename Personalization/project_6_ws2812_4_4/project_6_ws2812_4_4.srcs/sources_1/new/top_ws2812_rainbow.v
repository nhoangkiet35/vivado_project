//==============================================================
// top_ws2812_rainbow.v
// Top-level cho WS2812 4x4 Rainbow Cross-fade Sequential
//==============================================================
module top_ws2812_rainbow (
    input  wire clk_125mhz,
    input  wire reset_btn, // Active-high reset
    output wire ws2812_data
    );
    
    ws2812_rainbow u_led_matrix (
        .clk(clk_125mhz),
        .reset_p(reset_btn),
        .data(ws2812_data)
    );

endmodule
