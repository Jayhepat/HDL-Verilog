Consider the state machine shown below, which has one input w and one output z.

State Diagram: https://hdlbits.01xz.net/mw/images/e/e1/Exams_m2014q6.png

Assume that you wish to implement the FSM using three flip-flops and state codes y[3:1] = 000, 001, ... , 101 for states A, B, ... , F, respectively. Show a state-assigned table for this FSM. 
Derive a next-state expression for the flip-flop y[2].

Implement just the next-state logic for y[2]. (This is much more a FSM question than a Verilog coding question. Oh well.)

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

module top_module (
    input [3:1] y,
    input w,
    output Y2);
    
    reg [3:1] Y;
    
    always @(*) begin
        case({y, w})
            4'b0000: Y = 3'b001;
            4'b0001: Y = 3'b000;
            4'b0010: Y = 3'b010;
            4'b0011: Y = 3'b011;
            4'b0100: Y = 3'b100;
            4'b0101: Y = 3'b011;
            4'b0110: Y = 3'b101;
            4'b0111: Y = 3'b000;
            4'b1000: Y = 3'b100;
            4'b1001: Y = 3'b011;
            4'b1010: Y = 3'b010;
            4'b1011: Y = 3'b011;
        endcase
    end
    
    assign Y2 = Y[2];

endmodule
