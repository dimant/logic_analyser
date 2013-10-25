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
   
   localparam STATE_IDLE = 1'b0;
   localparam STATE_WRITE = 1'b1;
   
   reg          state;
   reg          next;
   
   wire         wr_en = state;
   wire         done_acq = ~state & last_addr;
   
   always @(posedge clk or posedge rst) begin
      if(rst)
        state <= STATE_IDLE;

      case(state)       
        STATE_IDLE: begin
           if(grant_acq)
             state <= STATE_WRITE;
           else
             state <= STATE_IDLE;          
        end
        STATE_WRITE: begin
           if(last_addr)
             state <= STATE_IDLE;          
           else
             state <= STATE_WRITE;
        end
      endcase 
   end
   
   counter	wr_addr_cntr (
	                      .clock ( clk ),
	                      .cnt_en ( wr_en ),
	                      .sclr ( done_acq ),
	                      .q ( wr_addr )
	                      );

endmodule
