module rotary_fsm (
    input clk,
    input rst,
    input A,
    input B,
    output reg dir,          // 1 = CW, 0 = CCW
    output reg [3:0] count   // step counter
    );

    // Mã hóa state
    typedef enum reg [1:0] {
        S0 = 2'b00,
        S1 = 2'b01,
        S2 = 2'b11,
        S3 = 2'b10
    } state_t;

    state_t current_state, next_state;

    // FSM: State transition
    always @(posedge clk or posedge rst) begin
        if (rst)
            current_state <= S0;
        else
            current_state <= next_state;
    end

    // FSM: Next state logic
    always @(*) begin
        next_state = current_state;
        case (current_state)
            S0: begin
                if ({A,B} == 2'b10) next_state = S3; // CW
                else if ({A,B} == 2'b01) next_state = S1; // CCW
            end
            S1: begin
                if ({A,B} == 2'b00) next_state = S0;
                else if ({A,B} == 2'b11) next_state = S2;
            end
            S2: begin
                if ({A,B} == 2'b01) next_state = S1;
                else if ({A,B} == 2'b10) next_state = S3;
            end
            S3: begin
                if ({A,B} == 2'b00) next_state = S0;
                else if ({A,B} == 2'b11) next_state = S2;
            end
        endcase
    end

    // Output logic
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            dir <= 0;
            count <= 0;
        end else begin
            case ({current_state, next_state})
                {S0, S3}, {S3, S2}, {S2, S1}, {S1, S0}: begin
                    dir <= 1;        // CW
                    count <= count + 1;
                end
                {S0, S1}, {S1, S2}, {S2, S3}, {S3, S0}: begin
                    dir <= 0;        // CCW
                    count <= count - 1;
                end
                default: ; // giữ nguyên
            endcase
        end
    end

endmodule
