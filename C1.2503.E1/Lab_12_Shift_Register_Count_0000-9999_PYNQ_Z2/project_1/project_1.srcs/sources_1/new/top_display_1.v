module top_display_1 (
    input  wire clk,    // 100 MHz
    input  wire rst,
    output wire SCLK,   // SCLK (Shift Clock): mỗi lần lên xung → dữ liệu tại DIO được "đẩy" vào trong IC.
    output wire RCLK,   // RCLK (Latch): sau khi gửi đủ 8 bit → tạo 1 xung để cập nhật dữ liệu ra các ngõ Q0-Q7.
    output wire DIO     // DIO (Data Input): gửi từng bit dữ liệu (0 hoặc 1).
);


    // Digit mask (active low)
    // Lúc này cần 8 bit vì IC digit là byte đầy đủ
    localparam [7:0] DIGIT1 = 8'b0000_0001;  // chỉ D1 sáng


    // Mã 7 đoạn cho số "0" (active low: b và c sáng)
    localparam [7:0] SEG_1  = 8'b1100_0000;


    reg [15:0] data16;
    reg start;
    wire busy;


    always @(posedge clk or posedge rst) begin
        if (rst) begin
            data16 <= 16'hFFFF;
            start  <= 0;
        end else if (!busy) begin
            data16 <= {SEG_1, DIGIT1};  // SEG trước, DIGIT sau
            start  <= 1;
        end else begin
            start  <= 0;
        end
    end


    // Shift driver cho 74HC595
    shift_74hc595 #(
        .WIDTH(16),
        .HALF_CNT(50)
    ) shifter (
        .clk(clk),
        .rst(rst),
        .start(start),
        .data_in(data16),
        .SCLK(SCLK),
        .RCLK(RCLK),
        .DIO(DIO),
        .busy(busy)
    );


endmodule
