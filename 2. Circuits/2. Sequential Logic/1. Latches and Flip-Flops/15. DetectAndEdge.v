For each bit in an 8-bit vector, detect when the input signal changes from 0 in one clock cycle to 1 the next (similar to positive edge detection). The output bit should be set the cycle after a 0 to 1 transition occurs.

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
module top_module (
    input clk,
    input [7:0] in,
    output [7:0] pedge
);
    
    reg [7:0] d_last;
    
    always @(posedge clk) begin
        d_last <= in;                 // Remember the state of the previous cycle
        pedge <= in & ~d_last;        // A psitive edge occured if input was 0 ans is now 1.
    end

endmodule
