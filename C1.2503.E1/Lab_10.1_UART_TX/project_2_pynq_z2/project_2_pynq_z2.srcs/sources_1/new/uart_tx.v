`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/06/2025 07:58:29 PM
// Design Name: 
// Module Name: uart_tx
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


module uart_tx #(
    parameter CLK_FREQ = 100_000_000,   // clock 100 MHz
    parameter BAUD_RATE = 9600
)(
    input  wire clk,
    input  wire rst,
    input  wire tx_start,
    input  wire [7:0] tx_data,
    output reg  tx,
    output reg  tx_busy
);


    localparam integer BAUD_TICK = CLK_FREQ / BAUD_RATE; // ~10416 cho 9600 baud


    reg [15:0] baud_cnt;
    reg [3:0]  bit_index;
    reg [9:0]  tx_shift;


    always @(posedge clk or negedge rst) 
        begin
        if (!rst) 
            begin
            tx        <= 1'b1; // idle
            tx_busy   <= 0;
            baud_cnt  <= 0;
            bit_index <= 0;
            tx_shift  <= 10'b1111111111;	
            end 
        else 
            begin
            if (tx_start && !tx_busy) 
                begin
                // nạp khung: stop(1) + data(8 bit) + start(0)
                tx_shift  <= {1'b1, tx_data, 1'b0};
                tx_busy   <= 1;
                bit_index <= 0;
                baud_cnt  <= 0;
                end 
            else if (tx_busy) 
                begin
                if (baud_cnt == BAUD_TICK-1) 
                    begin
                    baud_cnt <= 0;
                    tx       <= tx_shift[0];
                    tx_shift <= {1'b1, tx_shift[9:1]}; // dịch phải, chèn 1
                    bit_index <= bit_index + 1;
                    if (bit_index == 9)
                        tx_busy <= 0; // hết 10 bit
                    end 
                else 
                    begin
                    	 baud_cnt <= baud_cnt + 1;
                    end
                end
            end
        end
endmodule

