`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/02/2025 08:52:31 PM
// Design Name: 
// Module Name: mealy_fsm_tb
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


module mealy_fsm_tb();
    reg clk, rst, s_in;
    wire valid;

    // Instantiate DUT
    mealy_fsm uut (
        .clk(clk),
        .rst(rst),
        .s_in(s_in),
        .valid(valid)
    );

    // Clock generator
    initial begin
        clk = 0;
        forever #5 clk = ~clk;  // chu kỳ clock 10ns
    end
    
    // Test cases
    initial begin
        // Initialize
        rst = 1; s_in = 0;
        #12 rst = 0;

        s_in = 1'b0;  // đưa bit MSB trước
        @(posedge clk);
        #1;  // delay nhỏ để quan sát output
        $display("time=%0t, input=%b, state=%b, valid=%b", $time, s_in, uut.current_state, valid);
        
        s_in = 1'b0;  // đưa bit MSB trước
        @(posedge clk);
        #1;  // delay nhỏ để quan sát output
        $display("time=%0t, input=%b, state=%b, valid=%b", $time, s_in, uut.current_state, valid);
        
        s_in = 1'b1;  // đưa bit MSB trước
        @(posedge clk);
        #1;  // delay nhỏ để quan sát output
        $display("time=%0t, input=%b, state=%b, valid=%b", $time, s_in, uut.current_state, valid);
        
        s_in = 1'b1;  // đưa bit MSB trước
        @(posedge clk);
        #1;  // delay nhỏ để quan sát output
        $display("time=%0t, input=%b, state=%b, valid=%b", $time, s_in, uut.current_state, valid);
        
        #10 $stop;
    end
endmodule