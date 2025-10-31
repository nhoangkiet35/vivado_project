// rotary_encoder.v - giải mã KY-040 (KY-04) đơn giản với synchronizer + direction detect + debounce nút
module rotary_encoder #(
    parameter CLK_FREQ = 100_000_000, // 100MHz
    parameter DEBOUNCE_MS = 5         // debounce cho nút (ms)
)(
    input  wire clk,
    input  wire rst,           // active high
    input  wire rot_a_raw,     // chân A của KY-040
    input  wire rot_b_raw,     // chân B của KY-040
    input  wire sw_raw,        // nút nhấn SW (active low thường)
    output reg  inc,           // 1 clock pulse khi tăng
    output reg  dec,           // 1 clock pulse khi giảm
    output reg  sw_pressed     // nhấn nút (pulse 1 clk)
);
    // --- Synchronizers (2-stage) ---
    reg a_s1, a_s2;
    reg b_s1, b_s2;
    reg sw_s1, sw_s2;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            a_s1 <= 0; a_s2 <= 0;
            b_s1 <= 0; b_s2 <= 0;
            sw_s1 <= 1; sw_s2 <= 1; // assume pull-up => idle = 1
        end else begin
            a_s1 <= rot_a_raw; a_s2 <= a_s1;
            b_s1 <= rot_b_raw; b_s2 <= b_s1;
            sw_s1 <= sw_raw; sw_s2 <= sw_s1;
        end
    end

    // --- Debounce logic for A/B/SW ---
    localparam integer DEBOUNCE_CNT_MAX = (CLK_FREQ/1000) * DEBOUNCE_MS;
    localparam integer CNT_WIDTH = $clog2(DEBOUNCE_CNT_MAX);

    reg [CNT_WIDTH-1:0] cnt_a, cnt_b, cnt_sw;
    reg a_db, b_db, sw_db; // debounced outputs

    // Debounce channel A
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            cnt_a <= 0;
            a_db <= 0;
        end else if (a_s2 != a_db) begin
            if (cnt_a == DEBOUNCE_CNT_MAX-1) begin
                a_db <= a_s2;
                cnt_a <= 0;
            end else cnt_a <= cnt_a + 1;
        end else cnt_a <= 0;
    end
    
    // Debounce channel B
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            cnt_b <= 0;
            b_db <= 0;
        end else if (b_s2 != b_db) begin
            if (cnt_b == DEBOUNCE_CNT_MAX-1) begin
                b_db <= b_s2;
                cnt_b <= 0;
            end else cnt_b <= cnt_b + 1;
        end else cnt_b <= 0;
    end
    
    // Debounce button SW (active low)
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            cnt_sw <= 0;
            sw_db <= 1;
            sw_pressed <= 0;
        end else begin
            sw_pressed <= 0;
            if (sw_s2 != sw_db) begin
                if (cnt_sw == DEBOUNCE_CNT_MAX-1) begin
                    sw_db <= sw_s2;
                    cnt_sw <= 0;
                    if (sw_s2 == 0) sw_pressed <= 1; // pressed pulse
                end else cnt_sw <= cnt_sw + 1;
            end else cnt_sw <= 0;
        end
    end
    
    // --- Quadrature decoding using previous AB state ---
    reg [1:0] prev_ab, cur_ab;

    // We'll trigger on edges (both A and B edges). Use lookup table method.
    // transitions producing +1: 00->01->11->10->00 (CW) ; reverse for CCW.
    // We'll detect direction by (prev_ab, cur_ab) pair.
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            prev_ab <= 2'b00;
            cur_ab <= 2'b00;
            inc <= 0;
            dec <= 0;
        end else begin
            inc <= 0;
            dec <= 0;
            cur_ab <= {a_db, b_db};
            if (cur_ab != prev_ab) begin
                // Kiểm tra hướng quay dựa trên sự thay đổi giữa 2 trạng thái
                case ({prev_ab, cur_ab})
                    // CW transitions -> inc
                    4'b0001, 4'b0111, 4'b1110, 4'b1000: inc <= 1; // CW
                    // CCW transitions -> dec
                    4'b0010, 4'b1011, 4'b1101, 4'b0100: dec <= 1; // CCW
                    default: ; // không thay đổi 
                endcase
                prev_ab <= cur_ab;
            end 
        end
    end

endmodule