`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/16/2025 09:10:18 PM
// Design Name: 
// Module Name: tb_shift_74hc595
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

module tb_shift_74hc595;
    // Tham số cho DUT
    localparam WIDTH     = 16;
    localparam HALF_CNT  = 4;   // clock chậm để dễ xem trong sim

    // Tín hiệu testbench
    reg                  clk;
    reg                  rst;
    reg                  start;
    reg  [WIDTH-1:0]     data_in;
    wire                 SCLK;
    wire                 RCLK;
    wire                 DIO;
    wire                 busy;

    // Khởi tạo clock 100MHz (chu kỳ 10ns)
    initial clk = 0;
    always #5 clk = ~clk;

    // DUT
    shift_74hc595 #(
        .WIDTH(WIDTH),
        .HALF_CNT(HALF_CNT)
    ) dut (
        .clk(clk),
        .rst(rst),
        .start(start),
        .data_in(data_in),
        .SCLK(SCLK),
        .RCLK(RCLK),
        .DIO(DIO),
        .busy(busy)
    );

    // Nhiệm vụ phát xung start đúng cạnh clock
    task pulse_start;
    begin
        @(posedge clk);
        start = 1;
        @(posedge clk);
        @(posedge clk);   // giữ thêm 1 clk nữa
        start = 0;
    end
    endtask


    // Test sequence
    initial begin
        // Reset
        rst = 1;
        start = 0;
        data_in = 0;
        #20;       // giữ reset một lúc
        @(posedge clk);
        rst = 0;

        // --- Lần 1 ---
        data_in = 16'h00FF;
        pulse_start();
        wait (busy == 0);   // chờ xong
        @(posedge clk);     // chờ thêm 1 clk

        // Test 2: Gửi 0xF0F0
        data_in = 16'hF0F0;
        pulse_start();
        wait (busy == 0);   // chờ xong
        @(posedge clk);     // chờ thêm 1 clk
        
        // Đợi xong
        #100;
        
        // Test 3: Gửi 0xAAAA
        data_in = 16'hAAAA;
        pulse_start();
        wait (busy == 0);   // chờ xong
        @(posedge clk);     // chờ thêm 1 clk

        #200;
        $stop;
    end

endmodule