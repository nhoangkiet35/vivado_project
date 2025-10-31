`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/27/2025 07:04:48 PM
// Design Name: 
// Module Name: simple_ram
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


module simple_ram #(
    parameter ADDR_WIDTH = 10,  // 10 là số bit địa chỉ
    parameter DATA_WIDTH = 8	// mỗi ô nhớ có 8 bit 		
    )(
    input  wire                  clk,
    input  wire                  we,      		// write enable
    input  wire                  re,            // read enable
    input  wire [ADDR_WIDTH-1:0] addr,          // địa chỉ có 10 bit
    input  wire [DATA_WIDTH-1:0] din,     		// dữ liệu vào có 8-bit
    output reg  [DATA_WIDTH-1:0] dout     		// dữ liệu ra có 8-bit
    );

    // Bộ nhớ có 1024 ô nhớ và mỗi ô 8-bit
    // Mảng RAM
    reg [DATA_WIDTH-1:0] mem [0:(1<<ADDR_WIDTH)-1];
    
    // đợi dữ liệu tới khi clk đạt mức cao
    //assign data = (we == 0) ? mem[addr] : {DATA_WIDTH{1'bz}};

    always @(posedge clk) begin
        if (we)
            mem[addr] <= din;           // ghi đồng bộ
        if (re)
            dout <= mem[addr];          // đọc đồng bộ
    end
endmodule
