`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/22/2025 01:07:40 PM
// Design Name: 
// Module Name: tb_demux_count_top
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


module tb_demux_count_top;

    reg  i_clk = 0;
    reg  [1:0] i_switch = 2'b00;  // chọn LED ban đầu
    wire [3:0] o_led;

    // Instantiate DUT
    demux_count_top DUT (
        .i_clk(i_clk),
        .i_switch(i_switch),
        .o_led(o_led)
    );

    // Tạo clock 10ns chu kỳ (100 MHz)
    always #5 i_clk = ~i_clk;

    // Test sequence
    initial begin
        $display("=== Start Simulation ===");

        // Ban đầu tất cả LED tắt
        #100;

        // Lần lượt chọn các LED khác nhau
        i_switch = 2'b00; #200;   // LED1
        i_switch = 2'b01; #200;   // LED2
        i_switch = 2'b10; #200;   // LED3
        i_switch = 2'b11; #200;   // LED4

        $display("=== End Simulation ===");
        $finish;
    end

    // Theo dõi giá trị LED
    initial begin
        $monitor("Time=%0t ns | Switch=%b | LED=%b", $time, i_switch, o_led);
    end

endmodule
