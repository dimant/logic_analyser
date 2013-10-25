module task_dispatcher_tb();
`include "fail_event.v"
   
   reg clk;
   reg rst;
   
   reg done_acq;
   reg done_txd;   

   task_dispatcher td(clk, rst,
                      grant_acq, grant_txd,
                      done_acq, done_txd);
   
   initial begin
      $dumpfile("task_dispatcher.vcd");
      $dumpall();      
      
      // $monitor("%d | %d %d | %d %d ", 
      //          clk, 
      //          grant_acq, done_acq, 
      //          grant_txd, done_txd);

      clk = 1'b0;

      done_acq = 1'b0;
      done_txd = 1'b0;      
      
      #5 rst = 1'b1;
      #5 rst = 1'b0;

   end

   always
     #5 clk = !clk;
   
   always @(posedge grant_acq) begin
      #35 done_acq = 1'b1;
      #10 done_acq = 1'b0;      
   end

   always @(posedge grant_txd) begin
      #35 done_txd = 1'b1;
      #10 done_txd = 1'b0;
   end

   always @(negedge done_acq) begin
      if(~grant_txd | grant_acq) -> t_fail;      
   end 

   always @(negedge done_txd) begin
      if(~grant_acq | grant_txd) -> t_fail;
   end 
   
   initial
     #200 $finish;
endmodule // task_dispatcher_tb
