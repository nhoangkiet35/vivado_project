module rotary_counter(
    input clk,
    input rst,
    input pulse_up,
    input pulse_down,
    output reg [3:0] d0,
    output reg [3:0] d1,
    output reg [3:0] d2,
    output reg [3:0] d3
);

    integer value = 0;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            value <= 0;
        end 
        else begin
            if (pulse_up)   value <= value + 1;
            if (pulse_down) value <= value - 1;

            if (value < 0) value <= 0;
            if (value > 9999) value <= 9999;
        end
    end
    
    integer tmp;
    always @(*) begin
        tmp = value;

        d0 = tmp % 10;      tmp = tmp / 10;
        d1 = tmp % 10;      tmp = tmp / 10;
        d2 = tmp % 10;      tmp = tmp / 10;
        d3 = tmp % 10;
    end
endmodule
