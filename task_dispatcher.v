module task_dispatcher(clk, rst,
                       grant_acq, grant_txd,
                       done_acq, done_txd,
                       led);
   input clk;
   input rst;
   
   input done_acq;   
   input done_txd;
   
   output grant_acq;   
   output grant_txd;
   output led;   

   localparam STATE_IDLE = 2'b00;
   localparam STATE_ACQ = 2'b01;
   localparam STATE_TXD = 2'b10;

   reg [1:0] state;
   reg [1:0] next;

   wire      grant_acq = state[0];
   wire      done_acq;

   wire      grant_txd = state[1];   
   wire      done_txd;

   wire      led = state;
   
   always @(posedge clk) begin
      if(rst) 
        state <= STATE_IDLE; 
      else 
        state <= next;
   end
   
   always @(state or 
            posedge done_acq or 
            posedge done_txd) begin
      next = STATE_IDLE;      
             
      case(state)
        STATE_IDLE: begin
           next = STATE_ACQ;           
        end
        STATE_ACQ: begin
           if(done_acq)
             next = STATE_TXD;
           else
             next = STATE_ACQ;
        end
        STATE_TXD: begin
           if(done_txd)
             next = STATE_ACQ;
           else
             next = STATE_TXD;
        end        
      endcase // case (state)
   end   
   
endmodule // task_dispatcher

                       
