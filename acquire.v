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

module acquire(clk, rst,
               grant_acq, done_acq,
               adc_data, 
               wr_addr, wr_data, wr_en);
   
   parameter RAM_SIZE = 8 * 512;

   input clk;
   input rst;   
   input grant_acq;
   input [7:0] adc_data;
   
   output      done_acq;
   output [9:0] wr_addr;
   output [7:0] wr_data;
   output       wr_en;
   
   wire [9:0]   wr_addr;
   wire [7:0]   wr_data = adc_data;
   
   wire         last_addr = &wr_addr;   
   
   localparam IDLE = 0;   
   localparam WRITE = 1;
   
   reg [1:0]    state;
   reg [1:0]    next;
    
   wire         wr_en = state[WRITE];
   wire         done_acq = state[IDLE] & last_addr;
   
   always @(posedge clk or posedge rst)
     if(rst)
       state <= 2'b01;
     else
       state <= next;  
  
   always @(state or
            posedge grant_acq or
            posedge last_addr) begin
     next <= 2'b00;
   
     case(1'b1)
       state[IDLE]: begin
          if(grant_acq)
            next[WRITE] <= 1'b1;
          else
            next[IDLE] <= 1'b1;          
       end
       state[WRITE]: begin
          if(last_addr)
            next[IDLE] <= 1'b1;
          else
            next[WRITE] <= 1'b1;          
       end
     endcase 
   end
   
counter	wr_addr_cntr (
	.clock ( clk ),
	.cnt_en ( wr_en ),
	.sclr ( done ),
	.q ( wr_addr )
	);

endmodule
