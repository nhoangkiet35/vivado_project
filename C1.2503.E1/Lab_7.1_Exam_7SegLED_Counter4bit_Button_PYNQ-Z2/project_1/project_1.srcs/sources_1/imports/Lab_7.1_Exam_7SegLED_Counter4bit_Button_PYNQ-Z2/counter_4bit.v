`timescale 1ns / 1ps

module counter_4bit(
    input clk,
    input rst_p,
    input bnt_down,
    input bnt_up,
    output reg [3:0] count
);

    always @(posedge clk or posedge rst_p) begin
        if (rst_p) begin
            count <= 4'b0000;
        end 
		else if (bnt_up) begin
                count <= count + 1'b1;
            end
		else if (bnt_down) begin
                count <= count - 1'b1;
			end
        end

endmodule