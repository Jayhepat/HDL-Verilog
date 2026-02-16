This is a sequential circuit. The circuit consists of combinational logoc and one bit of memory (i.e., one flip - flop). The output of the flip-flop has been made observable through the output state.

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


module top_module (
    input clk,
    input a,
    input b,
    output q,
    output state  );
    
    always @ (posedge clk) begin 
        if (a == b)
            state  <= a;
        else 
            state  <= state;
    end
    assign q = (a == b) ? state : (~state);
endmodule
