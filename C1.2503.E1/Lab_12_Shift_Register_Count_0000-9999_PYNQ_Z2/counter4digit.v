module counter4digit(
    input  wire clk,
    input  wire rst,
    output reg [3:0] digit0, // đơn vị
    output reg [3:0] digit1, // chục
    output reg [3:0] digit2, // trăm
    output reg [3:0] digit3  // nghìn
);
    reg [13:0] count; // 0-9999 => 14 bit là đủ

    always @(posedge clk or posedge rst) begin
        if (rst)
            count <= 0;
        else if (count == 9999)
            count <= 0;
        else
            count <= count + 1;
    end

    always @(*) begin
        digit0 = count % 10;
        digit1 = (count / 10) % 10;
        digit2 = (count / 100) % 10;
        digit3 = (count / 1000) % 10;
    end
endmodule
