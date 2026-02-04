Given the state-assigned table shown below, implement the finite-state machine. Reset should reset the FSM to state 000.

  Present state    Next state Y[2:0]	 Output z
     y[2:0]	         x=0    	x=1
      000            000    	001      	0
      001	           001	    100     	0
      010	           010	    001	      0
      011	           001	    010	      1
      100	           011	    100	      1
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

module top_module (
    input clk,
    input reset,   // Synchronous reset
    input x,
    output z
);
     parameter a = 0, b = 1, c = 2, d = 3, e = 4;
    reg [2:0] state, next_state;

    always @(*) begin
        case (state)
            a: next_state = x ? b : a;
            b: next_state = x ? e : b;
            c: next_state = x ? b : c;
            d: next_state = x ? c : b;
            e: next_state = x ? e : d;
        endcase
    end

    always @(posedge clk) begin
        if (reset) begin
            state <= a;
        end
        else begin
            state <= next_state;
        end
    end

    assign z = (state == d || state == e);

endmodule
