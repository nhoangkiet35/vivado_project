// lcd_init.v
// Produces a sequence of init commands for HD44780 4-bit init.
// Consumer should connect to lcd_driver: feed cmd & cmd_valid and wait for cmd_ack (done_pulse).
`timescale 1ns/1ps
module lcd_init (
    input  wire clk,
    input  wire rstn,
    input  wire start,        // start initialization (pulse or high)
    input  wire cmd_ack,      // connect to lcd_driver.done_pulse
    output reg  cmd_valid,    // pulses when cmd is available
    output reg  [7:0] cmd,    // command byte
    output reg  cmd_rs,       // RS for this command (0 for all init steps)
    output reg  done          // high when init sequence finished
);
    // sequence table
    localparam S_IDLE  = 0;
    localparam S_SEND  = 1;
    localparam S_WAIT  = 2;
    localparam S_DONE  = 3;

    reg [2:0] state;
    reg [5:0] step;

    // We'll use the common init sequence (simplified and safe):
    // Steps:
    // 1) wait power-up (consumer should ensure some delay before calling start)
    // 2) function set (0x30) - typically repeated, but in 4-bit we send 0x33 then 0x32 sequence sometimes.
    // We'll use sequence:
    // 0x33, 0x32, 0x28, 0x0C, 0x06, 0x01
    localparam NUM_STEPS = 6;
    reg [7:0] seq [0:NUM_STEPS-1];
    initial begin
        seq[0] = 8'h33; // initialize
        seq[1] = 8'h32; // set 4-bit
        seq[2] = 8'h28; // function set: 4-bit, 2-line, 5x8
        seq[3] = 8'h0C; // display ON, cursor off
        seq[4] = 8'h06; // entry mode set: inc + no shift
        seq[5] = 8'h01; // clear display
    end

    always @(posedge clk or negedge rstn) begin
        if (!rstn) begin
            state <= S_IDLE;
            step <= 0;
            cmd_valid <= 0;
            cmd <= 8'h00;
            cmd_rs <= 0;
            done <= 0;
        end else begin
            case (state)
                S_IDLE: begin
                    cmd_valid <= 0;
                    done <= 0;
                    if (start) begin
                        step <= 0;
                        state <= S_SEND;
                    end
                end
                S_SEND: begin
                    cmd <= seq[step];
                    cmd_rs <= 0;
                    cmd_valid <= 1;
                    // wait for driver ack
                    state <= S_WAIT;
                end
                S_WAIT: begin
                    if (cmd_ack) begin
                        cmd_valid <= 0;
                        if (step == NUM_STEPS-1) begin
                            done <= 1;
                            state <= S_DONE;
                        end else begin
                            step <= step + 1;
                            state <= S_SEND;
                        end
                    end
                end
                S_DONE: begin
                    // remain done until reset or new start pulse
                    // allow re-start: if start goes low then high again, user can re-init
                    if (!start) begin
                        done <= 0;
                        state <= S_IDLE;
                    end
                end
            endcase
        end
    end
endmodule
