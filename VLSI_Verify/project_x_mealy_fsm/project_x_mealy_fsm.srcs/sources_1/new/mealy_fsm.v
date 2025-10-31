`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/02/2025 08:51:34 PM
// Design Name: 
// Module Name: mealy_fsm
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


module mealy_fsm(
    input  wire clk,
    input  wire rst,
    input  wire s_in,   // Serial_in (s_in)
    output reg  valid   // out = 1 khi nhận đủ chuỗi 0011
    );
    // State encoding (3-bit)
    localparam IDLE   = 3'b000; // chưa thấy gì
    localparam D0     = 3'b001; // đã thấy 0
    localparam D00    = 3'b010; // đã thấy 00
    localparam D001   = 3'b011; // đã thấy 001
    
    reg [2:0] current_state, next_state;
    
    // State register
    always @(posedge clk or posedge rst) begin
        if (rst)
            current_state <= IDLE;
        else
            current_state <= next_state;
    end

    // Next-state logic
    always @(*) begin
        next_state = current_state; // mặc định giữ nguyên nếu không có điều kiện
        case (current_state)
            IDLE:   next_state = (s_in == 1'b0) ? D0    : IDLE;
            D0:     next_state = (s_in == 1'b0) ? D00   : IDLE;
            D00:    next_state = (s_in == 1'b0) ? D00   : D001;
            D001:   next_state = (s_in == 1'b0) ? D0    : IDLE;
            default: next_state = IDLE;
        endcase
    end

    // Output logic (Mealy phụ thuộc state + input)
    always @(*) begin
        valid = 1'b0;
        if (current_state == D001 && s_in == 1'b1)
            valid = 1'b1;   // khi đang ở D001 nhận thêm '1' → vừa hoàn thành 0011 quay về IDLE
    end
endmodule
