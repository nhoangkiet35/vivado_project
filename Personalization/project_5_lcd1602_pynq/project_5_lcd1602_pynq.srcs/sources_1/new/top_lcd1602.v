module top_lcd1602(
    input clk,               // 125 MHz clock
    output lcd_rs,
    output lcd_e,
    output [3:0] lcd_data,
    output pwm_out           // PWM điều khiển độ sáng LCD (chân V0)
);
    wire done_init;
    
    // ================= PWM cho V0 =================
    pwm_gen pwm(.clk(clk), .pwm_out(pwm_out));
    
    // Giai đoạn 1: khởi tạo LCD
    lcd_init init(
        .clk(clk),
        .done(done_init),
        .lcd_rs(),
        .lcd_e(),
        .lcd_data()
    );
    
    // ================= Đọc ký tự từ ROM =================
    reg [4:0] addr = 0;
    wire [7:0] char_data;
    reg send = 0;
    wire busy;

    char_reader u_char_reader(
        .clk(clk),
        .addr(addr),
        .data(char_data)
    );

    // ================= LCD Driver =================
    // Giai đoạn 2: hiển thị nội dung
    lcd_driver u_lcd(
        .clk(clk),
        .data_in(char_data),
        .send(send),
        .lcd_rs(lcd_rs),
        .lcd_e(lcd_e),
        .lcd_data(lcd_data),
        .busy(busy)
    );

    // ================= Logic điều khiển hiển thị =================
    localparam MAX_ADDR = 31;
    reg [23:0] delay_cnt;

    always @(posedge clk) begin
        if (delay_cnt < 12500000) begin // delay khoảng 0.1s
            delay_cnt <= delay_cnt + 1;
            send <= 0;
        end else begin
            delay_cnt <= 0;
            if (!busy) begin
                send <= 1;
                if (addr < MAX_ADDR)
                    addr <= addr + 1;
                else
                    addr <= 0;
            end else begin
                send <= 0;
            end
        end
    end
endmodule
