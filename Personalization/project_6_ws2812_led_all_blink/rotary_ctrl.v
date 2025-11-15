module rotary_ctrl (
    input  wire clk,
    input  wire rst,
    input  wire A, B,
    output reg [2:0] pattern_select
);
    reg [1:0] prev_AB;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            prev_AB <= 2'b00;
            pattern_select <= 0;
        end else begin
            prev_AB <= {A, B};
            case ({prev_AB, A, B})
                4'b0001, 4'b0111, 4'b1110, 4'b1000:
                    pattern_select <= (pattern_select == 4) ? 0 : pattern_select + 1; // xoay CW
                4'b0010, 4'b0100, 4'b1101, 4'b1011:
                    pattern_select <= (pattern_select == 0) ? 4 : pattern_select - 1; // xoay CCW
            endcase
        end
    end
endmodule
