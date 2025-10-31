`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/20/2025 08:32:29 PM
// Design Name: 
// Module Name: sr_ff
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


module sr_ff(
    input S,
    input R,
    input clk,
    input rst_p,
    output reg Q,
    output Q_reverse
    );
    
    always @(posedge clk or negedge rst_p) begin
        if(!rst_p)
            Q <= 1'b0;
        else begin
            case({S,R})
                2'b00: Q <= Q;      // no changes
                2'b01: Q <= 1'b0;   // reset
                2'b10: Q <= 1'b1;   // set
                2'b11: Q <= 1'bx;   // invalid
            endcase
        end
        // if (S & ~R) Q <= 1'b1;
        // else if (~S & R) Q <= 1'b0;
        // else if (S & R) Q <= 1'bx; // invalid
        // // else hold
    end
    
    assign Q_reverse = ~Q;
    
endmodule
