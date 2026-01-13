Consider the function f shown in the Karnaugh map below.
K_MAP -  https://hdlbits.01xz.net/mw/images/a/a2/Exams_m2014q3.png

Implement this function. d is don't-care, which means you may choose to output whatever value is convenient.

:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

module top_module (
    input [4:1] x, 
    output f );

    assign f = (x[3] & ~x[1]) | (~x[3] & x[2] & x[1]);
    
endmodule
