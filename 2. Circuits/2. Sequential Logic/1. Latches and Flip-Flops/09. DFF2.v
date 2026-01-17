Implement the following circuit:

CKT: https://hdlbits.01xz.net/mw/images/6/6d/Exams_m2014q4c.png
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

module top_module (
    input clk,
    input d, 
    input r,   // synchronous reset
    output q);
    
     always@(posedge clk)begin
        if(r)
            q <= 0;
        else
            q <= d;
    end

endmodule
