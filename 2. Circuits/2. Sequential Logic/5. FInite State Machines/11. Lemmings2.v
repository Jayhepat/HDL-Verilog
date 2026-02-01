In addition to walking left and right, Lemmings will fall (and presumably go "aaah!") if the ground disappears underneath them.

In addition to walking left and right and changing direction when bumped, when ground=0, the Lemming will fall and say "aaah!". When the ground reappears (ground=1), 
the Lemming will resume walking in the same direction as before the fall. Being bumped while falling does not affect the walking direction, and being bumped in the same cycle as ground disappears (but not yet falling), or when the ground reappears while still falling, also does not affect the walking direction.

Build a finite state machine that models this behaviour.

  LEMMING : https://hdlbits.01xz.net/mw/images/7/70/Lemmings2.gif
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    input ground,
    output walk_left,
    output walk_right,
    output aaah ); 
    
    localparam [1:0] WALK_L = 2'b00,
					 WALK_R = 2'b01,
					 FALL_L = 2'b10,
 					 FALL_R = 2'b11;

 	reg [1:0] state, next;

 	always @(posedge clk or posedge areset) begin
 		if(areset) state <= WALK_L;
 		else begin
 			state <= next;
 		end
 	end

 	always @(*) begin
 		case(state)
 			WALK_L : next = (ground == 0) ? FALL_L : ((bump_left == 1) ? WALK_R : WALK_L);
 			WALK_R : next = (ground == 0) ? FALL_R : ((bump_right == 1) ? WALK_L : WALK_R);
 			FALL_L : next = (ground == 1) ? WALK_L : FALL_L;
 			FALL_R : next = (ground == 1) ? WALK_R : FALL_R;
 		endcase
 	end

 	assign walk_left = (state == WALK_L);
 	assign walk_right = (state == WALK_R);
 	assign aaah = ((state == FALL_L) || (state == FALL_R));

endmodule
