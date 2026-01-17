Implement the following circuit:

CKT: https://hdlbits.01xz.net/mw/images/f/f2/Exams_m2014q4d.png

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

module top_module (
    input clk,
    input in, 
    output out);
    
     always@(posedge clk)begin
        out <= out ^ in;
    end

endmodule
