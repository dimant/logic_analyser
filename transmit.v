// transmit module
// writes contents of ram on serial port
// pings back when done

module transmit(clk, rst,
                grant_txd, done_txd, 
                tx_data, tx_data_valid, tx_data_ack, 
                rd_addr, rd_data);
   
   parameter RAM_SIZE = 8 * 512;
   
   input clk;
   input rst;   
   input grant_txd;
   input tx_data_ack;
   input [7:0] rd_data;

   output      done_txd;
   output [7:0] tx_data;
   output       tx_data_valid;
   output [9:0] rd_addr;
           
   localparam IDLE = 0;
   localparam TXD_VALID = 1;
   localparam COUNT = 2;

   reg [2:0]    state;
   reg [2:0]    next;   
   
   wire [7:0]   tx_data = rd_data;
   wire [9:0]   rd_addr;
   
   wire         tx_data_valid = state[TXD_VALID];
   wire         rd_addr_inc_en = state[COUNT];

   wire         last_addr = &rd_addr;
   wire         done = last_addr & tx_data_ack;
   
   always @(posedge clk) begin
      if(rst) 
        state <= 3'b001; 
      else
        state <= next;      
   end
   
   always @(state or 
            posedge tx_data_ack or
            posedge grant_txd or
            posedge done) begin      
      next <= 3'b000;
      
      case(1'b1)
	state[IDLE]: begin
           if(grant_txd)
             next[TXD_VALID] <= 1'b1;
           else
             next[IDLE] <= 1'b1;           
	end
        state[TXD_VALID]: begin
          if(tx_data_ack)
            next[COUNT] <= 1'b1;
          else
            next[TXD_VALID] <= 1'b1;           
        end
        state[COUNT]: begin
          if(done)
            next[IDLE] <= 1'b1;
          else
            next[TXD_VALID] <= 1'b1;           
        end
          
      endcase
end

// seems like it doesn't start from 0
// unless you invoke clear
counter	wr_addr_cntr (
	.clock ( clk ),
	.cnt_en ( rd_addr_inc_en ),
	.sclr ( done_txd ),
	.q ( rd_addr )
	);	

endmodule // transmit
