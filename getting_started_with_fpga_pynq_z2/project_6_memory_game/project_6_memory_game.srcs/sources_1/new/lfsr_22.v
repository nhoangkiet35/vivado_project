// lfsr_22.v
module lfsr_22 (
    input  wire        i_clk,
    output wire [21:0] o_lfsr_data
);
    // Non-zero seed to avoid all-zero lock
    reg [21:0] r_lfsr = 22'h2A5B3C; // choose any non-zero seed
    wire w_xnor = r_lfsr[21] ^~ r_lfsr[20];

    always @(posedge i_clk)
        r_lfsr <= {r_lfsr[20:0], w_xnor};

    assign o_lfsr_data = r_lfsr;
endmodule
