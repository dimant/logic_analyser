module logic_analyser(clk_FPGA, clk_ADC, rxd, txd, adc_data, led);
   input clk_FPGA;
   input clk_ADC;
   input rxd;
   input [7:0] adc_data;

   output      txd;
   output      led;
   // no DAC control on Flashy rev H

   wire [7:0]  tx_data;
   wire        tx_data_valid;
   wire        tx_data_ack;

   wire [7:0]  rx_data;
   wire        rx_data_fresh;

   uart u (.clk(clk_FPGA),
	   .tx_data(tx_data),
	   .tx_data_valid(tx_data_valid),
	   .tx_data_ack(tx_data_ack),
	   .txd(txd),
	   .rx_data(rx_data),
	   .rx_data_fresh(rx_data_fresh),
	   .rxd(rxd));
   defparam u .CLK_HZ = 25_000_000;
   defparam u .BAUD = 115200;

   wire        rst;

   reset_uart ru(clk_ADC, rx_data_fresh, rx_data, rst);

   //wire [28:0] configuration_clk_FPGA;
   //wire configuration_valid_clk_FPGA;
   //
   //wire [28:0] configuration_clk_ADC;
   //wire configuration_valid_clk_ADC;

   wire        grant_acq_clk_FPGA;
   wire        grant_acq_clk_ADC;

   wire        led = grant_acq_clk_FPGA;

   wire        done_acq_clk_ADC;
   wire        done_acq_clk_FPGA;

   //synchronizer s_FPGA_to_ADC(.clk_in(clk_FPGA),
   //	.clk_out(clk_ADC), 
   //	.dat_in({configuration_valid_clk_FPGA, configuration_clk_FPGA, grant_acq_clk_FPGA}), 
   //	.dat_out({configuration_valid_clk_ADC, configuration_clk_ADC, grant_acq_clk_ADC}));
   //defparam s_FPGA_to_ADC .WIDTH = 31;
   //defparam s_FPGA_to_ADC .STAGES = 3;

   synchronizer s_ADC_to_FPGA(.clk_in(clk_ADC),
	                      .clk_out(clk_FPGA), 
	                      .dat_in(done_acq_clk_ADC), 
	                      .dat_out(done_acq_clk_FPGA));
   defparam s_ADC_to_FPGA .WIDTH = 1;
   defparam s_ADC_to_FPGA .STAGES = 3;

   //parse_command pc(.clk(clk_FPGA),
   //	.rx_data(rx_data),
   //	.rx_data_fresh(rx_data_fresh),
   //	.configuration(configuration_clk_FPGA),
   //	.configuration_valid(configuration_valid_clk_FPGA));

   wire [9:0]  wr_addr;
   wire [7:0]  wr_data;
   wire        wr_en;

   acquire a(.clk(clk_ADC), .rst(rst),
	     .grant_acq(grant_acq_clk_ADC),
	     .done_acq(done_acq_clk_ADC),
	     .adc_data(adc_data),
	     .wr_addr(wr_addr),
	     .wr_data(wr_data),
	     .wr_en(wr_en));

   wire [9:0]  rd_addr;
   wire [7:0]  rd_data;
   wire        grant_txd;
   wire        done_txd;

   transmit t(.clk(clk_FPGA), .rst(rst),
	      .grant_txd(grant_txd),
	      .done_txd(done_txd),
	      .tx_data(tx_data),
	      .tx_data_valid(tx_data_valid),
	      .tx_data_ack(tx_data_ack),
	      .rd_addr(rd_addr),
	      .rd_data(rd_data));
   defparam t .RAM_SIZE = 1536;

   task_dispatcher td(.clk(clk_FPGA), .rst(rst),
	              .grant_acq(grant_acq_clk_FPGA), 
	              .grant_txd(grant_txd),	
	              .done_txd(done_txd), 
	              .done_acq(done_acq_clk_FPGA));
   
   // ram module
   // 8 bit wide, 512x2 bit deep
   ram	ram_acq (
	         .data ( wr_data ),
	         .rdaddress ( rd_addr ),
	         .rdclock ( clk_FPGA ),
	         .wraddress ( wr_addr ),
	         .wrclock ( clk_ADC ),
	         .wren ( wr_en ),
	         .q ( rd_data )
	         );
   
endmodule
