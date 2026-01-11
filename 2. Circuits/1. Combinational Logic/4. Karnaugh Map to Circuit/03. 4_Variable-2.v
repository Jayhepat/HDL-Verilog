K-Map :-  https://hdlbits.01xz.net/mw/images/1/1f/Kmap3.png

:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::


module top_module(
    input a,
    input b,
    input c,
    input d,
    output out  ); 
    
    assign out = (a & ~d) | (a & d) | (~b & c);
    //assign out = a | (c & ~b);

endmodule
