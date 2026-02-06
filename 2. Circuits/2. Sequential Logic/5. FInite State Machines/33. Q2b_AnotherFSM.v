Consider a finite state machine that is used to control some type of motor. The FSM has inputs x and y, which come from the motor, and produces outputs f and g, which control the motor.
There is also a clock input called clk and a reset input called resetn.

The FSM has to work as follows. As long as the reset input is asserted, the FSM stays in a beginning state, called state A. When the reset signal is de-asserted,
then after the next clock edge the FSM has to set the output f to 1 for one clock cycle. Then, the FSM has to monitor the x input.
When x has produced the values 1, 0, 1 in three successive clock cycles, then g should be set to 1 on the following clock cycle. While maintaining g = 1 the FSM has to monitor the y input.
If y has the value 1 within at most two clock cycles, then the FSM should maintain g = 1 permanently (that is, until reset). But if y does not become 1 within two clock cycles,
then the FSM should set g = 0 permanently (until reset).

(The original exam question asked for a state diagram only. But here, implement the FSM.)

THE FSM DOESN'T BEGIN TO MONITER 'X' INPUT UNTIL THE CYCLE AFTER F IS 1.
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

module top_module (
    input clk,
    input resetn,    // active-low synchronous reset
    input x,
    input y,
    output f,
    output g
); 
     parameter A=4'd0, f1=4'd1, tmp0=4'd2, tmp1=4'd3, tmp2=4'd4, g1=4'd5, g1p=4'd6, tmp3=4'd7, g0p=4'd8;
    reg [3:0] state, next_state;
    
    always@(*) begin
        case(state)
            A: begin
                if(resetn) 
                    next_state = f1;
                else
                    next_state = A;
            end
            f1:     next_state = tmp0;
            tmp0: begin
                if(x)
                    next_state = tmp1;
                else
                    next_state = tmp0;
            end
            tmp1: begin
                if(~x)
                    next_state = tmp2;
                else
                    next_state = tmp1;
            end
            tmp2: begin
                if(x)
                    next_state = g1;
                else
                    next_state = tmp0;
            end
            g1: begin
                if(y)
                    next_state = g1p;
                else
                    next_state = tmp3;
            end
            tmp3: begin
                if(y)
                    next_state = g1p;
                else
                    next_state = g0p;
            end
            g1p: begin
                if(~resetn)
                    next_state = A;
                else
                    next_state = g1p;
            end
            g0p: begin
                if(~resetn)
                    next_state = A;
                else
                    next_state = g0p;
            end
        endcase
    end
    
    always@(posedge clk) begin
        if(~resetn)
            state <= A;
        else
            state <= next_state;
    end
    
    always@(posedge clk) begin
        case(next_state)
            f1:     f <= 1'b1;
            g1:		g <= 1'b1;
            tmp3:	g <= 1'b1;
            g1p:    g <= 1'b1;
            g0p:    g <= 1'b0;
            default: begin
                    f <= 1'b0;
                    g <= 1'b0;
            end
        endcase
    end

endmodule
