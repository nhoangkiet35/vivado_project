module digit_scan(
    input  wire clk,
    input  wire rst,
    input  wire [3:0] d0,
    input  wire [3:0] d1,
    input  wire [3:0] d2,
    input  wire [3:0] d3,
    output wire SCLK,
    output wire RCLK,
    output wire DIO
);
    wire [7:0] seg_data;
    wire [7:0] digit_sel;
    wire [15:0] data16;
    wire start, busy;

    reg [1:0] scan_cnt;

    reg [3:0] current_digit;

    // Quét 4 digit
    always @(posedge clk or posedge rst) begin
        if (rst)
            scan_cnt <= 0;
        else
            scan_cnt <= scan_cnt + 1;
    end

    // Chọn digit hiện tại
    always @(*) begin
        case(scan_cnt)
            2'd0: current_digit = d0;
            2'd1: current_digit = d1;
            2'd2: current_digit = d2;
            2'd3: current_digit = d3;
            default: current_digit = d0;
        endcase
    end

    // 7-segment decoder
    hex7seg u_hex7seg(
        .hex(current_digit),
        .seg(seg_data)
    );

    // Chọn chân digit active low
    digit_selector u_digit_sel(
        .scan_cnt(scan_cnt),
        .digit_sel(digit_sel)
    );

    // Driver dữ liệu cho shift register
    digit_driver u_digit_driver(
        .clk(clk),
        .rst(rst),
        .seg_data(seg_data),
        .digit_sel(digit_sel),
        .busy(busy),
        .data16(data16),
        .start(start)
    );

    // Shift driver 74HC595
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
