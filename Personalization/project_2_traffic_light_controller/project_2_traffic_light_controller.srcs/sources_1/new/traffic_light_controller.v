`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/30/2025 03:41:44 PM
// Design Name: 
// Module Name: traffic_light_controller
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


module traffic_light_controller(
    input  wire clk,    // clock 1Hz (từ clk_divider)
    input  wire rst,    // reset active high
    output reg R1, Y1, G1,
    output reg R2, Y2, G2
);
    // Các trạng thái
    parameter S1_G1_R2 = 2'b00;
    parameter S2_Y1_R2 = 2'b01;
    parameter S3_R1_G2 = 2'b10;
    parameter S4_R1_Y2 = 2'b11;

    // Thời gian cho từng pha (đơn vị: giây)
    parameter GREEN_TIME  = 5;
    parameter YELLOW_TIME = 2;

    reg [1:0] state;
    reg [3:0] timer; // đếm số giây

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            state <= S1_G1_R2;
            timer <= 0;
        end else begin
            timer <= timer + 1;
            case (state)
                S1_G1_R2: if (timer == GREEN_TIME) begin state <= S2_Y1_R2; timer <= 0; end
                S2_Y1_R2: if (timer == YELLOW_TIME) begin state <= S3_R1_G2; timer <= 0; end
                S3_R1_G2: if (timer == GREEN_TIME) begin state <= S4_R1_Y2; timer <= 0; end
                S4_R1_Y2: if (timer == YELLOW_TIME) begin state <= S1_G1_R2; timer <= 0; end
            endcase
        end
    end

    // Cập nhật LED: mạch giao thông dùng common cathode
    always @(*) begin
        // tắt hết
        R1 = 0; Y1 = 0; G1 = 0;
        R2 = 0; Y2 = 0; G2 = 0;

        case (state)
            S1_G1_R2: begin G1 = 1; R2 = 1; end
            S2_Y1_R2: begin Y1 = 1; R2 = 1; end
            S3_R1_G2: begin R1 = 1; G2 = 1; end
            S4_R1_Y2: begin R1 = 1; Y2 = 1; end
        endcase
    end
endmodule
