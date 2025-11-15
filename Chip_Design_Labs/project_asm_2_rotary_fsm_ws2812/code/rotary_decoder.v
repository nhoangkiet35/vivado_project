module rotary_decoder(
    input  clk,
    input  rst,
    input  A,
    input  B,
    output reg pulse_up,
    output reg pulse_down
);

    // 1) Đồng bộ tín hiệu chống metastability
    reg A1, A2, B1, B2;
    always @(posedge clk) begin
        A1 <= A;  A2 <= A1;
        B1 <= B;  B2 <= B1;
    end

    // 4 trạng thái hợp lệ: 00,01,11,10
    wire [1:0] curr = {A2, B2};
    reg  [1:0] prev;

    // accumulator đếm chuyển động liên tục
    // CW: +1 mỗi bước
    // CCW: -1 mỗi bước
    integer acc;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            prev       <= 2'b00;
            acc        <= 0;
            pulse_up   <= 0;
            pulse_down <= 0;
        end else begin
            pulse_up   <= 0;
            pulse_down <= 0;

            if (curr != prev) begin
                // =============== FSM CHUYỂN TRẠNG THÁI HỢP LỆ ===============

                case ({prev, curr})
                    // ---- CW steps ----
                    4'b00_10,
                    4'b10_11,
                    4'b11_01,
                    4'b01_00:
                        acc <= acc + 1;

                    // ---- CCW steps ----
                    4'b00_01,
                    4'b01_11,
                    4'b11_10,
                    4'b10_00:
                        acc <= acc - 1;

                    // ---- Noise, glitch, bounce ----
                    default: 
                        acc <= 0;   // reset cycle
                endcase

                prev <= curr;

                // =============== FULL CYCLE FINISH (1 DETENT) ===============
                if (acc == 4) begin
                    pulse_up <= 1;
                    acc <= 0;
                end else if (acc == -4) begin
                    pulse_down <= 1;
                    acc <= 0;
                end
            end
        end
    end

endmodule
