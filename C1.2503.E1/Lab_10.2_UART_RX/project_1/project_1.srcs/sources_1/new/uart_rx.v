`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/06/2025 08:25:26 PM
// Design Name: 
// Module Name: uart_rx
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


`timescale 1ns/1ps
module uart_rx #(
    parameter CLK_FREQ  = 100_000_000,   // clock 100 MHz
    parameter BAUD_RATE = 9600
)(
    input  wire clk,
    input  wire rst,      // active-low reset
    input  wire rx,
    output reg  [7:0] rx_data,
    output reg  rx_ready
);


    localparam integer BAUD_TICK = (CLK_FREQ + BAUD_RATE/2) / BAUD_RATE;


    reg [15:0] baud_cnt;
    reg [3:0]  bit_index;
    reg [7:0]  data_reg;
    reg        rx_busy;


    always @(posedge clk or negedge rst) begin
        if (!rst) begin
            rx_ready  <= 0;
            rx_busy   <= 0;
            baud_cnt  <= 0;
            bit_index <= 0;
            data_reg  <= 0;
            rx_data   <= 0;
        end else begin
            rx_ready <= 0; // default mỗi chu kỳ


            if (!rx_busy) begin
                // phát hiện start bit (rx = 0)
                if (rx == 0) begin
                    rx_busy   <= 1;
                    baud_cnt  <= BAUD_TICK/2; // lấy mẫu giữa bit
                    bit_index <= 0;
                end
            end else begin
                if (baud_cnt == BAUD_TICK-1) begin
                    baud_cnt <= 0;
                    bit_index <= bit_index + 1;


                    // 8 data bits: bit_index = 1..8
                    if (bit_index >= 1 && bit_index <= 8) begin
                        data_reg[bit_index-1] <= rx;
                    end 
                    // stop bit: bit_index = 9
                    else if (bit_index == 9) begin
                        if (rx == 1) begin // stop hợp lệ
                            rx_data  <= data_reg;
                            rx_ready <= 1;
                        end
                        rx_busy  <= 0; // về idle -> bắt ngay start tiếp theo
                    end


                end else begin
                    baud_cnt <= baud_cnt + 1;
                end
            end
        end
    end
endmodule


