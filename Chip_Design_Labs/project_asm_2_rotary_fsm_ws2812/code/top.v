module top #(
    parameter NUM_LEDS = 16
)(
    input  wire clk,         // 125 MHz
    input  wire rst,
    input  wire A,
    input  wire B,
    input  wire btn,         // ACTIVE-LOW!
    output wire ws2812_din
);

    // ----------------------------------------------------------
    // Rotary + Button (ACTIVE-LOW)
    // ----------------------------------------------------------
    wire pulse_up, pulse_down;

    rotary_decoder u_rotary (
        .clk(clk),
        .rst(rst),
        .A(A),
        .B(B),
        .pulse_up(pulse_up),
        .pulse_down(pulse_down)
    );

    wire btn_short;
    wire btn_hold;

    button_manager u_btn (
        .clk(clk),
        .rst(rst),
        .btn_raw(~btn),       // <<< FIX ACTIVE-LOW
        .btn_short(btn_short),
        .btn_hold(btn_hold)
    );

    // Hold edge detector (btn_hold is LEVEL)
    reg btn_hold_d;
    always @(posedge clk or posedge rst) begin
        if (rst) btn_hold_d <= 0;
        else btn_hold_d <= btn_hold;
    end

    wire btn_hold_pulse = btn_hold & ~btn_hold_d;

    // ----------------------------------------------------------
    // FSM for mode/color/speed (safer wrap logic)
    // ----------------------------------------------------------
    reg [1:0] menu_state;
    reg [1:0] mode;
    reg [1:0] color;
    reg [1:0] speed;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            menu_state <= 0;
            mode       <= 0;
            color      <= 0;
            speed      <= 0;
        end else begin

            if (btn_hold_pulse)
                menu_state <= (menu_state == 2) ? 0 : menu_state + 1;

            if (pulse_up)
                case(menu_state)
                    0: mode  <= mode + 1;
                    1: color <= color + 1;
                    2: speed <= speed + 1;
                endcase

            if (pulse_down)
                case(menu_state)
                    0: mode  <= mode - 1;
                    1: color <= color - 1;
                    2: speed <= speed - 1;
                endcase

        end
    end

    // ----------------------------------------------------------
    // LED Effect Generator (frame-based)
    // ----------------------------------------------------------
    wire [NUM_LEDS*24-1:0] led_data;
    
    led_controller #(
        .NUM_LEDS(NUM_LEDS)
    ) u_ledctrl (
        .clk(clk),
        .rst(rst),
        .mode(mode),
        .color(color),
        .speed(speed),
        .led_data(led_data),
        .ws2812_din(ws2812_din)
    );

endmodule
