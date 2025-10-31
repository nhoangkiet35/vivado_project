`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/20/2025 07:53:25 PM
// Design Name: 
// Module Name: decoder_2_4_tb
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


module decoder_2_4_tb();
    reg E;
    reg [1:0] A;
    wire [3:0] Y;
    
    decoder_2_4 decoder_dut (E, A, Y);
    
    initial begin
		$monitor("time=%d \t E=%b \t A=%b \t Y=%b",$time,E, A, Y);
        E = 1'b0; #10;
        E = 1'b1; A = 2'b00; #10;
        E = 1'b1; A = 2'b01; #10;
        E = 1'b1; A = 2'b10; #10;
        E = 1'b1; A = 2'b11; #10;
        $stop;
    end
endmodule
