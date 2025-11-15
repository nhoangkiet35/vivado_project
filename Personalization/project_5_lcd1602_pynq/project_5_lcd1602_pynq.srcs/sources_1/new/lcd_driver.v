module lcd_driver(
    input clk,              // 125 MHz clock
    input [7:0] data_in,    // ký tự ASCII từ ROM
    input send,             // trigger gửi ký tự
    output reg lcd_rs,
    output reg lcd_e,
    output reg [3:0] lcd_data,
    output reg busy
);

    localparam CLK_DIV = 12500000; // ~10Hz, delay cơ bản
    reg [23:0] cnt;
    reg [3:0] state;

    always @(posedge clk) begin
        if (cnt < CLK_DIV - 1)
            cnt <= cnt + 1;
        else begin
            cnt <= 0;
            case (state)
                0: begin
                    if (send) begin
                        lcd_rs <= 1;
                        lcd_data <= data_in[7:4];
                        lcd_e <= 1;
                        busy <= 1;
                        state <= 1;
                    end
                end
                1: begin
                    lcd_e <= 0;
                    state <= 2;
                end
                2: begin
                    lcd_data <= data_in[3:0];
                    lcd_e <= 1;
                    state <= 3;
                end
                3: begin
                    lcd_e <= 0;
                    busy <= 0;
                    state <= 0;
                end
            endcase
        end
    end
endmodule
