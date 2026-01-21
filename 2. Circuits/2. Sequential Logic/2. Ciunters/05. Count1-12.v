Design a 1-12 counter with the following inputs and outputs:

Reset Synchronous active-high reset that forces the counter to 1
Enable Set high for the counter to run
Clk Positive edge-triggered clock input
Q[3:0] The output of the counter
c_enable, c_load, c_d[3:0] Control signals going to the provided 4-bit counter, so correct operation can be verified.
You have the following components available:

the 4-bit binary counter (count4) below, which has Enable and synchronous parallel-load inputs (load has higher priority than enable). The count4 module is provided to you. Instantiate it in your circuit.
logic gates

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

module top_module (
    input clk,
    input reset,
    input enable,
    output [3:0] Q,
    output c_enable,
    output c_load,
    output [3:0] c_d
); 

    initial Q <= 1;
    
    always @(posedge clk) begin
        if(reset | ((Q == 12) & enable)) Q <= 1;
        else Q <= (enable) ? Q + 1 : Q;
    end
    
    assign c_enable = enable;
    assign c_load = (reset | ((Q == 12) & enable));
    assign c_d = c_load ? 1 : 0;           
          
     
    count4 the_counter (clk, c_enable, c_load, c_d /*, ... */ );

endmodule
