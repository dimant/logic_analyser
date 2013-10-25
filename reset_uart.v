module reset_uart(clk, rx_data_fresh, rx_data, rst);
   input clk;
   input rx_data_fresh;
   input [7:0] rx_data;

   output rst;   

   // parameter RST_COMMAND = 8'b11111111;
   localparam STATE_IDLE = 1'b0;
   localparam STATE_RST = 1'b1;
   
   reg    state;

   wire   rst = state;

   wire rst_cmd = rx_data_fresh & &rx_data;
   
   always @(posedge clk) begin     
      case(state)
        STATE_IDLE: begin
           if(rst_cmd)
             state <= STATE_RST;
           else
             state <= STATE_IDLE;           
        end	
        STATE_RST: begin
          state <= STATE_IDLE;
        end
      endcase // case (state)      
   end

endmodule // reset_uart
