module task_dispatcher_tb();
`include "fail_event.v"
   
   reg clk;
   reg rst;
   
   reg done_acq;
   reg done_txd;   

   task_dispatcher td(clk, rst,
                      grant_acq, grant_txd,
                      done_acq, done_txd,
                      led);
   
   initial begin 
      // $monitor("%d | %d %d | %d %d ", 
      //          clk, 
      //          grant_acq, done_acq, 
      //          grant_txd, done_txd);

      clk = 1'b0;

      done_acq = 1'b0;
      done_txd = 1'b0;      
      
      #5 rst = 1'b1;
      #10 rst = 1'b0;

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

   always @(posedge done_acq) begin
      if( ~ (grant_acq == 1 &
             done_acq == 1 &
             grant_txd == 0 &
             done_txd == 0) )
        -> t_fail;
      
      #5 if( ~ (grant_acq == 1 &
             done_acq == 0 &
             grant_txd == 0 &
             done_txd == 0) )
        -> t_fail;

      #10 if( ~ (grant_acq == 0 &
             done_acq == 0 &
             grant_txd == 1 &
             done_txd == 0) )
        -> t_fail;
   end // always @ (posedge done_acq)


   always @(posedge done_txd) begin
      if( ~ (grant_acq == 0 &
             done_acq == 0 &
             grant_txd == 1 &
             done_txd == 1) )
        -> t_fail;
      
      #5 if( ~ (grant_acq == 0 &
             done_acq == 0 &
             grant_txd == 1 &
             done_txd == 0) )
        -> t_fail;

      #10 if( ~ (grant_acq == 1 &
             done_acq == 0 &
             grant_txd == 0 &
             done_txd == 0) )
        -> t_fail;
   end // always @ (posedge done_acq)
   
   initial
     #200 $finish;
endmodule // task_dispatcher_tb
