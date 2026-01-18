Consider the n-bit shift register circuit shown below:
CKT: https://hdlbits.01xz.net/mw/images/1/1e/Exams_2014q4.png
Write a Verilog module named top_module for one stage of this circuit, including both the flip-flop and multiplexers.

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

module top_module (
    input clk,
    input w, R, E, L,
    output Q
);
    
     always @(posedge clk) begin 
        if(L) Q <= R;
        else begin
            if(E) Q <= w;
            else Q <= Q;
        end
    end

endmodule


