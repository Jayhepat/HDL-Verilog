For each bit in a 32-bit vector, capture when the input signal changes from 1 in one clock cycle to 0 the next. "Capture" means that the output will remain 1 until the register is reset (synchronous reset).

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

module top_module (
    input clk,
    input reset,
    input [31:0] in,
    output [31:0] out
);

     
  reg [31:0] in_last;	
  
  always @(posedge clk) begin
      in_last <= in;
      if(reset) 
        out <= 0;
      else begin
        out <= out | (in_last & ~in);
      end
  end
    
endmodule
