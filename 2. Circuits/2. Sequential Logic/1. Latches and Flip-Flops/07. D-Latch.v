Implement the follwoing circuit
CKT: https://hdlbits.01xz.net/mw/images/0/03/Exams_m2014q4a.png

Note that this is a latch, so a Quartus warning about having inferred a latch is expected.

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

module top_module (
    input d, 
    input ena,
    output q);
    
    always@(*)begin
    if(ena)
      q <= d;
  end

endmodule
