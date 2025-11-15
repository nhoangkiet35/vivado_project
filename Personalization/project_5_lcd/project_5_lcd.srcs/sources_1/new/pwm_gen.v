module pwm_gen #(
    parameter CLK_FREQ = 125_000_000,  // 125 MHz
    parameter PWM_FREQ = 1000          // 1 kHz PWM
)(
    input wire clk,                    // Clock 125 MHz
    output reg pwm_out                 // Kết nối ra V0 LCD
);
    localparam integer CNT_MAX = CLK_FREQ / PWM_FREQ; // ~125000 đếm cho 1 chu kỳ PWM
    localparam integer DUTY_CYCLE = CNT_MAX * 60 / 100; // 60% duty 

    reg [31:0] cnt = 0;

    always @(posedge clk) begin
        if (cnt < CNT_MAX - 1) cnt <= cnt + 1;
        else cnt <= 0;

        // So sánh để tạo xung PWM
        if (cnt < DUTY_CYCLE) pwm_out <= 1;
        else pwm_out <= 0;
    end
endmodule
