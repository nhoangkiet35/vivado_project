`timescale 1ns/1ps

module tb_and_gate;
    reg A, B;
    wire Y;

    // Gọi module and_gate
    and_gate uut (
        .a(A),
        .b(B),
        .y(Y)
    );

    initial begin
        $monitor("t=%0t | A=%b B=%b | Y=%b", $time, A, B, Y);

        // Kiểm tra tất cả tổ hợp
        A = 0; B = 0; #10;
        A = 0; B = 1; #10;
        A = 1; B = 0; #10;
        A = 1; B = 1; #10;

        $finish;
    end
endmodule
