This is a sequential circuit. Read the simulation waveforms to determine what the circuit does, then implement it.

----CORRECT CODE------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

module top_module (
    input clk,
    input a,
    output q );
    
    always @(posedge clk) begin
        q <= ~a;
    end

endmodule
