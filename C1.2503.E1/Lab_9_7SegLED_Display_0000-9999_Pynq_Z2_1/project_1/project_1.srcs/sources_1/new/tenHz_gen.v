`timescale 1ns / 1ps


module tenHz_gen(
    input clk_100MHz,
    input reset,
    output reg clk_10Hz     // eyes can see
    );


    parameter DIVISOR = 10000000; 
    reg [26:0] counter;       


    always @(posedge clk_100MHz or negedge reset) begin
        if (~reset) begin
            counter <= 0;    
            clk_10Hz <= 0;    
        end else begin
            if (counter == (DIVISOR/2 - 1)) begin
                counter <= 0; 
                clk_10Hz <= ~clk_10Hz; 
            end else begin
                counter <= counter + 1; 
            end
        end
    end
endmodule
