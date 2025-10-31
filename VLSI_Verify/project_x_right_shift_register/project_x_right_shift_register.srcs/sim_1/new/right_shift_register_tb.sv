`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/25/2025 08:24:36 PM
// Design Name: 
// Module Name: right_shift_register_tb
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


module right_shift_register_tb();
    reg clk, rst_p, D;
    wire [3:0] dout;
    wire Q;
    
    right_shift_register uut (.clk(clk), .rst_p(rst_p), .D(D), .dout(dout), .Q(Q));
    
    always #5 clk = ~clk;
    initial begin
        // Initialize
        clk = 0;
        rst_p = 0; D = 0; #10;     // => 0000
        
        rst_p = 1;
        
        // pattern: 1011
        D = 1; #10;
        D = 0; #10;
        D = 1; #10;
        D = 1; #10;
        
        D = 0; #40; // 0110
        
        rst_p = 0; #10;
        rst_p = 1;

        // pattern: 1010
        D = 1; #10;
        D = 0; #10;
        D = 1; #10;
        D = 0; #10;
        $stop;
    end
endmodule
