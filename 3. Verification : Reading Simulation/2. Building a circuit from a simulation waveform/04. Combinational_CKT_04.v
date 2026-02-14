This is a combinational circuit. Read the simulation waveforms to determine what the circuit does, then implement it.

------CORRECT CODE------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

module top_module (
    input a,
    input b,
    input c,
    input d,
    output q );//

  assign q = 0; // FIX THESE
    assign q = b | c; 

endmodule
