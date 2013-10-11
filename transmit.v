
// transmit module
// writes contents of ram on serial port
// pings back when done

module transmit(clk, grant, done, tx_data, tx_data_valid, tx_data_ack, rd_addr, rd_data);
parameter RAM_SIZE = 8 * 512;
   
input clk;
input grant;
input tx_data_ack;
input [7:0] rd_data;

output done;
output [7:0] tx_data;
output tx_data_valid;
output [9:0] rd_addr;

wire [7:0] tx_data;
wire [9:0] rd_addr;

reg [3:0] state;

wire tx_data_valid = state[1];
wire rd_addr_inc_en = state[2];
wire done = state[3];

localparam STATE_IDLE = 4'b0000;
localparam STATE_TRANSMIT = 4'b0001;
localparam STATE_TXD_VALID = 4'b0010;
localparam STATE_COUNT = 4'b0100;
localparam STATE_SAY_DONE = 4'b1000;

always @(posedge clk) begin
	case(state)
	STATE_IDLE: begin
		if(grant)
			state <= STATE_TRANSMIT;
	end
	STATE_TRANSMIT: begin
		if(&rd_addr)
			state <= STATE_SAY_DONE;
		else
			state <= STATE_TXD_VALID;
	end
	STATE_TXD_VALID: begin
		if(tx_data_ack)
			state <= STATE_COUNT;
	end
	STATE_COUNT: begin
		state <= STATE_TRANSMIT;
	end
	STATE_SAY_DONE: begin
		state <= STATE_IDLE;
	end
	endcase
end

// seems like it doesn't start from 0
// unless you invoke clear
counter	wr_addr_cntr (
	.clock ( clk ),
	.cnt_en ( rd_addr_inc_en ),
	.sclr ( done ),
	.q ( rd_addr )
	);
	
assign tx_data = rd_data;

endmodule // transmit

