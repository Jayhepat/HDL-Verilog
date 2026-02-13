This is a combinational circuit. Read the simulation waveforms to determine what the circuit does, then implement it.

ERROR CODE:
module top_module (
    input a,
    input b,
    input c,
    input d,
    output q );//

    assign q = 0; // Fix me

endmodule

-------CORRECT CODE-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


module top_module (
    input a,
    input b,
    input c,
    input d,
    output q );//

    assign q = (b & d) | (b & c) | (a & d) | (a & c); // Fix me

endmodule
