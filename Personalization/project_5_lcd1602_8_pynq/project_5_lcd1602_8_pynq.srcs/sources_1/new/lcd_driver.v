// Hiển thị "HELLO PYNQ-Z2" trên LCD1602 8-bit mode, không reset.

module lcd_driver(
    input  wire clk,
    output reg [7:0] lcd_db,
    output reg lcd_rs,
    output reg lcd_rw,
    output reg lcd_e
);

    // Clock 125MHz
    localparam integer CLK_FREQ = 125_000_000;
    localparam integer DELAY_1MS = CLK_FREQ / 1000;

    reg [31:0] cnt = 0;
    reg [7:0] step = 0;

    // Chuỗi ký tự hiển thị
    reg [7:0] text [0:15];
    initial begin
        text[0]  = "H"; text[1]  = "E"; text[2]  = "L"; text[3]  = "L";
        text[4]  = "O"; text[5]  = " "; text[6]  = "P"; text[7]  = "Y";
        text[8]  = "N"; text[9]  = "Q"; text[10] = "-"; text[11] = "Z";
        text[12] = "2"; text[13] = " "; text[14] = " "; text[15] = " ";
    end

    always @(posedge clk) begin
        cnt <= cnt + 1;

        case (step)
            0:  if (cnt > DELAY_1MS*20) begin lcd_db <= 8'h38; lcd_rs <= 0; lcd_rw <= 0; lcd_e <= 1; step <= 1; cnt <= 0; end // Function set
            1:  if (cnt > DELAY_1MS*2)  begin lcd_e <= 0; step <= 2; cnt <= 0; end
            2:  if (cnt > DELAY_1MS*2)  begin lcd_db <= 8'h0C; lcd_rs <= 0; lcd_e <= 1; step <= 3; cnt <= 0; end // Display on
            3:  if (cnt > DELAY_1MS*2)  begin lcd_e <= 0; step <= 4; cnt <= 0; end
            4:  if (cnt > DELAY_1MS*2)  begin lcd_db <= 8'h01; lcd_rs <= 0; lcd_e <= 1; step <= 5; cnt <= 0; end // Clear
            5:  if (cnt > DELAY_1MS*2)  begin lcd_e <= 0; step <= 6; cnt <= 0; end
            6:  if (cnt > DELAY_1MS*2)  begin lcd_db <= 8'h80; lcd_rs <= 0; lcd_e <= 1; step <= 7; cnt <= 0; end // Set DDRAM addr = 0x00
            7:  if (cnt > DELAY_1MS*2)  begin lcd_e <= 0; step <= 8; cnt <= 0; end

            // Ghi 16 ký tự
            8:  if (cnt > DELAY_1MS*2)  begin lcd_db <= text[0];  lcd_rs <= 1; lcd_e <= 1; step <= 9;  cnt <= 0; end
            9:  if (cnt > DELAY_1MS)    begin lcd_e <= 0; step <= 10; cnt <= 0; end
            10: if (cnt > DELAY_1MS*2)  begin lcd_db <= text[1];  lcd_rs <= 1; lcd_e <= 1; step <= 11; cnt <= 0; end
            11: if (cnt > DELAY_1MS)    begin lcd_e <= 0; step <= 12; cnt <= 0; end
            12: if (cnt > DELAY_1MS*2)  begin lcd_db <= text[2];  lcd_rs <= 1; lcd_e <= 1; step <= 13; cnt <= 0; end
            13: if (cnt > DELAY_1MS)    begin lcd_e <= 0; step <= 14; cnt <= 0; end
            14: if (cnt > DELAY_1MS*2)  begin lcd_db <= text[3];  lcd_rs <= 1; lcd_e <= 1; step <= 15; cnt <= 0; end
            15: if (cnt > DELAY_1MS)    begin lcd_e <= 0; step <= 16; cnt <= 0; end
            16: if (cnt > DELAY_1MS*2)  begin lcd_db <= text[4];  lcd_rs <= 1; lcd_e <= 1; step <= 17; cnt <= 0; end
            17: if (cnt > DELAY_1MS)    begin lcd_e <= 0; step <= 18; cnt <= 0; end
            18: if (cnt > DELAY_1MS*2)  begin lcd_db <= text[5];  lcd_rs <= 1; lcd_e <= 1; step <= 19; cnt <= 0; end
            19: if (cnt > DELAY_1MS)    begin lcd_e <= 0; step <= 20; cnt <= 0; end
            20: if (cnt > DELAY_1MS*2)  begin lcd_db <= text[6];  lcd_rs <= 1; lcd_e <= 1; step <= 21; cnt <= 0; end
            21: if (cnt > DELAY_1MS)    begin lcd_e <= 0; step <= 22; cnt <= 0; end
            22: if (cnt > DELAY_1MS*2)  begin lcd_db <= text[7];  lcd_rs <= 1; lcd_e <= 1; step <= 23; cnt <= 0; end
            23: if (cnt > DELAY_1MS)    begin lcd_e <= 0; step <= 24; cnt <= 0; end
            24: if (cnt > DELAY_1MS*2)  begin lcd_db <= text[8];  lcd_rs <= 1; lcd_e <= 1; step <= 25; cnt <= 0; end
            25: if (cnt > DELAY_1MS)    begin lcd_e <= 0; step <= 26; cnt <= 0; end
            26: if (cnt > DELAY_1MS*2)  begin lcd_db <= text[9];  lcd_rs <= 1; lcd_e <= 1; step <= 27; cnt <= 0; end
            27: if (cnt > DELAY_1MS)    begin lcd_e <= 0; step <= 28; cnt <= 0; end
            28: if (cnt > DELAY_1MS*2)  begin lcd_db <= text[10]; lcd_rs <= 1; lcd_e <= 1; step <= 29; cnt <= 0; end
            29: if (cnt > DELAY_1MS)    begin lcd_e <= 0; step <= 30; cnt <= 0; end
            30: if (cnt > DELAY_1MS*2)  begin lcd_db <= text[11]; lcd_rs <= 1; lcd_e <= 1; step <= 31; cnt <= 0; end
            31: if (cnt > DELAY_1MS)    begin lcd_e <= 0; step <= 32; cnt <= 0; end
            32: if (cnt > DELAY_1MS*2)  begin lcd_db <= text[12]; lcd_rs <= 1; lcd_e <= 1; step <= 33; cnt <= 0; end
            33: if (cnt > DELAY_1MS)    begin lcd_e <= 0; step <= 34; cnt <= 0; end
            34: if (cnt > DELAY_1MS*2)  begin lcd_db <= text[13]; lcd_rs <= 1; lcd_e <= 1; step <= 35; cnt <= 0; end
            35: if (cnt > DELAY_1MS)    begin lcd_e <= 0; step <= 36; cnt <= 0; end
            36: if (cnt > DELAY_1MS*2)  begin lcd_db <= text[14]; lcd_rs <= 1; lcd_e <= 1; step <= 37; cnt <= 0; end
            37: if (cnt > DELAY_1MS)    begin lcd_e <= 0; step <= 38; cnt <= 0; end
            38: if (cnt > DELAY_1MS*2)  begin lcd_db <= text[15]; lcd_rs <= 1; lcd_e <= 1; step <= 39; cnt <= 0; end
            39: if (cnt > DELAY_1MS)    begin lcd_e <= 0; step <= 40; cnt <= 0; end

            40: step <= 40; // Done
        endcase
    end

endmodule
