Create 8 D flip-flops with active high asynchronous reset. All DFFs should be triggered by the positive edge of clk.

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

module top_module (
    input clk,
    input areset,   // active high asynchronous reset
    input [7:0] d,
    output [7:0] q
);
    //The only difference in code compared to synchronous reset is in the sinsitivity list.
    always @(posedge clk, posedge areset) begin
        if(areset)
            q <= 0;
        else 
            q <= d;
    end

endmodule
