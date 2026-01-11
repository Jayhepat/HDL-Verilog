K-Map :-  https://hdlbits.01xz.net/mw/images/4/4d/Kmap2.png

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

module top_module(
    input a,
    input b,
    input c,
    input d,
    output out  ); 
    
    assign out = (~b & ~c) | (~a & ~d) | (~a & b & c) | (a & c & d);
                /*
                (~b & ~c) :- b=0 and c=0 output is 1.
                (~a & ~d) :- a=0 and d=0 output is 1.
                (~a & b & c) :- a=0 , b=1, c=1 regardless of d, output is 1.
                (a & c & d) :- a=1, c=1, d=1 regardless of b, output is 1. */

endmodule
