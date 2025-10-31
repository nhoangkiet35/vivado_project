`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/21/2025 09:05:56 PM
// Design Name: 
// Module Name: rotary_360_tb
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


module rotary_360_tb();
    reg clk, rst_p, A, B;
    wire dir;          
    wire [3:0] led;        
    
    rotary_360 uut (
        .clk(clk),
        .rst_p(rst_p),
        .A(A),
        .B(B),
        .dir(dir),
        .led(led)
    );
    
    // Clock 10ns (100MHz)
    always #5 clk = ~clk;
    
    task rotate_CW; // Task mô phỏng 1 bước quay CW
        begin
            // Chuỗi: 00 -> 10 -> 11 -> 01 -> 00
            {A,B} = 2'b00; #20;
            {A,B} = 2'b10; #20;
            {A,B} = 2'b11; #20;
            {A,B} = 2'b01; #20;
            {A,B} = 2'b00; #20;
        end
    endtask

    task rotate_CCW; // Task mô phỏng 1 bước quay CCW
        begin
            // Chuỗi: 00 -> 01 -> 11 -> 10 -> 00
            {A,B} = 2'b00; #20;
            {A,B} = 2'b01; #20;
            {A,B} = 2'b11; #20;
            {A,B} = 2'b10; #20;
            {A,B} = 2'b00; #20;
        end
    endtask
    
    initial begin
        $monitor("time=%d \t A=%b \t B=%b \t clk=%b \t DIR=%b \t LED=%b", $time, A, B, clk, dir, led);
        clk = 0; rst_p = 1; A = 0; B = 0;
        #20 rst_p = 0;

        // --- Test 1: Quay CW ---
        repeat (4) begin
            rotate_CW(); #20;
        end

        // --- Test 2: Quay CCW ---
        repeat (4) begin
            rotate_CCW(); #20;
        end

        #100 $finish;
    end
endmodule
