module digit_selector(
    input  wire [1:0] scan_cnt,
    output reg  [7:0] digit_sel
);
    always @(*) begin
        case(scan_cnt)
            2'd0: digit_sel = 8'b0000_0001; // digit 0
            2'd1: digit_sel = 8'b0000_0010; // digit 1
            2'd2: digit_sel = 8'b0000_0100; // digit 2
            2'd3: digit_sel = 8'b0000_1000; // digit 3
            default: digit_sel = 8'b0000_1000;
        endcase
    end
endmodule
