`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/25/2025 09:15:27 PM
// Design Name: 
// Module Name: left_shift_register
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


module left_shift_register # (
        parameter WIDTH = 4
    )(
        input Din,
        input clk,
        input rst_p,
        output [WIDTH - 1:0] Q
    );
	genvar i;
	generate
		for(i = 0; i < WIDTH; i = i + 1) begin
            if (i == 0)
                d_ff_async uut(.D(Din), .clk(clk), .rst_p(rst_p), .Q(Q[i]));
            else 
                d_ff_async utt(.D(Q[i - 1]), .clk(clk), .rst_p(rst_p), .Q(Q[i]));		
		end
	endgenerate
endmodule
