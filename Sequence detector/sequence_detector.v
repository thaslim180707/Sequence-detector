//====================================================
// Sequence Detector (Detects 1011 - Overlapping)
// Moore FSM
//====================================================

module sequence_detector(
    input clk,
    input reset,
    input x,
    output reg y
);

parameter S0 = 3'b000,
          S1 = 3'b001,
          S2 = 3'b010,
          S3 = 3'b011,
          S4 = 3'b100;

reg [2:0] state, next_state;

// State Register
always @(posedge clk or posedge reset)
begin
    if(reset)
        state <= S0;
    else
        state <= next_state;
end

// Next State Logic
always @(*)
begin
    case(state)

        S0:
            if(x) next_state = S1;
            else  next_state = S0;

        S1:
            if(x) next_state = S1;
            else  next_state = S2;

        S2:
            if(x) next_state = S3;
            else  next_state = S0;

        S3:
            if(x) next_state = S4;
            else  next_state = S2;

        S4:
            if(x) next_state = S1;
            else  next_state = S2;

        default:
            next_state = S0;

    endcase
end

// Output Logic
always @(*)
begin
    if(state == S4)
        y = 1;
    else
        y = 0;
end

endmodule