// lcd_driver.v
// Low-level 4-bit LCD byte writer (synthesizable, no # delays)
// Sends one byte when 'start' is pulsed high for one clk.
// rs_in = 1 -> data (RS=1), rs_in = 0 -> command (RS=0).
`timescale 1ns/1ps
module lcd_driver #(
    parameter CLK_FREQ_HZ = 100_000_000, // system clock
    parameter PULSE_US = 1,              // EN pulse width in microseconds
    parameter POST_US  = 40,             // typical post-byte wait (µs)
    parameter LONG_US  = 1600            // clear/home exec time (µs)
)(
    input  wire clk,
    input  wire rstn,
    input  wire start,        // pulse start for a byte
    input  wire [7:0] byte_in,
    input  wire rs_in,        // 1: data, 0: command
    output reg  busy,
    output reg  done_pulse,   // one clock wide when done
    // LCD physical pins (4-bit mode)
    output reg [3:0] lcd_data, // D7..D4
    output reg       lcd_rs,
    output reg       lcd_en,
    output wire      lcd_rw    // always write-only
);
    assign lcd_rw = 1'b0;

    // counters
    localparam integer PULSE_CNT = (CLK_FREQ_HZ/1000000) * PULSE_US;
    localparam integer POST_CNT  = (CLK_FREQ_HZ/1000000) * POST_US;
    localparam integer LONG_CNT  = (CLK_FREQ_HZ/1000000) * LONG_US;

    // FSM states
    localparam S_IDLE      = 3'd0;
    localparam S_SEND_HIGH = 3'd1;
    localparam S_PULSE_H   = 3'd2;
    localparam S_SEND_LOW  = 3'd3;
    localparam S_PULSE_L   = 3'd4;
    localparam S_WAIT      = 3'd5;
    localparam S_DONE      = 3'd6;

    reg [2:0] state, next;
    reg [31:0] counter;
    reg [7:0] latch_byte;
    reg latch_rs;
    reg start_reg;

    // start edge detect
    reg start_d;
    always @(posedge clk or negedge rstn) begin
        if (!rstn) start_d <= 0;
        else start_d <= start;
    end
    wire start_edge = (start & ~start_d);

    // main sequential
    always @(posedge clk or negedge rstn) begin
        if (!rstn) begin
            state <= S_IDLE;
            counter <= 0;
            busy <= 0;
            done_pulse <= 0;
            lcd_data <= 4'b0000;
            lcd_rs <= 0;
            lcd_en <= 0;
            latch_byte <= 8'h00;
            latch_rs <= 0;
        end else begin
            done_pulse <= 0; // default
            case (state)
                S_IDLE: begin
                    lcd_en <= 0;
                    busy <= 0;
                    counter <= 0;
                    if (start_edge) begin
                        latch_byte <= byte_in;
                        latch_rs <= rs_in;
                        busy <= 1;
                        // proceed to send high nibble
                        state <= S_SEND_HIGH;
                    end
                end

                S_SEND_HIGH: begin
                    // place high nibble on D7..D4
                    lcd_rs <= latch_rs;
                    lcd_data <= latch_byte[7:4];
                    lcd_en <= 1;
                    counter <= 0;
                    state <= S_PULSE_H;
                end

                S_PULSE_H: begin
                    if (counter < PULSE_CNT) begin
                        counter <= counter + 1;
                    end else begin
                        lcd_en <= 0;
                        counter <= 0;
                        state <= S_SEND_LOW;
                    end
                end

                S_SEND_LOW: begin
                    lcd_rs <= latch_rs;
                    lcd_data <= latch_byte[3:0];
                    lcd_en <= 1;
                    counter <= 0;
                    state <= S_PULSE_L;
                end

                S_PULSE_L: begin
                    if (counter < PULSE_CNT) begin
                        counter <= counter + 1;
                    end else begin
                        lcd_en <= 0;
                        counter <= 0;
                        // choose wait time: long for clear/home (0x01 or 0x02)
                        if (latch_byte == 8'h01 || latch_byte == 8'h02)
                            counter <= 0; // reuse counter for wait
                        state <= S_WAIT;
                    end
                end

                S_WAIT: begin
                    // determine wait cycles based on byte
                    if (latch_byte == 8'h01 || latch_byte == 8'h02) begin
                        // long wait
                        if (counter < LONG_CNT) counter <= counter + 1;
                        else begin
                            counter <= 0;
                            state <= S_DONE;
                        end
                    end else begin
                        // normal wait
                        if (counter < POST_CNT) counter <= counter + 1;
                        else begin
                            counter <= 0;
                            state <= S_DONE;
                        end
                    end
                end

                S_DONE: begin
                    busy <= 0;
                    done_pulse <= 1;
                    state <= S_IDLE;
                end

                default: state <= S_IDLE;
            endcase
        end
    end
endmodule
