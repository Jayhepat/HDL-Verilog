Now that you have a state machine that will identify three-byte messages in a PS/2 byte stream, add a datapath that will also output the 24-bit (3 byte) message whenever a packet is received (out_bytes[23:16] is the first byte, 
                                                                                                                                                                                                out_bytes[15:8] is the second byte, etc.).

out_bytes needs to be valid whenever the done signal is asserted. You may output anything at other times (i.e., don't-care).
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

module top_module(
    input clk,
    input [7:0] in,
    input reset,    // Synchronous reset
    output [23:0] out_bytes,
    output done); //

     localparam [1:0] BYTE1 = 2'b00,
    				 BYTE2 = 2'b01,
    				 BYTE3 = 2'b10,
    				 DONE  = 2'b11;

    reg [1:0] state, next;
    reg [23:0] data;

    // State transition logic (combinational)
    always @(*) begin
    	case(state)
    		BYTE1 : next = (in[3]) ? BYTE2 : BYTE1;
    		BYTE2 : next = BYTE3;
    		BYTE3 : next = DONE;
    		DONE  : next = (in[3]) ? BYTE2 : BYTE1;
    	endcase
    end

    // State flip-flops (sequential)
    always @(posedge clk) begin
    	if(reset) state <= BYTE1;
    	else state <= next;
    end
 
    // New: Datapath to store incoming bytes.
    always @(posedge clk) begin
    	if (reset) data <= 24'b0;
    	else data <= {data[15:8], data[7:0], in};
    end
    
    // Output logic
    assign done = (state == DONE);
    assign out_bytes = (done) ? data : 24'b0;

endmodule
