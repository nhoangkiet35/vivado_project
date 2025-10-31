`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/03/2025 07:40:31 PM
// Design Name: 
// Module Name: top
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


module top (
    input  [3:0] ar,        // switch 4 bit từ Arduino I/O
//    output [3:0] led,       // LED on-board (LD0..LD3)
    input  clk,             // 100MHz clock
    input  rst,             // reset
    output [3:0] an,
    output [6:0] seg 
    );
    wire [3:0] tens, ones;
    
//    assign led[3:0] = ar[3:0];     // hiển thị trực tiếp
    
    bin2bcd b2b(.bin(ar), .tens(tens), .ones(ones));
    seg7_driver drv(.clk(clk), .rst(rst), .tens(tens), .ones(ones), .an(an), .seg(seg));
endmodule


