This is the third component in a series of five exercises that builds a complex counter out of several smaller circuits. See the final exercise for the overall design.

As part of the FSM for controlling the shift register, we want the ability to enable the shift register for exactly 4 clock cycles whenever the proper bit pattern is detected.
We handle sequence detection in Exams/review2015_fsmseq, so this portion of the FSM only handles enabling the shift register for 4 cycles.

Whenever the FSM is reset, assert shift_ena for 4 cycles, then 0 forever (until reset).

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

module top_module (
    input clk,
    input reset,      // Synchronous reset
    output shift_ena);
    
    parameter S0=3'd0, S1=3'd1, S2=3'd2, S3=3'd3, S4=3'd4;
    reg [2:0]   state, next_state;
    
    always@(*) begin
        case(state)
            S0:     next_state = reset ? S1 : S0;
            S1:     next_state = S2;
            S2:     next_state = S3;
            S3:     next_state = S4;
            S4:     next_state = S0;
        endcase
    end
    
    always@(posedge clk) begin
       state <= next_state; 
    end
    
    assign shift_ena = (state==S1 | state==S2 | state==S3 | state==S4);

endmodule
