module task_dispatcher(clk, 
                       grant_acq, grant_txd,
                       done_acq, done_txd,
                       rx_data_fresh, rx_data,
                       led);
   input [7:0] rx_data;
   
   input       clk;
   input       done_acq;   
   input       done_txd;
   input       rx_data_fresh;
   
   
   output      grant_acq;
   
   output      grant_txd;
   output      led;   

   parameter STATE_RST = 2'b00;
   parameter STATE_ACQ = 2'b01;
   parameter STATE_TXD = 2'b10;

   reg [1:0] state;
   reg [1:0] nextstate;

   wire      grant_acq = state[0];  
   wire      done_acq;

   wire      grant_txd = state[1];   
   wire      done_txd;

   wire      led = state[1];   
   
  always @(posedge clk) begin
     if(rx_data_fresh && rx_data == 8'd98) 
       begin
          state <= STATE_RST;
       end 
     else 
       begin
          state <= nextstate;
       end
  end
   
   always @(state or posedge done_acq or posedge done_txd) begin
      nextstate = STATE_RST;
      
      case(state)
        STATE_RST: begin
           nextstate = STATE_ACQ;           
        end        
        STATE_ACQ: begin
           if(done_acq)
             nextstate = STATE_TXD;
           else
             nextstate = STATE_ACQ;
        end
        STATE_TXD: begin
           if(done_txd)
             nextstate = STATE_ACQ;
           else
             nextstate = STATE_TXD;
        end        
      endcase // case (state)
   end   
   
endmodule // task_dispatcher

                       
