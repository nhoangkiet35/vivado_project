`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/25/2025 09:04:09 PM
// Design Name: 
// Module Name: d_ff_async
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


module d_ff_async(
	input D,
	input clk,
	input rst_p,
	output reg Q
	);

	always @ (posedge clk or negedge rst_p) begin
		if (!rst_p) Q <= 1'b0;
		else Q <= D;
	end

endmodule
