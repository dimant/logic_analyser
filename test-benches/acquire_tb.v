module acquire_tb;
`include "fail_event.v"

   reg clk;
   reg rst;
   
   reg grant_acq;
   reg [7:0] adc_data;

   wire [9:0] wr_addr;
   wire [7:0] wr_data;
   wire       wr_en;
   wire       done_acq;
         
   acquire a(clk, rst,
             grant_acq, done_acq, 
             adc_data, 
             wr_addr, wr_data, wr_en);
   
   defparam a .RAM_SIZE = 1536;
   
   wire last_addr = &wr_addr;
   reg  hit_last;

   initial begin
      clk = 1'b0;
      adc_data <= 8'd0;
      hit_last = 1'b0;
  
      #5 rst = 1'b1;
      #10 rst = 1'b0;
      
      #15 grant_acq = 1'b1;

   end

   always
     #5 clk = !clk;

   always @(wr_addr)
     adc_data = adc_data + 1;

   always @(posedge wr_en)
     if(wr_data != adc_data &
        adc_data != wr_addr >> 1)
       -> t_fail;
      
   always @(posedge last_addr) begin
      hit_last = 1'b1;    
   end

   reg       check_last;
   
   always @(wr_addr) begin
      if(last_addr)
        check_last <= 1'b1;
      else
        check_last <= 1'b0;

      if(check_last & |wr_addr)
        -> t_fail;      
   end

   initial begin
      #49999 if(~hit_last) -> t_fail;      
      #50000 $finish;
   end
endmodule // acquire_tb
