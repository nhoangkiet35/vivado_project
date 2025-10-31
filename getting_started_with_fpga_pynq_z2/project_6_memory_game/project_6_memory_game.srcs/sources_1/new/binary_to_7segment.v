// binary_to_7segment.v
module binary_to_7segment (
    input  wire       i_clk,
    input  wire [3:0] i_binary_num,
    output reg  [6:0] o_segment
);
    always @(posedge i_clk) begin
        case (i_binary_num)
            4'h0: o_segment <= 7'b1111110;
            4'h1: o_segment <= 7'b0110000;
            4'h2: o_segment <= 7'b1101101;
            4'h3: o_segment <= 7'b1111001;
            4'h4: o_segment <= 7'b0110011;
            4'h5: o_segment <= 7'b1011011;
            4'h6: o_segment <= 7'b1011111;
            4'h7: o_segment <= 7'b1110000;
            4'h8: o_segment <= 7'b1111111;
            4'h9: o_segment <= 7'b1111011;
            4'hA: o_segment <= 7'b1110111; // A (winner)
            4'hF: o_segment <= 7'b1000111; // F (loser)
            default: o_segment <= 7'b0000000;
        endcase
    end
endmodule
