Consider the sequential circuit below:
CKT:  https://hdlbits.01xz.net/mw/images/e/e5/Mt2015_muxdff.png

Assume that you want to implement hierarchical Verilog code for this circuit, using three instantiations of a submodule that has a flip-flop and multiplexer in it. 
  Write a Verilog module (containing one flip-flop and multiplexer) named top_module for this submodule.
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


module top_module (
	input clk,
	input L,
	input r_in,
	input q_in,
	output reg Q);

     always @(posedge clk) begin
     if(L)
        Q <= r_in;
     else
        Q <= q_in;
  end
    
endmodule
