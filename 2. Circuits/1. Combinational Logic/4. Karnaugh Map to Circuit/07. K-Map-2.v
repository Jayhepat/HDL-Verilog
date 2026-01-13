Consider the function f shown in the Karnaugh map below. Implement this function.
  K-Map :- https://hdlbits.01xz.net/mw/images/e/e3/Exams_2012q1g.png


:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

module top_module (
    input [4:1] x,
    output f
); 
    
    assign f = (x[3] & ~x[1]) | (x[2] & x[3] & x[4]) | (~x[2] & ~x[4]);

endmodule
