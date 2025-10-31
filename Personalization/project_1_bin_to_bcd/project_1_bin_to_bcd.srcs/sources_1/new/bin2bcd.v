`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/03/2025 07:39:21 PM
// Design Name: 
// Module Name: bin2bcd
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


module bin2bcd (
    input  [3:0] bin,     // binary input 0..15
    output reg [3:0] tens,
    output reg [3:0] ones
);
    always @(*) begin
        tens = 4'd0;
        ones = 4'd0;
        if (bin < 10) begin
            tens = 4'd0;
            ones = bin;
        end else begin
            tens = 4'd1;
            ones = bin - 10;
        end
    end
endmodule

