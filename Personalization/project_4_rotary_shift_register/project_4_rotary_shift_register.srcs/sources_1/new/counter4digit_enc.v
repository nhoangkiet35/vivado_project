// counter4digit_enc.v
// Đếm 0..9999, điều khiển bởi encoder pulses (inc_pulse / dec_pulse)
// Có nút reset (sw_reset) để về 0.
// Cải tiến: lọc xung encoder, tránh đếm double-step.

module counter4digit_enc(
    input  wire clk,
    input  wire rst,
    input  wire inc_pulse,    // 1 clock pulse => +1
    input  wire dec_pulse,    // 1 clock pulse => -1
    input  wire sw_reset,     // pulse => reset to 0
    output reg [3:0] digit0,  // units
    output reg [3:0] digit1,  // tens
    output reg [3:0] digit2,  // hundreds
    output reg [3:0] digit3   // thousands
);
    reg [13:0] count; 
    reg inc_pulse_d, dec_pulse_d;
    wire inc_edge, dec_edge;

    // Bắt cạnh lên để tránh xung rộng
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            inc_pulse_d <= 0;
            dec_pulse_d <= 0;
        end else begin
            inc_pulse_d <= inc_pulse;
            dec_pulse_d <= dec_pulse;
        end
    end

    assign inc_edge = inc_pulse & ~inc_pulse_d;
    assign dec_edge = dec_pulse & ~dec_pulse_d;

    // Đếm chính
    always @(posedge clk or posedge rst) begin
        if (rst)
            count <= 0;
        else if (sw_reset)
            count <= 0;
        else begin
            if (inc_edge && !dec_edge) begin
                if (count == 9999)
                    count <= 0;
                else
                    count <= count + 1;
            end 
            else if (dec_edge && !inc_edge) begin
                if (count == 0)
                    count <= 9999;
                else
                    count <= count - 1;
            end
        end
    end

    // Giải mã BCD
    always @(*) begin
        digit0 = count % 10;
        digit1 = (count / 10) % 10;
        digit2 = (count / 100) % 10;
        digit3 = (count / 1000) % 10;
    end

endmodule
