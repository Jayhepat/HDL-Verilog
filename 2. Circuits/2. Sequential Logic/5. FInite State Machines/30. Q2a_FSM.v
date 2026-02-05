Consider the state diagram shown below.
State diagram : https://hdlbits.01xz.net/mw/images/5/57/Exams_2012q2.png

Write complete Verilog code that represents this FSM. Use separate always blocks for the state table and the state flip-flops, as done in lectures. 
Describe the FSM output, which is called z, using either continuous assignment statement(s) or an always block (at your discretion). Assign any state codes that you wish to use.
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

module top_module (
    input clk,
    input reset,   // Synchronous active-high reset
    input w,
    output z
);
    parameter a=3'b000, b=3'b001, c=3'b010, d=3'b011, e=3'b100, f=3'b101;
    reg [2:0] state, next_state;
    
    always@(*) begin
        case({state, w})
            {a, 1'b0}:  next_state = a;
            {a, 1'b1}:  next_state = b;
            {b, 1'b0}:  next_state = d;
            {b, 1'b1}:  next_state = c;
            {c, 1'b0}:  next_state = d;
            {c, 1'b1}:  next_state = e;
            {d, 1'b0}:  next_state = a;
            {d, 1'b1}:  next_state = f;
            {e, 1'b0}:  next_state = d;
            {e, 1'b1}:  next_state = e;
            {f, 1'b0}:  next_state = d;
            {f, 1'b1}:  next_state = c;
            default : next_state = a;
        endcase
    end
    
    always@(posedge clk) begin
        if(reset)
            state <= a;
        else
            state <= next_state;
    end
    
    assign z = (state == e || state == f);

endmodule
