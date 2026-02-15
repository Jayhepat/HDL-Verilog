This is a sequential circuit. Read the simulation waveforms to determine what the circuit does, then implement it.


----CORRECT CODE------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

module top_module (
    input clock,
    input a,
    output p,
    output q );

    always @(*) begin
        if(clock) p = a;    
    end
    
    always @(negedge clock) begin
        q <= p;
    end
endmodule
