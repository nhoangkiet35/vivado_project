// tb_state_machine_project_top.v
`timescale 1ns / 1ps
module tb_state_machine_project_top;
    reg i_clk = 0;
    reg [3:0] i_switch = 4'b0000;
    wire [3:0] o_led;
    wire [6:0] o_segment;
    wire       o_digit;

    // instantiate top with reduced parameters for simulation speed (override in testbench by using smaller CLKS_PER_SEC)
    // For simplicity, include a small wrapper module in simulation that uses small CLKS_PER_SEC inside the design files
    state_machine_project_top u_top (
        .i_clk(i_clk),
        .i_switch(i_switch),
        .o_led(o_led),
        .o_segment(o_segment),
        .o_digit(o_digit)
    );

    // 25 MHz clock simulated with 40 ns period -> #20
    always #5 i_clk = ~i_clk;

    initial begin
        $display("=== Start TB ===");

        // NOTE: For faster simulation, you should modify CLKS_PER_SEC and DEBOUNCE_LIMIT in the design files above
        // (e.g., set CLKS_PER_SEC = 1000 and DEBOUNCE_LIMIT = 5) to see visible toggles quickly.

        // Reset/start sequence: press two switches to ensure START condition then release
        i_switch = 4'b0011; #100; // pressed btn 0 & 1
        i_switch = 4'b0000; #100; // release all

        // Simulate player presses (simple sequence)
        // press button 0
        i_switch = 4'b0001; #80; // pressed btn 0
        i_switch = 4'b0000; #80; // release all

        // press button 1
        i_switch = 4'b0010; #80; // pressed btn 1
        i_switch = 4'b0000; #80; // release all

        // press button 2
        i_switch = 4'b0100; #80; // pressed btn 2
        i_switch = 4'b0000; #80; // release all

        // finish
        #200;
        $display("=== End TB ===");
        $finish;
    end

endmodule
