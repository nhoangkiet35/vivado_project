module debounce (
    input wire clk,      // Clock input
    input wire rst_p,    // Active-high Reset input
    input wire btn_in,   // Noisy button input
    output reg btn_out   // Debounced button output
);

    reg [20:0] counter;  // Counter for debounce time
    reg button_state;    // Internal button state

    always @(posedge clk or posedge rst_p) begin
        if (rst_p) begin
            counter <= 0;
            button_state <= 0;
            btn_out  <= 0;
        end else begin
            if (btn_in == button_state) begin
                if (counter < 20'd2_000_000) // Adjust for desired debounce time
                    counter <= counter + 1;
                else
                    btn_out <= button_state;
				end 
			else begin
                counter <= 0;
                button_state <= btn_in;
            end
        end
    end

endmodule