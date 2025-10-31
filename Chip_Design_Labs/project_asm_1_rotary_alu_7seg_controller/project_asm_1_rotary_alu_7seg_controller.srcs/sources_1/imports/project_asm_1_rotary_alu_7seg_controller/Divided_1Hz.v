module clk_divider_1khz(
    input wire clk_100MHz,   
    input wire rst,        
    output reg clk_1kHz
    );


    parameter DIVISOR = 100_000_000/1000; 
    reg [26:0] counter;       

    always @(posedge clk_100MHz or posedge rst) begin
        if (rst) begin
            counter <= 0;    
            clk_1kHz <= 0;    
        end else begin
            if (counter == (DIVISOR/2 - 1)) begin
                counter <= 0; 
                clk_1kHz <= ~clk_1kHz; 
            end else begin
                counter <= counter + 1; 
            end
        end
    end
endmodule