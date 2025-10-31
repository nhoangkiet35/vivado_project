`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/25/2025 08:08:31 PM
// Design Name: 
// Module Name: right_shift_register
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


module right_shift_register(
    input clk, rst_p, 
    input D,                // serial right data in
    output reg [3:0] dout,  // 4-bit register data out
    output Q                // serial right data out
    );

    always@(posedge clk) begin
        if(!rst_p) dout <= 4'b0000;
        else dout <= {D, dout[3:1]}; // Right Shift
    end
    assign Q = dout[3];

endmodule
