// cross clock module
// switches control between acquire and transmit modules

module task_dispatcher(clk, 
	grant_acq, grant_txd,
	done_acq, done_txd,
	
	rx_data_fresh,
	rx_data,
	led);
	
	input clk;
	input done_txd;
	input done_acq;
	
	output led;
	input [7:0] rx_data;
	input rx_data_fresh;
	reg proceed;
	assign led = proceed;
	
	output grant_acq;
	output grant_txd;

	reg [1:0] state;

	wire grant_acq = state[0];
	wire grant_txd = state[1];
   
	wire done_txd;
	wire done_acq;
   
	parameter STATE_ACQ = 2'b01;
	parameter STATE_TXD = 2'b10;

always @(posedge clk) begin
	if(!proceed && rx_data_fresh && rx_data == 8'd98)
		proceed <= 1'b1;
	else if(!proceed)
		state = 2'b00;
	else if(proceed) begin
	case(state)
	STATE_ACQ: begin
		if(done_acq) begin
			state <= STATE_TXD;
			proceed <= 1'b0;
		end
	end
	STATE_TXD: begin
		if(done_txd) begin
			state <= STATE_ACQ;
			proceed <= 1'b0;
		end
	end
	default: begin
		state <= STATE_ACQ;
	end
	endcase

	end
end
endmodule
