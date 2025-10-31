`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/20/2025 09:17:25 PM
// Design Name: 
// Module Name: jk_ff_tb
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


module jk_ff_tb();
    reg J, K, clk;
    wire Q, Q_reverse;

    jk_ff jk_ff_dut (J, K, clk, Q, Q_reverse);

    always #5 clk = ~clk;

    initial begin
		$monitor("time=%d \t j=%b \t k=%b \t clk=%b \t q=%b", $time ,J, K, clk, Q);
        clk = 0;
        J = 1'bx; K = 1'bx; #10;	// Invalid
        J = 0; K = 0; #10;			// No changes
        J = 0; K = 1; #20;			// Reset
        J = 1; K = 0; #20;			// Set
        J = 1; K = 1; #20;			// Toggle
        J = 0; K = 0; #40;			// No changes
        $stop;
    end
endmodule
