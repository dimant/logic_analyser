module transmit_tb();
`include "fail_event.v"
   
   reg clk;
   reg rst;   

   reg grant;
   wire done;

   wire [7:0] tx_data;
   wire       tx_data_valid;
   reg        tx_data_ack;

   wire [9:0] rd_addr;
   reg [7:0]  rd_data;
   
   transmit t(clk, rst,
              grant, done, 
              tx_data, tx_data_valid, tx_data_ack, 
              rd_addr, rd_data);

   initial begin 
      clk = 1'b0;
      rd_data = 8'd0;

//      $monitor("%d %d %d %d",
//               rd_addr, tx_data, tx_data_valid, tx_data_ack);
      
      #5 rst = 1'b1;
      #10 rst = 1'b0;
      
      #15 grant = 1'b1;           
   end                          

   wire last_addr;

   assign last_addr = &rd_addr;

   always @(rd_addr) begin
      rd_data <= rd_data + 1;
   end   

   always @(tx_data_valid) begin
      #5 tx_data_ack = 1'b1;
      #10 tx_data_ack = 1'b0;      
   end

   always @(posedge done) begin
      if(~last_addr) -> t_fail;      
   end
   
   always
     #5 clk = !clk;

   initial
     #5000 $finish;
endmodule // transmit_tb

