A D flip-flop is a circuit that stores a bit and is updated periodically, at the (usually) positive edge of a clock signal.

d-flip-flop: https://hdlbits.01xz.net/mw/images/6/6c/Dff.png

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

module top_module (
    input clk,    // Clocks are used in sequential circuits
    input d,
    output reg q );
    
    always @(posedge clk) begin  //Use non-blocking assignment for edge-triggered always blocks
        q <= d;
    end

endmodule
