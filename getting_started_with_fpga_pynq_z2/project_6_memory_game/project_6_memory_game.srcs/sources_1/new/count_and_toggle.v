// count_and_toggle.v
module count_and_toggle #(
    parameter integer COUNT_LIMIT = 10
) (
    input  wire i_clk,
    input  wire i_enable,
    output reg  o_toggle = 1'b0
);
    // clog2 function
    function integer clog2;
        input integer value;
        integer v;
        begin
            v = value - 1;
            for (clog2 = 0; v > 0; clog2 = clog2 + 1)
                v = v >> 1;
        end
    endfunction

    localparam integer WIDTH = (COUNT_LIMIT <= 1) ? 1 : clog2(COUNT_LIMIT);
    reg [WIDTH-1:0] r_counter = {WIDTH{1'b0}};

    always @(posedge i_clk) begin
        if (!i_enable) begin
            r_counter <= {WIDTH{1'b0}};
            o_toggle  <= 1'b0;
        end else if (r_counter == COUNT_LIMIT - 1) begin
            r_counter <= {WIDTH{1'b0}};
            o_toggle  <= ~o_toggle;
        end else begin
            r_counter <= r_counter + 1'b1;
        end
    end
endmodule
