Synchronous HDLC framing involves decoding a continuous bit stream of data to look for bit patterns that indicate the beginning and end of frames (packets). Seeing exactly 6 consecutive 1s (i.e., 01111110)
is a "flag" that indicate frame boundaries. To avoid the data stream from accidentally containing "flags", the sender inserts a zero after every 5 consecutive 1s which the receiver must detect and discard.
We also need to signal an error if there are 7 or more consecutive 1s.

Create a finite state machine to recognize these three sequences:

0111110: Signal a bit needs to be discarded (disc).
01111110: Flag the beginning/end of a frame (flag).
01111111...: Error (7 or more 1s) (err).
When the FSM is reset, it should be in a state that behaves as though the previous input were 0.

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

module top_module(
    input clk,
    input reset,    // Synchronous reset
    input in,
    output disc,
    output flag,
    output err);
    
    localparam [3:0] NONE = 0,
					 ONE  = 1,
					 TWO  = 2,
					 THREE= 3,
					 FOUR = 4,
					 FIVE = 5,
					 SIX  = 6,
					 DISC = 7,
					 FLAG = 8,
					 ERR  = 9;

	reg [3:0] state, next;

	always @(*) begin
		case (state)
			NONE : next = (in) ? ONE   : NONE;
			ONE	 : next = (in) ? TWO   : NONE;
			TWO	 : next = (in) ? THREE : NONE;
			THREE: next = (in) ? FOUR  : NONE;
			FOUR : next = (in) ? FIVE  : NONE;
			FIVE : next = (in) ? SIX   : DISC;
			SIX	 : next = (in) ? ERR   : FLAG;
			DISC : next = (in) ? ONE   : NONE;
			FLAG : next = (in) ? ONE   : NONE;
			ERR  : next = (in) ? ERR   : NONE;
		endcase
	end 

	always @(posedge clk) begin
		if (reset)
			state <= NONE;
		else 
			state <= next;
	end

	assign disc = (state == DISC);
	assign flag = (state == FLAG);
	assign err = (state == ERR);
  

endmodule
