// char_mem.v
// 2 lines x 16 chars ROM
`timescale 1ns/1ps
module char_mem(
    input  wire [4:0] addr,   // 0..31
    output wire [7:0] bus
);
    // 2 lines x 16 chars = 32 chars = 256 bits
    localparam LINES = 2;
    localparam CHARS = 16;
    localparam TOTAL = LINES * CHARS; // 32

    // Put line1 first (left to right), then line2.
    // Each literal in braces is MSB-first slice.
    // Adjust these strings to change displayed text (each must be 16 chars).
    localparam [TOTAL*8-1:0] STR =
        { "   Spartan-3E LCD ",   // line 2 (16 chars)
          " Hello, world!   "     // line 1 (16 chars)
        };

    // Verilog stores strings left-to-right into MSB..LSB, so index accordingly.
    // For addr 0 -> first character of line1 (lowest index in our layout), we need mapping.
    // We'll map addr 0..15 -> chars of line1, addr16..31 -> chars of line2.
    // Compute bit index: char N (0=first char of line1) sits at STR[(TOTAL*8-1) - N*8 -: 8].
    wire [11:0] bit_index;
    assign bit_index = (TOTAL*8 - 1) - (addr * 8);
    assign bus = STR[bit_index -: 8];
endmodule
