`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/27/2025 08:37:24 PM
// Design Name: 
// Module Name: ram_bidirectional_async
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


module ram_bidirectional_async #(
    parameter ADDR_WIDTH = 4,           // có 4-bit địa chỉ, 16 ô nhớ
    parameter DATA_WIDTH = 8            // mỗi ô nhớ có 8-bit
    )(
    input  wire                  clk,
    input  wire                  we,    
    input  wire [ADDR_WIDTH-1:0] addr,
    input  wire [DATA_WIDTH-1:0] din,
    output wire [DATA_WIDTH-1:0] dout
    );

    reg [DATA_WIDTH-1:0] mem [0:(1<<ADDR_WIDTH)-1];

    assign dout = (we == 0) ? mem[addr] : {DATA_WIDTH{1'bz}};

    always @(posedge clk) begin
        if (we) begin
            mem[addr] <= din;
        end
    end
endmodule
