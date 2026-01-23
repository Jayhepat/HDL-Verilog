Build a 64-bit arithmetic shift register, with synchronous load. The shifter can shift both left and right, and by 1 or 8 bit positions, selected by amount.

An arithmetic right shift shifts in the sign bit of the number in the shift register (q[63] in this case) instead of zero as done by a logical right shift. Another way of thinking about an arithmetic right shift is that it assumes the number being shifted is signed and preserves the sign, so that arithmetic right shift divides a signed number by a power of two.

There is no difference between logical and arithmetic left shifts.

load: Loads shift register with data[63:0] instead of shifting.
ena: Chooses whether to shift.
amount: Chooses which direction and how much to shift.
- 2'b00: shift left by 1 bit.
- 2'b01: shift left by 8 bits.
- 2'b10: shift right by 1 bit.
- 2'b11: shift right by 8 bits.
q: The contents of the shifter.

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

module top_module(
    input clk,
    input load,
    input ena,
    input [1:0] amount,
    input [63:0] data,
    output reg [63:0] q); 
    
    always @(posedge clk) begin
		if(load) q <= data;
		else begin
			if(ena) begin
				if(amount == 2'b00) 
            q <= (q << 1);
				else if(amount == 2'b01) 
            q <= (q << 8);
				else if(amount == 2'b10) begin
					  if(q[63] == 0) 
                q <= (q >> 1);
					  else begin
						    q <= (q >> 1);
						    q[63] <= 1'b1;
					  end
				end
				else begin
				  	if(q[63] == 0) 
                q <= (q >> 8);
					  else begin
						    q <= (q >> 8);
						    q[63:56] <= {8{1'b1}};
					  end
				end
			end
		end
	end

endmodule
