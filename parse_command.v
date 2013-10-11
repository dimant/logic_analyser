// control
// probably best to put control logic right here
// after receiving a control sequence, always invoke rst
// control should have:
//	command 1 byte
//  
//	command mode
// 	oscilloscope or logic analyser 1 byte
//
//	command reset
//  duration in cycles 1 byte
//
//	command acquire
//	threshold edge neg/pos 1 byte
// 	threshold 1 byte
//	trigger pattern 2 bytes (1 for relevant bit count 1 for pattern)

module parse_command(clk, rx_data, rx_data_fresh, configuration, configuration_valid);
   input clk;
   input [7:0] rx_data;
   input rx_data_fresh;
   
   output [28:0] configuration;
   output configuration_valid;
   
   reg rx_data_processed;

   reg [7:0] sampling_rate;
   reg 	     trigger_edge;
   reg [7:0] threshold;
   reg [3:0] pattern_len;
   reg [7:0] pattern;

   wire [28:0] configuration = {sampling_rate, trigger_edge, threshold, pattern_len, pattern};
   
   reg [3:0]  state;
   wire       configuration_valid = ~state[3];
   
   parameter STATE_IDLE = 4'b0000;
   
   parameter STATE_CMD_START = 4'b1001;
   
   parameter CMD_SAMPLING_RATE = 23;
   parameter STATE_POS_SAMPL = 4'b1010;
   
   // setup trigger
   parameter CMD_TRIGGER = 24;
   parameter STATE_POS_EDGE = 4'b1011;
   parameter STATE_POS_THRESH = 4'b1100;
   parameter STATE_POS_PAT_LEN = 4'b1101;
   parameter STATE_POS_PAT = 4'b1110;

   parameter STATE_END = 4'b1111;

   reg 	      rx_data_consumed;
   
   always @(posedge clk) begin
      
      if(!rx_data_fresh && rx_data_consumed) begin
	 rx_data_consumed <= 0;
      end      
      else if(rx_data_fresh && !rx_data_consumed) begin
	 rx_data_consumed <= 1;

	 case(state)
	   STATE_IDLE: begin
	      if(rx_data == CMD_SAMPLING_RATE) begin
		 state <= STATE_POS_SAMPL;
	      end
	      else if(rx_data == CMD_TRIGGER) begin
		 state <= STATE_POS_EDGE;
	      end
	      // otherwise continue to idle
	   end
	   
	   // setup sampling rate
	   STATE_POS_SAMPL: begin
	      sampling_rate <= rx_data;
	      state <= STATE_IDLE;
	   end
	   
	   // setup trigger
	   STATE_POS_EDGE: begin
	      trigger_edge <= rx_data[0];
	      state <= STATE_POS_THRESH;
	   end
	   STATE_POS_THRESH: begin
	      threshold <= rx_data;
	      state <= STATE_POS_PAT_LEN;
	   end
	   STATE_POS_PAT_LEN: begin
	      pattern_len <= rx_data[3:0];
	      state <= STATE_POS_PAT;
	   end
	   STATE_POS_PAT: begin
	      pattern <= rx_data;
	      state <= STATE_IDLE;
	   end
	   
	   // wait a bit before setting config valid to true
	   STATE_END: begin
	      state <= STATE_IDLE;
	   end
	   
	   // recover
	   default: begin
	      state <= STATE_IDLE;
	   end
	 endcase // case (state)
      end // if (grant && rx_data_fresh && !rx_data_consumed)
   end
endmodule // control
