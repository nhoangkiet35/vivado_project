`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/06/2025 08:00:18 PM
// Design Name: 
// Module Name: tb_uart_tx
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


module tb_uart_tx;

    // Tham số
    localparam CLK_FREQ   = 100_000_000;
    localparam BAUD_RATE  = 9600;
    localparam CLK_PERIOD = 10; // 100 MHz => 10 ns

    // Tín hiệu
    reg clk;
    reg rst;
    reg tx_start;
    reg [7:0] tx_data;
    wire tx;
    wire tx_busy;

    // Instance DUT
    uart_tx #(
        .CLK_FREQ(CLK_FREQ),
        .BAUD_RATE(BAUD_RATE)
    ) dut (
        .clk(clk),
        .rst(rst),
        .tx_start(tx_start),
        .tx_data(tx_data),
        .tx(tx),
        .tx_busy(tx_busy)
    );

    // Clock 100 MHz
    always #(CLK_PERIOD/2) clk = ~clk;

    // Nhiệm vụ gửi 1 byte
    task send_byte(input [7:0] data);
        begin
            // Chờ UART rảnh
            @(posedge clk);
            while (tx_busy) @(posedge clk);
    
            // Nạp dữ liệu
            tx_data  <= data;
            tx_start <= 1'b1;
            @(posedge clk);
            tx_start <= 1'b0;
    
            // Giữ tx_busy trong suốt quá trình truyền
            while (tx_busy) @(posedge clk);
    
            // Đợi thêm 1 chu kỳ an toàn
            @(posedge clk);
        end
    endtask

    // Test sequence
    initial begin
        // Khởi tạo
        clk      = 0;
        rst      = 0;
        tx_start = 0;
        tx_data  = 8'h00;

        // Reset
        #100;
        rst = 1;

        // Gửi 4 byte lần lượt
        send_byte(8'h3C);  // 00111100
        send_byte(8'hA5);  // 10100101
        send_byte(8'h00);  // 00000000
        send_byte(8'hFF);  // 11111111

        // Chờ thêm để quan sát
        #100000;
        $stop;
    end

endmodule

