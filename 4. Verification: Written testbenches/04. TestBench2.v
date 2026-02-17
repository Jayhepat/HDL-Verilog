The waveform below sets clk, in, and s:
Module q7 has the following declaration:

module q7 (
    input clk,
    input in,
    input [2:0] s,
    output out
);
Write a testbench that instantiates module q7 and generates these input signals exactly as shown in the waveform above.

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


`timescale 1ps / 1ps
module top_module();
    reg clk;
    reg in;
    reg [2:0] s;
    wire out;
    
    q7 u_q7(
        .clk(clk),
        .in(in),
        .s(s),
        .out(out));
        
        initial begin
            clk = 0;
            in = 0;
            s = 2;
            #10;
            s = 6;
            #10;
            in = 1;
            s = 2;
            #10
            in = 0;
            s = 7;
            #10;
            in = 1;
            s = 0;
            #30;
            in = 0;
        end
        
        always begin
            #5 clk = ~clk;  //At every 5 picosecond CLK should ripple 1 & 0.
        end

endmodule
        
        
