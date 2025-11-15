module char_reader(
    input clk,
    input [4:0] addr,
    output reg [7:0] data
);
    wire [7:0] rom_out;

    // dùng char_mem gốc
    char_mem u_mem (
        .addr(addr),
        .bus(rom_out)
    );

    always @(posedge clk) begin
        data <= rom_out;
    end
endmodule
