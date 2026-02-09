This is the second component in a series of five exercises that builds a complex counter out of several smaller circuits. See the final exercise for the overall design.

Build a finite-state machine that searches for the sequence 1101 in an input bit stream. When the sequence is found, it should set start_shifting to 1, forever, until reset. 
Getting stuck in the final state is intended to model going to other states in a bigger FSM that is not yet implemented. We will be extending this FSM in the next few exercises.

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


module top_module (
    input clk,
    input reset,      // Synchronous reset
    input data,
    output start_shifting);

    localparam [2:0] IDLE = 0,
					 S1   = 1,
					 S11  = 2,
					 S110 = 3,
					 S1101= 4;

	reg [2:0] state, next;

	always @(*) begin
		case (state)
			IDLE  : next = (data) ? S1   : IDLE;
			S1    : next = (data) ? S11  : IDLE;
			S11   : next = (data) ? S11  : S110;
			S110  : next = (data) ? S1101: IDLE;
			S1101 : next = S1101;
		endcase
	end

	always @(posedge clk) begin
		if (reset) begin
			state <= IDLE;
		end
		else state <= next;
	end

	assign start_shifting = (state == S1101);
endmodule
