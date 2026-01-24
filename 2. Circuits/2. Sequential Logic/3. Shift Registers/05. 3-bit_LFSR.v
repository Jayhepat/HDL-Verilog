Write the Verilog code for this sequential circuit (Submodules are ok, but the top-level must be named top_module). 
Assume that you are going to implement the circuit on the DE1-SoC board. Connect the R inputs to the SW switches, connect Clock to KEY[0], and L to KEY[1]. Connect the Q outputs to the red lights LEDR.

CKT:  https://hdlbits.01xz.net/mw/images/e/e5/Mt2015_muxdff.png
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

module top_module (
	input [2:0] SW,      // R
	input [1:0] KEY,     // L and clk
	output [2:0] LEDR);  // Q

      wire L;
  wire clk;
  wire [2:0] R;
  reg [2:0] Q;
  
  assign R = SW;
  assign clk = KEY[0];
  assign L = KEY[1];
        
  always @(posedge clk) begin
      if(L)
          Q <= R;
      else
          Q <= {Q[2]^Q[1], Q[0], Q[2]};
  end
    
  assign LEDR = Q;

endmodule
