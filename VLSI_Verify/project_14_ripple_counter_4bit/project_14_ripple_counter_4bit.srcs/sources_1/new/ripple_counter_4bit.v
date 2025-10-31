`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/26/2025 07:38:20 PM
// Design Name: 
// Module Name: ripple_counter_4bit
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


module ripple_counter_4bit(
    input clk,
    input rst_p,    // async active-low reset
    output [3:0] Q
    );
    // JK Flip-Flops: J=K=1 => Toggle
    wire [3:0] clk_stage;
    
    // Initialize clk
    assign clk_stage[0] = clk;
    genvar i;
    generate for(i = 0; i < 4; i = i + 1) begin: gen_ff
            jk_ff uut(.clk(clk_stage[i]) , .rst_p(rst_p), .J(1'b1), .K(1'b1), .Q(Q[i]));
            if(i < 3) begin
                assign clk_stage[i + 1] = Q[i]; // FF sau lấy clock từ Q của FF trước
            end
        end
    endgenerate
endmodule
