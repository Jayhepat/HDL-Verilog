You're familiar with flip-flops that are triggered on the positive edge of the clock, or negative edge of the clock. 
A dual-edge triggered flip-flop is triggered on both edges of the clock. However, FPGAs don't have dual-edge triggered flip-flops, 
and always @(posedge clk or negedge clk) is not accepted as a legal sensitivity list.

Build a circuit that functionally behaves like a dual-edge triggered flip-flop
  TIMING DIAGRAM: 

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

module top_module (
    input clk,
    input d,
    output q
);
    
    reg [1:0] r;
    
  always @(posedge clk) begin
      r[0] <= d;
  end
    
  always @(negedge clk) begin
      r[1] <= d; 
  end
    
  assign q = (clk) ? r[0] : r[1];
    
endmodule
