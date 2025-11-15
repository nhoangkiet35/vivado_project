module ws2812_control #(
    parameter NUM_LED = 8
)(
    input  wire clk,        // 50MHz
    input  wire rst_n,
    output reg              start,
    output reg [23:0]       rgb_data [0:NUM_LED-1]
);
    reg [7:0] red   [0:NUM_LED-1];
    reg [7:0] green [0:NUM_LED-1];
    reg [7:0] blue  [0:NUM_LED-1];

    reg [31:0] counter;
    integer i;

    // Bộ tạo hiệu ứng rainbow
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            counter <= 0;
            start <= 0;
            for (i = 0; i < NUM_LED; i = i + 1) begin
                red[i]   <= 0;
                green[i] <= 0;
                blue[i]  <= 0;
            end
        end else begin
            counter <= counter + 1;

            if (counter == 2_500_000) begin // Khoảng 50ms
                counter <= 0;
                for (i = 0; i < NUM_LED; i = i + 1) begin
                    red[i]   <= rainbow_red(i + counter[23:20]);
                    green[i] <= rainbow_green(i + counter[23:20]);
                    blue[i]  <= rainbow_blue(i + counter[23:20]);
                    rgb_data[i] <= {green[i], red[i], blue[i]}; // GRB
                end
                start <= 1;
            end else begin
                start <= 0;
            end
        end
    end

    // ==== Rainbow Functions ====
    function [7:0] rainbow_red;
        input [7:0] pos;
        case (pos % 6)
            0: rainbow_red = 255;
            1: rainbow_red = 255 - (pos % 256);
            2: rainbow_red = 0;
            3: rainbow_red = 0;
            4: rainbow_red = (pos % 256);
            5: rainbow_red = 255;
            default: rainbow_red = 0;
        endcase
    endfunction

    function [7:0] rainbow_green;
        input [7:0] pos;
        case (pos % 6)
            0: rainbow_green = (pos % 256);
            1: rainbow_green = 255;
            2: rainbow_green = 255;
            3: rainbow_green = 255 - (pos % 256);
            4: rainbow_green = 0;
            5: rainbow_green = 0;
            default: rainbow_green = 0;
        endcase
    endfunction

    function [7:0] rainbow_blue;
        input [7:0] pos;
        case (pos % 6)
            0: rainbow_blue = 0;
            1: rainbow_blue = 0;
            2: rainbow_blue = (pos % 256);
            3: rainbow_blue = 255;
            4: rainbow_blue = 255;
            5: rainbow_blue = 255 - (pos % 256);
            default: rainbow_blue = 0;
        endcase
    endfunction

endmodule
