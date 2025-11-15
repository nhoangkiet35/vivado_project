module lcd_driver(
    input  wire clk,
    output reg [7:0] lcd_db,
    output reg lcd_rs,
    output reg lcd_rw,
    output reg lcd_e
);

    // Clock 125MHz
    localparam integer CLK_FREQ     = 125_000_000;
    localparam integer DELAY_1MS    = 125_000; // CLK_FREQ * (t / 1000)
    localparam integer DELAY_2MS    = 250_000;
    localparam integer DELAY_5MS    = 625_000;
    localparam integer DELAY_20MS   = 2_500_000;

    reg [31:0] cnt = 0;
    reg [7:0] step = 0;
    reg [4:0] char_index = 0;  // đếm ký tự 0-15

    // Chuỗi ký tự hiển thị
    reg [255:0] msg = {"# FPT Jetking 5 ", 
                       " LCD 8-BIT MODE "};
    reg [7:0] text [0:31];
    integer i;
    initial begin
        for (i = 0; i < 32; i = i + 1)
            text[i] = msg[(255 - i*8) -: 8];
    end


    always @(posedge clk) begin
        cnt <= cnt + 1;

        case (step)
            // Clear Display
            0:  if (cnt > DELAY_20MS)  begin lcd_db <= 8'h01; lcd_rs <= 0; lcd_e <= 1; step <= 1; cnt <= 0; end 
            1:  if (cnt > DELAY_5MS)  begin lcd_e <= 0; step <= 2; cnt <= 0; end
            // Function set: 8-bit, 2 line, 5x8 font
            2:  if (cnt > DELAY_20MS) begin lcd_db <= 8'h38; lcd_rs <= 0; lcd_rw <= 0; lcd_e <= 1; step <= 3; cnt <= 0; end
            3:  if (cnt > DELAY_5MS)  begin lcd_e <= 0; step <= 4; cnt <= 0; end
            // Display ON, Cursor OFF, Blink OFF
            4:  if (cnt > DELAY_2MS)  begin lcd_db <= 8'h0C; lcd_rs <= 0; lcd_e <= 1; step <= 5; cnt <= 0; end 
            5:  if (cnt > DELAY_5MS)  begin lcd_e <= 0; step <= 6; cnt <= 0; end
            // Return home
            6:  if (cnt > DELAY_2MS)  begin lcd_db <= 8'h80; lcd_rs <= 0; lcd_e <= 1; step <= 7; cnt <= 0; end 
            7:  if (cnt > DELAY_5MS)  begin lcd_e <= 0; step <= 8; cnt <= 0; end

            // Ghi 16 ký tự
            // -------------------------------
            // DÒNG 1: "HELLO PYNQ-Z2"
            // -------------------------------
            8: begin
                if (cnt > DELAY_2MS) begin
                    lcd_db <= text[char_index];
                    lcd_rs <= 1; lcd_e  <= 1;
                    step   <= 9; cnt    <= 0;
                end
            end
            9: begin
                if (cnt > DELAY_1MS) begin
                    lcd_e <= 0; cnt   <= 0;
                    // chuyển sang dòng tiếp theo
                    if (char_index < 15) begin
                        char_index <= char_index + 1;
                        step <= 8;    // lặp lại
                    end else begin
                        char_index <= char_index + 1; // sang ký tự 16
                        step <= 10;                   // sang dòng 2
                    end
                end
            end
            
            // -------------------------------
            // DÒNG 2: "LCD 8-BIT MODE"
            // -------------------------------
            10:  if (cnt > DELAY_5MS)  begin lcd_db <= 8'hC0; lcd_rs <= 0; lcd_e <= 1; step <= 11; cnt <= 0; end 
            11:  if (cnt > DELAY_20MS) begin lcd_e <= 0; step <= 12; cnt <= 0; end

            12: begin
                if (cnt > DELAY_2MS) begin
                    lcd_db <= text[char_index];
                    lcd_rs <= 1; lcd_e  <= 1;
                    step   <= 13; cnt   <= 0;
                end
            end
            13: begin
                if (cnt > DELAY_1MS) begin
                    lcd_e <= 0; cnt   <= 0;
                    // chuyển sang ký tự tiếp theo
                    if (char_index < 31) begin
                        char_index <= char_index + 1;
                        step <= 12;    // lặp lại
                    end else begin
                        step <= 40;   // xong dòng
                    end
                end
            end
            
            // ------------------- DỪNG -------------------
            default: begin lcd_e <= 0; lcd_rs <= 0; step <= 40; cnt <= 0; end // Done
        endcase
    end

endmodule
