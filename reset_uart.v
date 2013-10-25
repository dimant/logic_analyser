module reset_uart(clk, rx_data_fresh, rx_data, rst);
   input clk;
   input rx_data_fresh;
   input [7:0] rx_data;

   output rst;   

   // parameter RST_COMMAND = 8'b11111111;
   parameter STATE_IDLE = 1'b0;
   parameter STATE_RST = 1'b1;
   
   reg    state;
   wire   rst = state;
   
   always @(posedge rx_data_fresh) begin
      if(&rx_data)
        state <= STATE_RST;      
   end

   always @(posedge clk) begin
      case(state)
        STATE_IDLE:
          state <= STATE_IDLE;
        STATE_RST:
          state <= STATE_IDLE;
      endcase // case (state)      
   end

endmodule // reset_uart
