module button_manager #(
    parameter CLK_FREQ = 125_000_000,     // clock FPGA
    parameter DEBOUNCE_MS = 20,           // 20ms debounce
    parameter HOLD_TIME_MS = 2000         // 2 seconds hold
)(
    input  clk,
    input  rst,
    input  btn_raw,
    output reg btn_short,
    output reg btn_hold
);

    localparam DEBOUNCE_CNT = (CLK_FREQ / 1000) * DEBOUNCE_MS;
    localparam HOLD_CNT     = (CLK_FREQ / 1000) * HOLD_TIME_MS;

    reg btn_sync0, btn_sync1;
    reg btn_stable;
    reg [31:0] cnt_debounce;
    reg [31:0] cnt_hold;
    reg btn_prev;

    // Sync
    always @(posedge clk) begin
        btn_sync0 <= btn_raw;
        btn_sync1 <= btn_sync0;
    end

    // Debounce
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            btn_stable   <= 0;
            cnt_debounce <= 0;
        end else begin
            if (btn_sync1 != btn_stable) begin
                cnt_debounce <= cnt_debounce + 1;
                if (cnt_debounce >= DEBOUNCE_CNT) begin
                    btn_stable   <= btn_sync1;
                    cnt_debounce <= 0;
                end
            end else begin
                cnt_debounce <= 0;
            end
        end
    end

    // Detect short + hold
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            btn_prev  <= 0;
            btn_hold  <= 0;
            btn_short <= 0;
            cnt_hold  <= 0;
        end else begin
            btn_short <= 0;
            btn_hold  <= 0;

            // Holding
            if (btn_stable) begin
                cnt_hold <= cnt_hold + 1;
                if (cnt_hold >= HOLD_CNT)
                    btn_hold <= 1;
            end else begin
                // Release -> short press
                if (btn_prev == 1 && cnt_hold < HOLD_CNT)
                    btn_short <= 1;

                cnt_hold <= 0;
            end

            btn_prev <= btn_stable;
        end
    end

endmodule
