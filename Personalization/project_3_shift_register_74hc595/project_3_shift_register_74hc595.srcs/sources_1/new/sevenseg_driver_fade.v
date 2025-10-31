module sevenseg_driver_fade(
    input clk,            // 100 MHz
    input rst_n,          // Active low reset
    output SER,
    output SRCLK,
    output RCLK
);
    // ===== Counter 0000 → 9999 =====
    reg [31:0] counter;
    reg [19:0] delay_cnt;

    always @(posedge clk or negedge rst_n) begin
        if(!rst_n)
            counter <= 0;
        else if(delay_cnt == 20'd4_999_999) begin
            delay_cnt <= 0;
            counter <= (counter == 9999) ? 0 : counter + 1;
        end else
            delay_cnt <= delay_cnt + 1;
    end

    // ===== Decode 4 digits =====
    reg [3:0] digits [3:0];
    always @(*) begin
        digits[0] = counter % 10;
        digits[1] = (counter / 10) % 10;
        digits[2] = (counter / 100) % 10;
        digits[3] = (counter / 1000) % 10;
    end

    // ===== Common Anode segment map =====
    function [7:0] seg_decode(input [3:0] num);
        case(num)
            4'd0: seg_decode = 8'b11000000;
            4'd1: seg_decode = 8'b11111001;
            4'd2: seg_decode = 8'b10100100;
            4'd3: seg_decode = 8'b10110000;
            4'd4: seg_decode = 8'b10011001;
            4'd5: seg_decode = 8'b10010010;
            4'd6: seg_decode = 8'b10000010;
            4'd7: seg_decode = 8'b11111000;
            4'd8: seg_decode = 8'b10000000;
            4'd9: seg_decode = 8'b10010000;
            default: seg_decode = 8'b11111111;
        endcase
    endfunction

    // ===== Multiplex scan =====
    reg [13:0] refresh_cnt;
    always @(posedge clk or negedge rst_n)
        if(!rst_n) refresh_cnt <= 0;
        else refresh_cnt <= refresh_cnt + 1;

    wire [1:0] scan_idx = refresh_cnt[13:12];
    reg [7:0] seg_data;
    reg [7:0] digit_mask;

    always @(*) begin
        case(scan_idx)
            2'd0: begin seg_data = seg_decode(digits[0]); digit_mask = 8'b11111110; end
            2'd1: begin seg_data = seg_decode(digits[1]); digit_mask = 8'b11111101; end
            2'd2: begin seg_data = seg_decode(digits[2]); digit_mask = 8'b11111011; end
            2'd3: begin seg_data = seg_decode(digits[3]); digit_mask = 8'b11110111; end
        endcase
    end

    // ===== Fade logic (PWM) =====
    reg [7:0] brightness = 0;
    reg fade_up = 1;
    reg [15:0] fade_cnt = 0;
    reg [7:0] pwm_cnt = 0;

    always @(posedge clk or negedge rst_n) begin
        if(!rst_n) begin
            brightness <= 0;
            fade_cnt <= 0;
            fade_up <= 1;
        end else begin
            if(fade_cnt == 16'd3000) begin
                fade_cnt <= 0;
                if(fade_up)
                    brightness <= brightness + 1;
                else
                    brightness <= brightness - 1;

                if(brightness >= 250) fade_up <= 0;
                if(brightness <= 5) fade_up <= 1;
            end else
                fade_cnt <= fade_cnt + 1;
        end
    end

    always @(posedge clk)
        pwm_cnt <= pwm_cnt + 1;

    wire pwm_active = (pwm_cnt < brightness);

    // ===== 74HC595 interface =====
    reg start_shift;
    reg [15:0] data_out;
    wire busy;

    shift_reg_74hc595 u_shift(
        .clk(clk),
        .rst_n(rst_n),
        .data_in(data_out),
        .start(start_shift),
        .busy(busy),
        .SER(SER),
        .SRCLK(SRCLK),
        .RCLK(RCLK)
    );

    always @(posedge clk or negedge rst_n) begin
        if(!rst_n) begin
            start_shift <= 0;
            data_out <= 0;
        end else if(!busy && pwm_active) begin
            data_out <= {digit_mask, seg_data};
            start_shift <= 1;
        end else
            start_shift <= 0;
    end

endmodule
