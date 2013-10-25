module task_dispatcher(clk, rst,
                       grant_acq, grant_txd,
                       done_acq, done_txd);
   input clk;
   input rst;
   
   input done_acq;   
   input done_txd;
   
   output grant_acq;   
   output grant_txd;

   localparam STATE_ACQ = 2'b01;
   localparam STATE_TXD = 2'b10;

   reg [1:0] state;
   reg [1:0] next;

   wire      grant_acq = state[0];
   wire      done_acq;

   wire      grant_txd = state[1];   
   wire      done_txd;


   
   always @(posedge clk or posedge rst) begin
      if(rst) 
        state <= STATE_ACQ;
      else
        state <= next;      
   end
   
   always @(state or
            done_acq or 
            done_txd) begin
      next = 2'b00;

      case(state)
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
        default:
		    next = STATE_ACQ;
      endcase // case (state)
   end   
   
endmodule // task_dispatcher

                       
