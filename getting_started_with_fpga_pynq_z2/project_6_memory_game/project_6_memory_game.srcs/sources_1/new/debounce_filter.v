// debounce_filter.v
module debounce_filter #(parameter integer DEBOUNCE_LIMIT = 20) (
    input  wire i_clk,
    input  wire i_bouncy,
    output reg  o_debounced = 1'b0
);
    // clog2 function (verilog)
    function integer clog2;
        input integer value;
        integer v;
        begin
            v = value - 1;
            for (clog2 = 0; v > 0; clog2 = clog2 + 1)
                v = v >> 1;
        end
    endfunction

    localparam integer WIDTH = (DEBOUNCE_LIMIT <= 1) ? 1 : clog2(DEBOUNCE_LIMIT);
    reg [WIDTH-1:0] r_count = {WIDTH{1'b0}};
    reg r_state = 1'b0;

    always @(posedge i_clk) begin
        if (i_bouncy !== r_state) begin
            if (r_count < DEBOUNCE_LIMIT - 1)
                r_count <= r_count + 1'b1;
            else begin
                r_state <= i_bouncy;
                r_count <= {WIDTH{1'b0}};
            end
        end else begin
            r_count <= {WIDTH{1'b0}};
        end
        o_debounced <= r_state;
    end
endmodule
