`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/20/2025 06:53:32 PM
// Design Name: 
// Module Name: demux_1_4
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


module demux_1_4(
    input I,
    input [1:0] S,
    output reg [3:0] Y
    );
    
    always @(*) begin
        Y = 4'b0000;
        case(S)
            2'b00: Y[0] = I;
            2'b01: Y[1] = I;
            2'b10: Y[2] = I;
            2'b11: Y[3] = I;
            default: $display("error");
        endcase
    end
endmodule
