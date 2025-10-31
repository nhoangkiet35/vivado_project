module cd4017(
    input clk,      
    input rst, 
    input enable,     // clock inhibit: enable: 0 = count, 1 = inhibit
    output reg [9:0] q,
    output carry_out  // lên 1 khi count = 9
);
    reg [3:0] count; // 0..9 => 4 bits

    always @(posedge clk or posedge rst) begin
        if (rst)
            count <= 4'd0;
        else if (!enable) begin
            if (count == 4'd9) count <= 4'd0;
            else count <= count + 4'd1;
        end
    end

    always @(*) begin
        q = 10'b0;
        q[count] = 1'b1;
    end

    assign carry_out = (count == 4'd9); // carry_out lên 1 khi count == 9
endmodule