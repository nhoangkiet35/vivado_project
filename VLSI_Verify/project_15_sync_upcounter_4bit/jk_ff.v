`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/26/2025 07:34:45 PM
// Design Name: 
// Module Name: jk_ff
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


module jk_ff(
    input clk,
    input rst_p,
    input J,
    input K,
    output reg Q
    );
    always @(posedge clk or negedge rst_p) begin     // asynchronous 
        if(!rst_p) Q <= 1'b0;
        else begin
//            case ({J,K})
//                2'b00: Q <= Q;
//                2'b01: Q <= 1'b0;
//                2'b10: Q <= 1'b1;
//                2'b11: Q <= ~Q;
//            endcase
            if (J & ~Q | K & Q) Q <= ~Q;
            // Q <= (~K & Q) | (J & ~Q);
        end
    end
endmodule
