// Copyright (C) 1991-2009 Altera Corporation
// Your use of Altera Corporation's design tools, logic functions 
// and other software and tools, and its AMPP partner logic 
// functions, and any output files from any of the foregoing 
// (including device programming or simulation files), and any 
// associated documentation or information are expressly subject 
// to the terms and conditions of the Altera Program License 
// Subscription Agreement, Altera MegaCore Function License 
// Agreement, or other applicable license agreement, including, 
// without limitation, that your use is for the sole purpose of 
// programming logic devices manufactured by Altera and sold by 
// Altera or its authorized distributors.  Please refer to the 
// applicable agreement for further details.

// VENDOR "Altera"
// PROGRAM "Quartus II"
// VERSION "Version 9.0 Build 235 06/17/2009 Service Pack 2 SJ Web Edition"

// DATE "10/11/2013 14:15:16"

// 
// Device: Altera EP1K10TC100-1 Package TQFP100
// 

// 
// This greybox netlist file is for third party Synthesis Tools
// for timing and resource estimation only.
// 


module ram (
	data,
	rdaddress,
	rdclock,
	wraddress,
	wrclock,
	wren,
	q)/* synthesis synthesis_greybox=0 */;
input 	[7:0] data;
input 	[9:0] rdaddress;
input 	rdclock;
input 	[9:0] wraddress;
input 	wrclock;
input 	wren;
output 	[7:0] q;

wire gnd;
wire vcc;

assign gnd = 1'b0;
assign vcc = 1'b1;

wire \altdpram_component|q[0] ;
wire \altdpram_component|q[1] ;
wire \altdpram_component|q[2] ;
wire \altdpram_component|q[3] ;
wire \altdpram_component|q[4] ;
wire \altdpram_component|q[5] ;
wire \altdpram_component|q[6] ;
wire \altdpram_component|q[7] ;
wire \data[0]~dataout ;
wire \wrclock~dataout ;
wire \rdclock~dataout ;
wire \wren~dataout ;
wire \wraddress[0]~dataout ;
wire \wraddress[1]~dataout ;
wire \wraddress[2]~dataout ;
wire \wraddress[3]~dataout ;
wire \wraddress[4]~dataout ;
wire \wraddress[5]~dataout ;
wire \wraddress[6]~dataout ;
wire \wraddress[7]~dataout ;
wire \wraddress[8]~dataout ;
wire \wraddress[9]~dataout ;
wire \rdaddress[0]~dataout ;
wire \rdaddress[1]~dataout ;
wire \rdaddress[2]~dataout ;
wire \rdaddress[3]~dataout ;
wire \rdaddress[4]~dataout ;
wire \rdaddress[5]~dataout ;
wire \rdaddress[6]~dataout ;
wire \rdaddress[7]~dataout ;
wire \rdaddress[8]~dataout ;
wire \rdaddress[9]~dataout ;
wire \data[1]~dataout ;
wire \data[2]~dataout ;
wire \data[3]~dataout ;
wire \data[4]~dataout ;
wire \data[5]~dataout ;
wire \data[6]~dataout ;
wire \data[7]~dataout ;


ram_altdpram_1 altdpram_component(
	.q({\altdpram_component|q[7] ,\altdpram_component|q[6] ,\altdpram_component|q[5] ,\altdpram_component|q[4] ,\altdpram_component|q[3] ,\altdpram_component|q[2] ,\altdpram_component|q[1] ,\altdpram_component|q[0] }),
	.data({\data[7]~dataout ,\data[6]~dataout ,\data[5]~dataout ,\data[4]~dataout ,\data[3]~dataout ,\data[2]~dataout ,\data[1]~dataout ,\data[0]~dataout }),
	.inclock(\wrclock~dataout ),
	.outclock(\rdclock~dataout ),
	.wren(\wren~dataout ),
	.wraddress({\wraddress[9]~dataout ,\wraddress[8]~dataout ,\wraddress[7]~dataout ,\wraddress[6]~dataout ,\wraddress[5]~dataout ,\wraddress[4]~dataout ,\wraddress[3]~dataout ,\wraddress[2]~dataout ,\wraddress[1]~dataout ,\wraddress[0]~dataout }),
	.rdaddress({\rdaddress[9]~dataout ,\rdaddress[8]~dataout ,\rdaddress[7]~dataout ,\rdaddress[6]~dataout ,\rdaddress[5]~dataout ,\rdaddress[4]~dataout ,\rdaddress[3]~dataout ,\rdaddress[2]~dataout ,\rdaddress[1]~dataout ,\rdaddress[0]~dataout }));

flex10ke_io \data[0]~I (
	.datain(gnd),
	.clk(gnd),
	.ena(vcc),
	.aclr(gnd),
	.oe(gnd),
	.dataout(\data[0]~dataout ),
	.padio(data[0]));
defparam \data[0]~I .feedback_mode = "from_pin";
defparam \data[0]~I .operation_mode = "input";
defparam \data[0]~I .reg_source_mode = "none";

flex10ke_io \wrclock~I (
	.datain(gnd),
	.clk(gnd),
	.ena(vcc),
	.aclr(gnd),
	.oe(gnd),
	.dataout(\wrclock~dataout ),
	.padio(wrclock));
defparam \wrclock~I .feedback_mode = "from_pin";
defparam \wrclock~I .operation_mode = "input";
defparam \wrclock~I .reg_source_mode = "none";

flex10ke_io \rdclock~I (
	.datain(gnd),
	.clk(gnd),
	.ena(vcc),
	.aclr(gnd),
	.oe(gnd),
	.dataout(\rdclock~dataout ),
	.padio(rdclock));
defparam \rdclock~I .feedback_mode = "from_pin";
defparam \rdclock~I .operation_mode = "input";
defparam \rdclock~I .reg_source_mode = "none";

flex10ke_io \wren~I (
	.datain(gnd),
	.clk(gnd),
	.ena(vcc),
	.aclr(gnd),
	.oe(gnd),
	.dataout(\wren~dataout ),
	.padio(wren));
defparam \wren~I .feedback_mode = "from_pin";
defparam \wren~I .operation_mode = "input";
defparam \wren~I .reg_source_mode = "none";

flex10ke_io \wraddress[0]~I (
	.datain(gnd),
	.clk(gnd),
	.ena(vcc),
	.aclr(gnd),
	.oe(gnd),
	.dataout(\wraddress[0]~dataout ),
	.padio(wraddress[0]));
defparam \wraddress[0]~I .feedback_mode = "from_pin";
defparam \wraddress[0]~I .operation_mode = "input";
defparam \wraddress[0]~I .reg_source_mode = "none";

flex10ke_io \wraddress[1]~I (
	.datain(gnd),
	.clk(gnd),
	.ena(vcc),
	.aclr(gnd),
	.oe(gnd),
	.dataout(\wraddress[1]~dataout ),
	.padio(wraddress[1]));
defparam \wraddress[1]~I .feedback_mode = "from_pin";
defparam \wraddress[1]~I .operation_mode = "input";
defparam \wraddress[1]~I .reg_source_mode = "none";

flex10ke_io \wraddress[2]~I (
	.datain(gnd),
	.clk(gnd),
	.ena(vcc),
	.aclr(gnd),
	.oe(gnd),
	.dataout(\wraddress[2]~dataout ),
	.padio(wraddress[2]));
defparam \wraddress[2]~I .feedback_mode = "from_pin";
defparam \wraddress[2]~I .operation_mode = "input";
defparam \wraddress[2]~I .reg_source_mode = "none";

flex10ke_io \wraddress[3]~I (
	.datain(gnd),
	.clk(gnd),
	.ena(vcc),
	.aclr(gnd),
	.oe(gnd),
	.dataout(\wraddress[3]~dataout ),
	.padio(wraddress[3]));
defparam \wraddress[3]~I .feedback_mode = "from_pin";
defparam \wraddress[3]~I .operation_mode = "input";
defparam \wraddress[3]~I .reg_source_mode = "none";

flex10ke_io \wraddress[4]~I (
	.datain(gnd),
	.clk(gnd),
	.ena(vcc),
	.aclr(gnd),
	.oe(gnd),
	.dataout(\wraddress[4]~dataout ),
	.padio(wraddress[4]));
defparam \wraddress[4]~I .feedback_mode = "from_pin";
defparam \wraddress[4]~I .operation_mode = "input";
defparam \wraddress[4]~I .reg_source_mode = "none";

flex10ke_io \wraddress[5]~I (
	.datain(gnd),
	.clk(gnd),
	.ena(vcc),
	.aclr(gnd),
	.oe(gnd),
	.dataout(\wraddress[5]~dataout ),
	.padio(wraddress[5]));
defparam \wraddress[5]~I .feedback_mode = "from_pin";
defparam \wraddress[5]~I .operation_mode = "input";
defparam \wraddress[5]~I .reg_source_mode = "none";

flex10ke_io \wraddress[6]~I (
	.datain(gnd),
	.clk(gnd),
	.ena(vcc),
	.aclr(gnd),
	.oe(gnd),
	.dataout(\wraddress[6]~dataout ),
	.padio(wraddress[6]));
defparam \wraddress[6]~I .feedback_mode = "from_pin";
defparam \wraddress[6]~I .operation_mode = "input";
defparam \wraddress[6]~I .reg_source_mode = "none";

flex10ke_io \wraddress[7]~I (
	.datain(gnd),
	.clk(gnd),
	.ena(vcc),
	.aclr(gnd),
	.oe(gnd),
	.dataout(\wraddress[7]~dataout ),
	.padio(wraddress[7]));
defparam \wraddress[7]~I .feedback_mode = "from_pin";
defparam \wraddress[7]~I .operation_mode = "input";
defparam \wraddress[7]~I .reg_source_mode = "none";

flex10ke_io \wraddress[8]~I (
	.datain(gnd),
	.clk(gnd),
	.ena(vcc),
	.aclr(gnd),
	.oe(gnd),
	.dataout(\wraddress[8]~dataout ),
	.padio(wraddress[8]));
defparam \wraddress[8]~I .feedback_mode = "from_pin";
defparam \wraddress[8]~I .operation_mode = "input";
defparam \wraddress[8]~I .reg_source_mode = "none";

flex10ke_io \wraddress[9]~I (
	.datain(gnd),
	.clk(gnd),
	.ena(vcc),
	.aclr(gnd),
	.oe(gnd),
	.dataout(\wraddress[9]~dataout ),
	.padio(wraddress[9]));
defparam \wraddress[9]~I .feedback_mode = "from_pin";
defparam \wraddress[9]~I .operation_mode = "input";
defparam \wraddress[9]~I .reg_source_mode = "none";

flex10ke_io \rdaddress[0]~I (
	.datain(gnd),
	.clk(gnd),
	.ena(vcc),
	.aclr(gnd),
	.oe(gnd),
	.dataout(\rdaddress[0]~dataout ),
	.padio(rdaddress[0]));
defparam \rdaddress[0]~I .feedback_mode = "from_pin";
defparam \rdaddress[0]~I .operation_mode = "input";
defparam \rdaddress[0]~I .reg_source_mode = "none";

flex10ke_io \rdaddress[1]~I (
	.datain(gnd),
	.clk(gnd),
	.ena(vcc),
	.aclr(gnd),
	.oe(gnd),
	.dataout(\rdaddress[1]~dataout ),
	.padio(rdaddress[1]));
defparam \rdaddress[1]~I .feedback_mode = "from_pin";
defparam \rdaddress[1]~I .operation_mode = "input";
defparam \rdaddress[1]~I .reg_source_mode = "none";

flex10ke_io \rdaddress[2]~I (
	.datain(gnd),
	.clk(gnd),
	.ena(vcc),
	.aclr(gnd),
	.oe(gnd),
	.dataout(\rdaddress[2]~dataout ),
	.padio(rdaddress[2]));
defparam \rdaddress[2]~I .feedback_mode = "from_pin";
defparam \rdaddress[2]~I .operation_mode = "input";
defparam \rdaddress[2]~I .reg_source_mode = "none";

flex10ke_io \rdaddress[3]~I (
	.datain(gnd),
	.clk(gnd),
	.ena(vcc),
	.aclr(gnd),
	.oe(gnd),
	.dataout(\rdaddress[3]~dataout ),
	.padio(rdaddress[3]));
defparam \rdaddress[3]~I .feedback_mode = "from_pin";
defparam \rdaddress[3]~I .operation_mode = "input";
defparam \rdaddress[3]~I .reg_source_mode = "none";

flex10ke_io \rdaddress[4]~I (
	.datain(gnd),
	.clk(gnd),
	.ena(vcc),
	.aclr(gnd),
	.oe(gnd),
	.dataout(\rdaddress[4]~dataout ),
	.padio(rdaddress[4]));
defparam \rdaddress[4]~I .feedback_mode = "from_pin";
defparam \rdaddress[4]~I .operation_mode = "input";
defparam \rdaddress[4]~I .reg_source_mode = "none";

flex10ke_io \rdaddress[5]~I (
	.datain(gnd),
	.clk(gnd),
	.ena(vcc),
	.aclr(gnd),
	.oe(gnd),
	.dataout(\rdaddress[5]~dataout ),
	.padio(rdaddress[5]));
defparam \rdaddress[5]~I .feedback_mode = "from_pin";
defparam \rdaddress[5]~I .operation_mode = "input";
defparam \rdaddress[5]~I .reg_source_mode = "none";

flex10ke_io \rdaddress[6]~I (
	.datain(gnd),
	.clk(gnd),
	.ena(vcc),
	.aclr(gnd),
	.oe(gnd),
	.dataout(\rdaddress[6]~dataout ),
	.padio(rdaddress[6]));
defparam \rdaddress[6]~I .feedback_mode = "from_pin";
defparam \rdaddress[6]~I .operation_mode = "input";
defparam \rdaddress[6]~I .reg_source_mode = "none";

flex10ke_io \rdaddress[7]~I (
	.datain(gnd),
	.clk(gnd),
	.ena(vcc),
	.aclr(gnd),
	.oe(gnd),
	.dataout(\rdaddress[7]~dataout ),
	.padio(rdaddress[7]));
defparam \rdaddress[7]~I .feedback_mode = "from_pin";
defparam \rdaddress[7]~I .operation_mode = "input";
defparam \rdaddress[7]~I .reg_source_mode = "none";

flex10ke_io \rdaddress[8]~I (
	.datain(gnd),
	.clk(gnd),
	.ena(vcc),
	.aclr(gnd),
	.oe(gnd),
	.dataout(\rdaddress[8]~dataout ),
	.padio(rdaddress[8]));
defparam \rdaddress[8]~I .feedback_mode = "from_pin";
defparam \rdaddress[8]~I .operation_mode = "input";
defparam \rdaddress[8]~I .reg_source_mode = "none";

flex10ke_io \rdaddress[9]~I (
	.datain(gnd),
	.clk(gnd),
	.ena(vcc),
	.aclr(gnd),
	.oe(gnd),
	.dataout(\rdaddress[9]~dataout ),
	.padio(rdaddress[9]));
defparam \rdaddress[9]~I .feedback_mode = "from_pin";
defparam \rdaddress[9]~I .operation_mode = "input";
defparam \rdaddress[9]~I .reg_source_mode = "none";

flex10ke_io \data[1]~I (
	.datain(gnd),
	.clk(gnd),
	.ena(vcc),
	.aclr(gnd),
	.oe(gnd),
	.dataout(\data[1]~dataout ),
	.padio(data[1]));
defparam \data[1]~I .feedback_mode = "from_pin";
defparam \data[1]~I .operation_mode = "input";
defparam \data[1]~I .reg_source_mode = "none";

flex10ke_io \data[2]~I (
	.datain(gnd),
	.clk(gnd),
	.ena(vcc),
	.aclr(gnd),
	.oe(gnd),
	.dataout(\data[2]~dataout ),
	.padio(data[2]));
defparam \data[2]~I .feedback_mode = "from_pin";
defparam \data[2]~I .operation_mode = "input";
defparam \data[2]~I .reg_source_mode = "none";

flex10ke_io \data[3]~I (
	.datain(gnd),
	.clk(gnd),
	.ena(vcc),
	.aclr(gnd),
	.oe(gnd),
	.dataout(\data[3]~dataout ),
	.padio(data[3]));
defparam \data[3]~I .feedback_mode = "from_pin";
defparam \data[3]~I .operation_mode = "input";
defparam \data[3]~I .reg_source_mode = "none";

flex10ke_io \data[4]~I (
	.datain(gnd),
	.clk(gnd),
	.ena(vcc),
	.aclr(gnd),
	.oe(gnd),
	.dataout(\data[4]~dataout ),
	.padio(data[4]));
defparam \data[4]~I .feedback_mode = "from_pin";
defparam \data[4]~I .operation_mode = "input";
defparam \data[4]~I .reg_source_mode = "none";

flex10ke_io \data[5]~I (
	.datain(gnd),
	.clk(gnd),
	.ena(vcc),
	.aclr(gnd),
	.oe(gnd),
	.dataout(\data[5]~dataout ),
	.padio(data[5]));
defparam \data[5]~I .feedback_mode = "from_pin";
defparam \data[5]~I .operation_mode = "input";
defparam \data[5]~I .reg_source_mode = "none";

flex10ke_io \data[6]~I (
	.datain(gnd),
	.clk(gnd),
	.ena(vcc),
	.aclr(gnd),
	.oe(gnd),
	.dataout(\data[6]~dataout ),
	.padio(data[6]));
defparam \data[6]~I .feedback_mode = "from_pin";
defparam \data[6]~I .operation_mode = "input";
defparam \data[6]~I .reg_source_mode = "none";

flex10ke_io \data[7]~I (
	.datain(gnd),
	.clk(gnd),
	.ena(vcc),
	.aclr(gnd),
	.oe(gnd),
	.dataout(\data[7]~dataout ),
	.padio(data[7]));
defparam \data[7]~I .feedback_mode = "from_pin";
defparam \data[7]~I .operation_mode = "input";
defparam \data[7]~I .reg_source_mode = "none";

assign q[0] = \altdpram_component|q[0] ;

assign q[1] = \altdpram_component|q[1] ;

assign q[2] = \altdpram_component|q[2] ;

assign q[3] = \altdpram_component|q[3] ;

assign q[4] = \altdpram_component|q[4] ;

assign q[5] = \altdpram_component|q[5] ;

assign q[6] = \altdpram_component|q[6] ;

assign q[7] = \altdpram_component|q[7] ;

endmodule

module ram_altdpram_1 (
	q,
	data,
	inclock,
	outclock,
	wren,
	wraddress,
	rdaddress)/* synthesis synthesis_greybox=0 */;
output 	[7:0] q;
input 	[7:0] data;
input 	inclock;
input 	outclock;
input 	wren;
input 	[9:0] wraddress;
input 	[9:0] rdaddress;

wire gnd;
wire vcc;

assign gnd = 1'b0;
assign vcc = 1'b1;



flex10ke_ram_slice \segment[0][0] (
	.datain(data[0]),
	.clk0(inclock),
	.clk1(outclock),
	.ena0(vcc),
	.ena1(vcc),
	.clr0(gnd),
	.we(wren),
	.re(vcc),
	.waddr({gnd,wraddress[9],wraddress[8],wraddress[7],wraddress[6],wraddress[5],wraddress[4],wraddress[3],wraddress[2],wraddress[1],wraddress[0]}),
	.raddr({gnd,rdaddress[9],rdaddress[8],rdaddress[7],rdaddress[6],rdaddress[5],rdaddress[4],rdaddress[3],rdaddress[2],rdaddress[1],rdaddress[0]}),
	.dataout(q[0]));
defparam \segment[0][0] .address_width = 10;
defparam \segment[0][0] .bit_number = 0;
defparam \segment[0][0] .data_in_clear = "none";
defparam \segment[0][0] .data_in_clock = "clock0";
defparam \segment[0][0] .data_out_clear = "none";
defparam \segment[0][0] .data_out_clock = "clock1";
defparam \segment[0][0] .first_address = 0;
defparam \segment[0][0] .init_file = "none";
defparam \segment[0][0] .last_address = 1023;
defparam \segment[0][0] .logical_ram_depth = 1024;
defparam \segment[0][0] .logical_ram_name = "altdpram:altdpram_component|content";
defparam \segment[0][0] .logical_ram_width = 8;
defparam \segment[0][0] .operation_mode = "dual_port";
defparam \segment[0][0] .read_address_clear = "none";
defparam \segment[0][0] .read_address_clock = "clock1";
defparam \segment[0][0] .read_enable_clear = "none";
defparam \segment[0][0] .read_enable_clock = "none";
defparam \segment[0][0] .write_address_clear = "none";
defparam \segment[0][0] .write_enable_clear = "none";
defparam \segment[0][0] .write_logic_clock = "clock0";

flex10ke_ram_slice \segment[0][1] (
	.datain(data[1]),
	.clk0(inclock),
	.clk1(outclock),
	.ena0(vcc),
	.ena1(vcc),
	.clr0(gnd),
	.we(wren),
	.re(vcc),
	.waddr({gnd,wraddress[9],wraddress[8],wraddress[7],wraddress[6],wraddress[5],wraddress[4],wraddress[3],wraddress[2],wraddress[1],wraddress[0]}),
	.raddr({gnd,rdaddress[9],rdaddress[8],rdaddress[7],rdaddress[6],rdaddress[5],rdaddress[4],rdaddress[3],rdaddress[2],rdaddress[1],rdaddress[0]}),
	.dataout(q[1]));
defparam \segment[0][1] .address_width = 10;
defparam \segment[0][1] .bit_number = 1;
defparam \segment[0][1] .data_in_clear = "none";
defparam \segment[0][1] .data_in_clock = "clock0";
defparam \segment[0][1] .data_out_clear = "none";
defparam \segment[0][1] .data_out_clock = "clock1";
defparam \segment[0][1] .first_address = 0;
defparam \segment[0][1] .init_file = "none";
defparam \segment[0][1] .last_address = 1023;
defparam \segment[0][1] .logical_ram_depth = 1024;
defparam \segment[0][1] .logical_ram_name = "altdpram:altdpram_component|content";
defparam \segment[0][1] .logical_ram_width = 8;
defparam \segment[0][1] .operation_mode = "dual_port";
defparam \segment[0][1] .read_address_clear = "none";
defparam \segment[0][1] .read_address_clock = "clock1";
defparam \segment[0][1] .read_enable_clear = "none";
defparam \segment[0][1] .read_enable_clock = "none";
defparam \segment[0][1] .write_address_clear = "none";
defparam \segment[0][1] .write_enable_clear = "none";
defparam \segment[0][1] .write_logic_clock = "clock0";

flex10ke_ram_slice \segment[0][2] (
	.datain(data[2]),
	.clk0(inclock),
	.clk1(outclock),
	.ena0(vcc),
	.ena1(vcc),
	.clr0(gnd),
	.we(wren),
	.re(vcc),
	.waddr({gnd,wraddress[9],wraddress[8],wraddress[7],wraddress[6],wraddress[5],wraddress[4],wraddress[3],wraddress[2],wraddress[1],wraddress[0]}),
	.raddr({gnd,rdaddress[9],rdaddress[8],rdaddress[7],rdaddress[6],rdaddress[5],rdaddress[4],rdaddress[3],rdaddress[2],rdaddress[1],rdaddress[0]}),
	.dataout(q[2]));
defparam \segment[0][2] .address_width = 10;
defparam \segment[0][2] .bit_number = 2;
defparam \segment[0][2] .data_in_clear = "none";
defparam \segment[0][2] .data_in_clock = "clock0";
defparam \segment[0][2] .data_out_clear = "none";
defparam \segment[0][2] .data_out_clock = "clock1";
defparam \segment[0][2] .first_address = 0;
defparam \segment[0][2] .init_file = "none";
defparam \segment[0][2] .last_address = 1023;
defparam \segment[0][2] .logical_ram_depth = 1024;
defparam \segment[0][2] .logical_ram_name = "altdpram:altdpram_component|content";
defparam \segment[0][2] .logical_ram_width = 8;
defparam \segment[0][2] .operation_mode = "dual_port";
defparam \segment[0][2] .read_address_clear = "none";
defparam \segment[0][2] .read_address_clock = "clock1";
defparam \segment[0][2] .read_enable_clear = "none";
defparam \segment[0][2] .read_enable_clock = "none";
defparam \segment[0][2] .write_address_clear = "none";
defparam \segment[0][2] .write_enable_clear = "none";
defparam \segment[0][2] .write_logic_clock = "clock0";

flex10ke_ram_slice \segment[0][3] (
	.datain(data[3]),
	.clk0(inclock),
	.clk1(outclock),
	.ena0(vcc),
	.ena1(vcc),
	.clr0(gnd),
	.we(wren),
	.re(vcc),
	.waddr({gnd,wraddress[9],wraddress[8],wraddress[7],wraddress[6],wraddress[5],wraddress[4],wraddress[3],wraddress[2],wraddress[1],wraddress[0]}),
	.raddr({gnd,rdaddress[9],rdaddress[8],rdaddress[7],rdaddress[6],rdaddress[5],rdaddress[4],rdaddress[3],rdaddress[2],rdaddress[1],rdaddress[0]}),
	.dataout(q[3]));
defparam \segment[0][3] .address_width = 10;
defparam \segment[0][3] .bit_number = 3;
defparam \segment[0][3] .data_in_clear = "none";
defparam \segment[0][3] .data_in_clock = "clock0";
defparam \segment[0][3] .data_out_clear = "none";
defparam \segment[0][3] .data_out_clock = "clock1";
defparam \segment[0][3] .first_address = 0;
defparam \segment[0][3] .init_file = "none";
defparam \segment[0][3] .last_address = 1023;
defparam \segment[0][3] .logical_ram_depth = 1024;
defparam \segment[0][3] .logical_ram_name = "altdpram:altdpram_component|content";
defparam \segment[0][3] .logical_ram_width = 8;
defparam \segment[0][3] .operation_mode = "dual_port";
defparam \segment[0][3] .read_address_clear = "none";
defparam \segment[0][3] .read_address_clock = "clock1";
defparam \segment[0][3] .read_enable_clear = "none";
defparam \segment[0][3] .read_enable_clock = "none";
defparam \segment[0][3] .write_address_clear = "none";
defparam \segment[0][3] .write_enable_clear = "none";
defparam \segment[0][3] .write_logic_clock = "clock0";

flex10ke_ram_slice \segment[0][4] (
	.datain(data[4]),
	.clk0(inclock),
	.clk1(outclock),
	.ena0(vcc),
	.ena1(vcc),
	.clr0(gnd),
	.we(wren),
	.re(vcc),
	.waddr({gnd,wraddress[9],wraddress[8],wraddress[7],wraddress[6],wraddress[5],wraddress[4],wraddress[3],wraddress[2],wraddress[1],wraddress[0]}),
	.raddr({gnd,rdaddress[9],rdaddress[8],rdaddress[7],rdaddress[6],rdaddress[5],rdaddress[4],rdaddress[3],rdaddress[2],rdaddress[1],rdaddress[0]}),
	.dataout(q[4]));
defparam \segment[0][4] .address_width = 10;
defparam \segment[0][4] .bit_number = 4;
defparam \segment[0][4] .data_in_clear = "none";
defparam \segment[0][4] .data_in_clock = "clock0";
defparam \segment[0][4] .data_out_clear = "none";
defparam \segment[0][4] .data_out_clock = "clock1";
defparam \segment[0][4] .first_address = 0;
defparam \segment[0][4] .init_file = "none";
defparam \segment[0][4] .last_address = 1023;
defparam \segment[0][4] .logical_ram_depth = 1024;
defparam \segment[0][4] .logical_ram_name = "altdpram:altdpram_component|content";
defparam \segment[0][4] .logical_ram_width = 8;
defparam \segment[0][4] .operation_mode = "dual_port";
defparam \segment[0][4] .read_address_clear = "none";
defparam \segment[0][4] .read_address_clock = "clock1";
defparam \segment[0][4] .read_enable_clear = "none";
defparam \segment[0][4] .read_enable_clock = "none";
defparam \segment[0][4] .write_address_clear = "none";
defparam \segment[0][4] .write_enable_clear = "none";
defparam \segment[0][4] .write_logic_clock = "clock0";

flex10ke_ram_slice \segment[0][5] (
	.datain(data[5]),
	.clk0(inclock),
	.clk1(outclock),
	.ena0(vcc),
	.ena1(vcc),
	.clr0(gnd),
	.we(wren),
	.re(vcc),
	.waddr({gnd,wraddress[9],wraddress[8],wraddress[7],wraddress[6],wraddress[5],wraddress[4],wraddress[3],wraddress[2],wraddress[1],wraddress[0]}),
	.raddr({gnd,rdaddress[9],rdaddress[8],rdaddress[7],rdaddress[6],rdaddress[5],rdaddress[4],rdaddress[3],rdaddress[2],rdaddress[1],rdaddress[0]}),
	.dataout(q[5]));
defparam \segment[0][5] .address_width = 10;
defparam \segment[0][5] .bit_number = 5;
defparam \segment[0][5] .data_in_clear = "none";
defparam \segment[0][5] .data_in_clock = "clock0";
defparam \segment[0][5] .data_out_clear = "none";
defparam \segment[0][5] .data_out_clock = "clock1";
defparam \segment[0][5] .first_address = 0;
defparam \segment[0][5] .init_file = "none";
defparam \segment[0][5] .last_address = 1023;
defparam \segment[0][5] .logical_ram_depth = 1024;
defparam \segment[0][5] .logical_ram_name = "altdpram:altdpram_component|content";
defparam \segment[0][5] .logical_ram_width = 8;
defparam \segment[0][5] .operation_mode = "dual_port";
defparam \segment[0][5] .read_address_clear = "none";
defparam \segment[0][5] .read_address_clock = "clock1";
defparam \segment[0][5] .read_enable_clear = "none";
defparam \segment[0][5] .read_enable_clock = "none";
defparam \segment[0][5] .write_address_clear = "none";
defparam \segment[0][5] .write_enable_clear = "none";
defparam \segment[0][5] .write_logic_clock = "clock0";

flex10ke_ram_slice \segment[0][6] (
	.datain(data[6]),
	.clk0(inclock),
	.clk1(outclock),
	.ena0(vcc),
	.ena1(vcc),
	.clr0(gnd),
	.we(wren),
	.re(vcc),
	.waddr({gnd,wraddress[9],wraddress[8],wraddress[7],wraddress[6],wraddress[5],wraddress[4],wraddress[3],wraddress[2],wraddress[1],wraddress[0]}),
	.raddr({gnd,rdaddress[9],rdaddress[8],rdaddress[7],rdaddress[6],rdaddress[5],rdaddress[4],rdaddress[3],rdaddress[2],rdaddress[1],rdaddress[0]}),
	.dataout(q[6]));
defparam \segment[0][6] .address_width = 10;
defparam \segment[0][6] .bit_number = 6;
defparam \segment[0][6] .data_in_clear = "none";
defparam \segment[0][6] .data_in_clock = "clock0";
defparam \segment[0][6] .data_out_clear = "none";
defparam \segment[0][6] .data_out_clock = "clock1";
defparam \segment[0][6] .first_address = 0;
defparam \segment[0][6] .init_file = "none";
defparam \segment[0][6] .last_address = 1023;
defparam \segment[0][6] .logical_ram_depth = 1024;
defparam \segment[0][6] .logical_ram_name = "altdpram:altdpram_component|content";
defparam \segment[0][6] .logical_ram_width = 8;
defparam \segment[0][6] .operation_mode = "dual_port";
defparam \segment[0][6] .read_address_clear = "none";
defparam \segment[0][6] .read_address_clock = "clock1";
defparam \segment[0][6] .read_enable_clear = "none";
defparam \segment[0][6] .read_enable_clock = "none";
defparam \segment[0][6] .write_address_clear = "none";
defparam \segment[0][6] .write_enable_clear = "none";
defparam \segment[0][6] .write_logic_clock = "clock0";

flex10ke_ram_slice \segment[0][7] (
	.datain(data[7]),
	.clk0(inclock),
	.clk1(outclock),
	.ena0(vcc),
	.ena1(vcc),
	.clr0(gnd),
	.we(wren),
	.re(vcc),
	.waddr({gnd,wraddress[9],wraddress[8],wraddress[7],wraddress[6],wraddress[5],wraddress[4],wraddress[3],wraddress[2],wraddress[1],wraddress[0]}),
	.raddr({gnd,rdaddress[9],rdaddress[8],rdaddress[7],rdaddress[6],rdaddress[5],rdaddress[4],rdaddress[3],rdaddress[2],rdaddress[1],rdaddress[0]}),
	.dataout(q[7]));
defparam \segment[0][7] .address_width = 10;
defparam \segment[0][7] .bit_number = 7;
defparam \segment[0][7] .data_in_clear = "none";
defparam \segment[0][7] .data_in_clock = "clock0";
defparam \segment[0][7] .data_out_clear = "none";
defparam \segment[0][7] .data_out_clock = "clock1";
defparam \segment[0][7] .first_address = 0;
defparam \segment[0][7] .init_file = "none";
defparam \segment[0][7] .last_address = 1023;
defparam \segment[0][7] .logical_ram_depth = 1024;
defparam \segment[0][7] .logical_ram_name = "altdpram:altdpram_component|content";
defparam \segment[0][7] .logical_ram_width = 8;
defparam \segment[0][7] .operation_mode = "dual_port";
defparam \segment[0][7] .read_address_clear = "none";
defparam \segment[0][7] .read_address_clock = "clock1";
defparam \segment[0][7] .read_enable_clear = "none";
defparam \segment[0][7] .read_enable_clock = "none";
defparam \segment[0][7] .write_address_clear = "none";
defparam \segment[0][7] .write_enable_clear = "none";
defparam \segment[0][7] .write_logic_clock = "clock0";

endmodule
