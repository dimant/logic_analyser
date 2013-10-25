module task_dispatcher_tb();
   reg clk;

   reg [7:0] rx_data;
   reg       rx_data_fresh;
   reg       done_acq;
   reg       done_txd;   

   task_dispatcher td(clk, 
                      grant_acq, grant_txd,
                      done_acq, done_txd,
                      rx_data_fresh, rx_data,
                      led);
   
   initial begin 
      $monitor("%d | %d %d | %d %d ", 
               clk, 
               grant_acq, done_acq, 
               grant_txd, done_txd);

      clk = 1'b0;

      done_acq = 1'b0;
      done_txd = 1'b0;      
      
      #5 rx_data_fresh = 1'b1;
      #5 rx_data = 8'd98;

      #10 rx_data_fresh = 1'b0;
      #10 rx_data = 8'd0;      
   end

   always
     #5 clk = !clk;

   always @(posedge grant_acq) begin
      #25 done_acq = 1'b1;
      #5 done_acq = 1'b0;      
   end

   always @(posedge grant_txd) begin
      #25 done_txd = 1'b1;
      #5 done_txd = 1'b0;
   end
   
   initial
     #200 $finish;
endmodule // task_dispatcher_tb
