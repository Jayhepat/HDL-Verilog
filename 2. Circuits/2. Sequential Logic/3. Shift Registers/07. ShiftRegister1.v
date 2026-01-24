Implement the following circuit:

CKT:  https://hdlbits.01xz.net/mw/images/1/15/Exams_m2014q4k.png
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

module top_module (
    input clk,
    input resetn,   // synchronous reset
    input in,
    output out);
    
    reg [2:0] Q;
    
    always @(posedge clk) begin
        if(resetn) begin
            Q[0] <= in;
            Q[1] <= Q[0];
            Q[2] <= Q[1];
            out <= Q[2];
        end
        else begin
            Q <= 3'b0;
            out <= 1'b0;
        end
    end


endmodule
