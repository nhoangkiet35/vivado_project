`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/25/2025 04:41:39 PM
// Design Name: 
// Module Name: top_calculator
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


module top_calculator (
    input  wire clk,      // 100 MHz
    input  wire rst,      // active HIGH
    input  wire enc_a,
    input  wire enc_b,
    input  wire enc_sw,   // button (active LOW expected)
    output wire SCLK,
    output wire RCLK,
    output wire DIO
);
    wire rot_up, rot_down;
    rotary_decoder rdec (
        .clk(clk), .rst(rst),
        .enc_a(enc_a), .enc_b(enc_b),
        .step_up(rot_up), .step_down(rot_down)
    );

    // debounce button
    wire sw_press;
    button_debounce bdeb (
        .clk(clk), .rst(rst), .btn_in(enc_sw), .press_pulse(sw_press)
    );

    // fsm controller + ALU
    wire [1:0] state;
    wire [3:0] A, B;
    wire [1:0] opcode;
    fsm_controller fsm_u(
        .clk(clk), .rst(rst),
        .rot_up(rot_up), .rot_down(rot_down), .sw_press(sw_press),
        .state(state), .A(A), .B(B), .opcode(opcode)
    );

    wire [6:0] result;
    alu_calc alu_u(.A(A), .B(B), .opcode(opcode), .result(result));

    // compute tens/ones
    wire [3:0] ones = result % 10;
    wire [3:0] tens = result / 10;

    // Prepare digits for digit_scan (d0 = LSD .. d3 = MSD)
    reg [3:0] d0, d1, d2, d3;
    always @(*) begin
        // defaults
        d0 = ones;
        d1 = tens;
        // digit2: current value/opcode
        case (state)
            2'd0: begin // Input A
                d3 = 4'hA; // 'A'
                d2 = A;
                d1 = 4'h0;
                d0 = 4'h0;
            end
            2'd1: begin // Input B
                d3 = 4'hB; // 'b'
                d2 = B;
                d1 = 4'h0;
                d0 = 4'h0;
            end
            2'd2: begin // Select opcode
                d3 = 4'hC; 
                d2 = {2'b00, opcode}; // show opcode as 0..3
                d1 = 4'h0;
                d0 = 4'h0;
            end
            2'd3: begin // Show result
                d3 = 4'hF;
                d2 = {2'b00, opcode}; // opcode number shown
                d1 = tens;
                d0 = ones;
            end
            default: begin
                d3 = 4'hA; d2 = 0; d1 = 0; d0 = 0;
            end
        endcase
    end

    digit_scan u_scan (
        .clk(clk), .rst(rst),
        .d0(d0), .d1(d1), .d2(d2), .d3(d3),
        .SCLK(SCLK), .RCLK(RCLK), .DIO(DIO)
    );

endmodule
