// lcd1602_controller.v (complete, replacement)
// This version implements the flow:
// 1) start -> run lcd_init (forwarding init commands to driver)
// 2) after init done -> send Set DDRAM 0x80 -> write mem addr 0..15
// 3) send Set DDRAM 0xC0 -> write mem addr 16..31
// 4) done
`timescale 1ns/1ps
module lcd1602_controller #(
    parameter CLK_FREQ_HZ = 100_000_000
)(
    input  wire clk,
    input  wire rstn,
    input  wire start,   // start whole process
    // char_mem interface
    output reg  [4:0] mem_addr,
    input  wire [7:0] mem_bus,
    // LCD physical outputs
    output wire [3:0] lcd_data,
    output wire lcd_rs,
    output wire lcd_en,
    output wire lcd_rw,
    // status
    output reg done
);

    // wires to init and driver
    wire init_cmd_valid;
    wire [7:0] init_cmd;
    wire init_cmd_rs;
    wire init_done;
    reg init_start;

    wire drv_busy;
    wire drv_done;
    reg drv_start;
    reg [7:0] drv_byte;
    reg drv_rs;

    // instantiate lcd_init
    lcd_init init_u (
        .clk(clk), .rstn(rstn), .start(init_start),
        .cmd_ack(drv_done),
        .cmd_valid(init_cmd_valid),
        .cmd(init_cmd),
        .cmd_rs(init_cmd_rs),
        .done(init_done)
    );

    // instantiate driver
    lcd_driver #(.CLK_FREQ_HZ(CLK_FREQ_HZ)) drv (
        .clk(clk), .rstn(rstn),
        .start(drv_start),
        .byte_in(drv_byte),
        .rs_in(drv_rs),
        .busy(drv_busy),
        .done_pulse(drv_done),
        .lcd_data(lcd_data),
        .lcd_rs(lcd_rs),
        .lcd_en(lcd_en),
        .lcd_rw(lcd_rw)
    );

    // Controller FSM
    localparam S_IDLE    = 4'd0;
    localparam S_INIT    = 4'd1;
    localparam S_WAIT_INIT_DONE = 4'd2;
    localparam S_SET1    = 4'd3;
    localparam S_WRITE1  = 4'd4;
    localparam S_SET2    = 4'd5;
    localparam S_WRITE2  = 4'd6;
    localparam S_FINISH  = 4'd7;

    reg [3:0] state;
    reg [4:0] idx;
    reg pending; // waiting for drv_done

    always @(posedge clk or negedge rstn) begin
        if (!rstn) begin
            state <= S_IDLE;
            init_start <= 0;
            drv_start <= 0;
            drv_byte <= 8'h00;
            drv_rs <= 0;
            mem_addr <= 0;
            done <= 0;
            idx <= 0;
            pending <= 0;
        end else begin
            // default clear single-cycle pulses
            if (drv_start) drv_start <= 0;
            if (init_start) init_start <= 0;

            case (state)
                S_IDLE: begin
                    done <= 0;
                    if (start) begin
                        init_start <= 1;
                        state <= S_INIT;
                    end
                end

                S_INIT: begin
                    // forward init commands when available
                    if (init_cmd_valid && !drv_busy && !pending) begin
                        drv_byte <= init_cmd;
                        drv_rs <= init_cmd_rs;
                        drv_start <= 1;
                        pending <= 1;
                    end
                    if (pending && drv_done) begin
                        pending <= 0;
                    end
                    if (init_done && !pending && !drv_busy) begin
                        state <= S_SET1;
                    end
                end

                S_SET1: begin
                    // send Set DDRAM addr to 0x80
                    if (!drv_busy && !pending) begin
                        drv_byte <= 8'h80;
                        drv_rs <= 0;
                        drv_start <= 1;
                        pending <= 1;
                    end
                    if (pending && drv_done) begin
                        pending <= 0;
                        idx <= 0;
                        mem_addr <= 0;
                        state <= S_WRITE1;
                    end
                end

                S_WRITE1: begin
                    if (!drv_busy && !pending) begin
                        // prepare byte from mem_bus
                        drv_byte <= mem_bus;
                        drv_rs <= 1;
                        drv_start <= 1;
                        pending <= 1;
                    end
                    if (pending && drv_done) begin
                        pending <= 0;
                        if (idx == 5'd15) begin
                            state <= S_SET2;
                        end else begin
                            idx <= idx + 1;
                            mem_addr <= mem_addr + 1;
                        end
                    end
                end

                S_SET2: begin
                    if (!drv_busy && !pending) begin
                        drv_byte <= 8'hC0; // DDRAM line2
                        drv_rs <= 0;
                        drv_start <= 1;
                        pending <= 1;
                    end
                    if (pending && drv_done) begin
                        pending <= 0;
                        idx <= 0;
                        mem_addr <= 16; // start of line2 in char_mem
                        state <= S_WRITE2;
                    end
                end

                S_WRITE2: begin
                    if (!drv_busy && !pending) begin
                        drv_byte <= mem_bus;
                        drv_rs <= 1;
                        drv_start <= 1;
                        pending <= 1;
                    end
                    if (pending && drv_done) begin
                        pending <= 0;
                        if (idx == 5'd15) begin
                            state <= S_FINISH;
                        end else begin
                            idx <= idx + 1;
                            mem_addr <= mem_addr + 1;
                        end
                    end
                end

                S_FINISH: begin
                    done <= 1;
                    state <= S_FINISH; // hold done
                end

                default: state <= S_IDLE;
            endcase
        end
    end
endmodule
