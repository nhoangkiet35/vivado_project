`timescale 1ns / 1ps


module seg7_control(
    input clk_100MHz,
    input reset,
    input [3:0] ones,
    input [3:0] tens,
    input [3:0] hundreds,
    input [3:0] thousands,
    output reg [6:0] sseg,      // segment pattern 0-9
    output reg [3:0] digit      // digit select signals
    );
    
    // Internal signals
    reg [6:0] ssegt;
    reg [3:0] digitt;
        
    // Parameters for segment patterns
    parameter ZERO  = 7'b1000000;  // 0
    parameter ONE   = 7'b1111001;  // 1
    parameter TWO   = 7'b0100100;  // 2 
    parameter THREE = 7'b0110000;  // 3
    parameter FOUR  = 7'b0011001;  // 4
    parameter FIVE  = 7'b0010010;  // 5
    parameter SIX   = 7'b0000010;  // 6
    parameter SEVEN = 7'b1111000;  // 7
    parameter EIGHT = 7'b0000000;  // 8
    parameter NINE  = 7'b0010000;  // 9
    
    
    // To select each digit in turn
    reg [1:0] digit_select;     // 2 bit counter for selecting each of 4 digits
    reg [16:0] counter;     // counter for digit refresh
    
    always @(*) begin
        sseg = ssegt;
        digit = ~digitt;    // active-low
    end


    
    // Logic for controlling digit select and digit timer
    always @(posedge clk_100MHz or negedge reset) begin
        if(~reset) begin
            digit_select <= 0;
            counter <= 0; 
        end
        else                                        // 1ms x 4 displays = 4ms refresh period
            if(counter == 100_000 - 1) begin        // f = 1000Hz => T = 1ms
                counter <= 0;                       // Every 1ms increases by 1
                digit_select <=  digit_select + 1;
            end
            else
                counter <=  counter + 1;
    end
    
    // Logic for driving the 4 bit anode output based on digit select
    always @(digit_select) begin
        case(digit_select) 
            2'b00 : digitt = 4'b0001;   // Turn on ones digit
            2'b01 : digitt = 4'b0010;   // Turn on tens digit
            2'b10 : digitt = 4'b0100;   // Turn on hundreds digit
            2'b11 : digitt = 4'b1000;   // Turn on thousands digit
        endcase
    end
    
    // Logic for driving segments based on which digit is selected and the value of each digit
    always @*
        case(digit_select)
            2'b00 : begin       // ONES DIGIT
                        case(ones)
                            4'b0000 : ssegt = ZERO;
                            4'b0001 : ssegt = ONE;
                            4'b0010 : ssegt = TWO;
                            4'b0011 : ssegt = THREE;
                            4'b0100 : ssegt = FOUR;
                            4'b0101 : ssegt = FIVE;
                            4'b0110 : ssegt = SIX;
                            4'b0111 : ssegt = SEVEN;
                            4'b1000 : ssegt = EIGHT;
                            4'b1001 : ssegt = NINE;
                        endcase
                    end
                    
            2'b01 : begin       // TENS DIGIT
                        case(tens)
                            4'b0000 : ssegt = ZERO;
                            4'b0001 : ssegt = ONE;
                            4'b0010 : ssegt = TWO;
                            4'b0011 : ssegt = THREE;
                            4'b0100 : ssegt = FOUR;
                            4'b0101 : ssegt = FIVE;
                            4'b0110 : ssegt = SIX;
                            4'b0111 : ssegt = SEVEN;
                            4'b1000 : ssegt = EIGHT;
                            4'b1001 : ssegt = NINE;
                        endcase
                    end
                    
            2'b10 : begin       // HUNDREDS DIGIT
                        case(hundreds)
                            4'b0000 : ssegt = ZERO;
                            4'b0001 : ssegt = ONE;
                            4'b0010 : ssegt = TWO;
                            4'b0011 : ssegt = THREE;
                            4'b0100 : ssegt = FOUR;
                            4'b0101 : ssegt = FIVE;
                            4'b0110 : ssegt = SIX;
                            4'b0111 : ssegt = SEVEN;
                            4'b1000 : ssegt = EIGHT;
                            4'b1001 : ssegt = NINE;
                        endcase
                    end
                    
            2'b11 : begin       // MINUTES ONES DIGIT
                        case(thousands)
                            4'b0000 : ssegt = ZERO;
                            4'b0001 : ssegt = ONE;
                            4'b0010 : ssegt = TWO;
                            4'b0011 : ssegt = THREE;
                            4'b0100 : ssegt = FOUR;
                            4'b0101 : ssegt = FIVE;
                            4'b0110 : ssegt = SIX;
                            4'b0111 : ssegt = SEVEN;
                            4'b1000 : ssegt = EIGHT;
                            4'b1001 : ssegt = NINE;
                        endcase
                    end
        endcase
endmodule