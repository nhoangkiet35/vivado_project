module top_counter_0000_9999(
    input  wire clk,
    input  wire rst,
    output wire SCLK,
    output wire RCLK,
    output wire DIO
);
    wire [3:0] d0, d1, d2, d3;
	wire clk_1Hz_t;

    clk_divider_1hz u_div_1Hz(
		.clk_100MHz (clk),   
		.rst (rst),        
		.clk_1Hz (clk_1Hz_t)
    );
	
	counter4digit u_counter(
        .clk(clk_1Hz_t),
        .rst(rst),
        .digit0(d0),
        .digit1(d1),
        .digit2(d2),
        .digit3(d3)
    );

    digit_scan u_scan(
        .clk(clk),
        .rst(rst),
        .d0(d0),
        .d1(d1),
        .d2(d2),
        .d3(d3),
        .SCLK(SCLK),
        .RCLK(RCLK),
        .DIO(DIO)
    );
endmodule
