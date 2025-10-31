`timescale 1ns / 1ps

module tb_debounce_project_top;
    reg  i_clk = 0;
    reg  i_switch = 0;
    wire o_led;
    
    debounce_project_top DUT (
        .i_clk(i_clk),
        .i_switch(i_switch),
        .o_led(o_led)
    );

    always #5 i_clk = ~i_clk; // 100 MHz clock

    initial begin
        $monitor("%0t\tSwitch=%b\tLED=%b", $time, i_switch, o_led);

        i_switch = 0;
        #50;

        // === Press (có dội) ===
        $display("Simulating press");
        i_switch = 1;  #50;
        i_switch = 0;  #30;
        i_switch = 1;  #40;
        i_switch = 0;  #20;
        i_switch = 1;  #100;  // Giữ đủ lâu để debounce

        // === Release (có dội) ===
        $display("Simulating release");
        i_switch = 0;  #50;
        i_switch = 1;  #30;
        i_switch = 0;  #80;
        i_switch = 1;  #20;
        i_switch = 0;  #100;

        // === Clear nhấn 1: bật đèn ===
        $display("Clean press");
        i_switch = 1;  #100;
        i_switch = 0;  #100;
        
        // === Clear nhấn 2: tắt đèn ===
        $display("Clean press");
        i_switch = 1;  #100;
        i_switch = 0;  #100;

        $display("Simulation finished at %0t", $time);
        $finish;
    end
endmodule
