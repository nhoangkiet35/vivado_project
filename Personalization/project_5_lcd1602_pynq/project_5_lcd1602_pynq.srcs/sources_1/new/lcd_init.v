module lcd_init(
    input wire clk,
    output reg done,
    output reg lcd_rs,
    output reg lcd_e,
    output reg [3:0] lcd_data
);
    reg [31:0] cnt;
    reg [5:0] state;

    localparam DELAY = 2_000_000; // khoảng delay 16ms (ở 125 MHz)

    always @(posedge clk) begin
        if (done == 1'b0) begin
            cnt <= cnt + 1;
            if (cnt >= DELAY) begin
                cnt <= 0;
                state <= state + 1;
            end

            case (state)
                0: begin lcd_rs <= 0; lcd_data <= 4'b0011; lcd_e <= 1; end // Function set
                1: begin lcd_e <= 0; end
                2: begin lcd_rs <= 0; lcd_data <= 4'b0010; lcd_e <= 1; end // 4-bit mode
                3: begin lcd_e <= 0; end
                4: begin lcd_rs <= 0; lcd_data <= 4'b1000; lcd_e <= 1; end // 2 line
                5: begin lcd_e <= 0; end
                6: begin lcd_rs <= 0; lcd_data <= 4'b0000; lcd_e <= 1; end // Display ON
                7: begin lcd_data <= 4'b1100; end
                8: begin lcd_e <= 0; end
                9: begin lcd_rs <= 0; lcd_data <= 4'b0000; lcd_e <= 1; end // Clear
                10: begin lcd_data <= 4'b0001; end
                11: begin lcd_e <= 0; done <= 1; end
            endcase
        end
    end
endmodule
