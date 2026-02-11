This three-input NAND gate doesn't work. Fix the bug(s).

You must use the provided 5-input AND gate:

module andgate ( output out, input a, input b, input c, input d, input e );

ERROR CODE:

  module top_module (input a, input b, input c, output out);//

    andgate inst1 ( a, b, c, out );

endmodule



-------CORRECTED CODE--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

module top_module (input a, input b, input c, output out);//

    wire out_t;
    assign out = ~out_t;
    andgate inst1 (out_t , a, b, c , 1 , 1);

endmodule
