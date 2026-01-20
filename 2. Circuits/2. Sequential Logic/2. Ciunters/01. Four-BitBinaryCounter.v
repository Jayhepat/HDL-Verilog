Build a 4-bit binary counter that counts from 0 through 15, inclusive, with a period of 16. The reset input is synchronous, and should reset the counter to 0.

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

module top_module (
    input clk,
    input reset,      // Synchronous active-high reset
    output [3:0] q);
    
     always@(posedge clk)begin
      if(reset)
          q <= 0;
      else
          q <= q + 1; // Because q is 4 bits it rolls over form 15 -> 0
         // If you want a counter that countes from range o+0 to (2^n)-1.
         // Then you need to add another rule to reet q to - when roll over should occur.
  end

endmodule
