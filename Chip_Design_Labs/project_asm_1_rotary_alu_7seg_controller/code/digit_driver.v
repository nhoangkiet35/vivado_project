module digit_driver(
    input  wire clk,
    input  wire rst,
    input  wire [7:0] seg_data,   // mã 7-segment
    input  wire [7:0] digit_sel,  // chọn digit (active low)
    input  wire busy,             // từ shift register
    output reg  [15:0] data16,   // dữ liệu shift ra
    output reg  start             // tín hiệu bắt đầu shift
);

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            data16 <= 16'hFFFF;
            start  <= 0;
        end else if (!busy) begin
            data16 <= {seg_data, digit_sel}; // SEG trước, DIGIT sau
            start  <= 1;
        end else begin
            start <= 0;
        end
    end
endmodule
