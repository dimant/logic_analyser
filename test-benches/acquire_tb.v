module acquire_tb;
   reg clk;
   reg grant;
   wire [7:0] adc_data;

   wire [9:0] wr_addr;
   wire [7:0] wr_data;
   wire       wr_en;
      
   acquire a(clk, grant, done, adc_data, wr_addr, wr_data, wr_en);
   defparam a .RAM_SIZE = 1536;

endmodule // acquire_tb
