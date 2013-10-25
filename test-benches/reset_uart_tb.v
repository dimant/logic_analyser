module reset_uart_tb();
`include "fail_event.v"
   
   reg clk;

   reg [7:0] rx_data;
   reg       rx_data_fresh;
   wire      rst;

   reset_uart rub(clk,
                  rx_data_fresh, rx_data, 
                  rst);
   
   initial begin 
      clk = 1'b0;
      

      
      #5 rx_data = 8'b11111111;
      #5 rx_data_fresh = 1'b1;

      #8 rx_data_fresh = 1'b0;
      #8 rx_data = 8'd0; 
   end

   always
     #5 clk = !clk;

   always @(posedge clk)
     $display("%d %d %d", rst, rx_data_fresh, rx_data);

   reg resetted;
   
   always @(posedge rst) begin
      resetted = rst;      
   end
      
   initial begin
      #50 if(~resetted | rst) -> t_fail;
      
      #50 $finish;
   end

endmodule // reset_uart_tb
