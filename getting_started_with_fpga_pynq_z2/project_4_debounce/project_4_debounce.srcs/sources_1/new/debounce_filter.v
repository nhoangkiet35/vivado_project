module debounce_filter #(
    parameter integer DEBOUNCE_LIMIT = 10
) (
    input  wire i_clk,
    input  wire i_bouncy,
    output reg  o_debounced = 1'b0
);
    localparam WIDTH = $clog2(DEBOUNCE_LIMIT);
    reg [WIDTH-1:0] r_count = 0;
    reg r_stable_state = 0;

    always @(posedge i_clk) begin
        // Nếu tín hiệu thay đổi, tăng bộ đếm
        if (i_bouncy != r_stable_state) begin
            if (r_count < DEBOUNCE_LIMIT - 1)
                r_count <= r_count + 1;
            else begin
                // Sau khi giữ trạng thái đủ lâu, cập nhật output
                r_stable_state <= i_bouncy;
                r_count <= 0;
            end
        end else
            r_count <= 0;

        o_debounced <= r_stable_state;
    end
endmodule
