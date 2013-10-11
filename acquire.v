// acquire module
// takes mode, trigger edge 1, threshold 8, pattern length 3, pattern 8
// if mode is 0 - oscilloscope
// each sample is written into ram as is
// if mode is 1 - logic analyser
// if trigger edge is 0, neg 1
// if trigger edge is 1, pos 1
// if sample is above threshold, read 1 bit; when 8 bits have been read, store in ram
// writes into ram
// pings back when ram is full

`timescale 1 ps / 1 ps

module acquire(clk, grant, done, adc_data, wr_addr, wr_data, wr_en);
parameter RAM_SIZE = 8 * 512;

input clk;
input grant;
input [7:0] adc_data;

output done;
output [9:0] wr_addr;
output [7:0] wr_data;
output wr_en;
   
wire [9:0] wr_addr;
wire [7:0] wr_data;

localparam STATE_IDLE = 2'b00;
localparam STATE_WRITE = 2'b01;
localparam STATE_SAY_DONE = 2'b10;

reg [1:0] state;
wire wr_en = state[0];
wire done = state[1];

always @(posedge clk) begin
	case(state)
	STATE_IDLE: begin
		if(grant)
			state <= STATE_WRITE;
	end
	STATE_WRITE: begin
		if(&wr_addr)
			state <= STATE_SAY_DONE;
	end
	STATE_SAY_DONE: begin
		state <= STATE_IDLE;
	end
	endcase
end

counter	wr_addr_cntr (
	.clock ( clk ),
	.cnt_en ( wr_en ),
	.sclr ( done ),
	.q ( wr_addr )
	);

assign wr_data = adc_data;

endmodule
