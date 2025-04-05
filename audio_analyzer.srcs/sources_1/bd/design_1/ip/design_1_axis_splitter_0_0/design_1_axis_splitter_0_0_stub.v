// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.3 (lin64) Build 2405991 Thu Dec  6 23:36:41 MST 2018
// Date        : Sun Mar 30 01:53:52 2025
// Host        : MattsThinkpad running 64-bit unknown
// Command     : write_verilog -force -mode synth_stub -rename_top design_1_axis_splitter_0_0 -prefix
//               design_1_axis_splitter_0_0_ design_1_axis_splitter_0_0_stub.v
// Design      : design_1_axis_splitter_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a200tsbg484-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "axis_splitter,Vivado 2018.3" *)
module design_1_axis_splitter_0_0(in_axis_aclk, in_axis_aresetn, 
  in_axis_tready, in_axis_tdata, in_axis_tlast, in_axis_tvalid, out1_axis_aclk, 
  out1_axis_aresetn, out1_axis_tready, out1_axis_tdata, out1_axis_tlast, out1_axis_tvalid, 
  out2_axis_aclk, out2_axis_aresetn, out2_axis_tready, out2_axis_tdata, out2_axis_tlast, 
  out2_axis_tvalid)
/* synthesis syn_black_box black_box_pad_pin="in_axis_aclk,in_axis_aresetn,in_axis_tready,in_axis_tdata[31:0],in_axis_tlast,in_axis_tvalid,out1_axis_aclk,out1_axis_aresetn,out1_axis_tready,out1_axis_tdata[31:0],out1_axis_tlast,out1_axis_tvalid,out2_axis_aclk,out2_axis_aresetn,out2_axis_tready,out2_axis_tdata[31:0],out2_axis_tlast,out2_axis_tvalid" */;
  input in_axis_aclk;
  input in_axis_aresetn;
  output in_axis_tready;
  input [31:0]in_axis_tdata;
  input in_axis_tlast;
  input in_axis_tvalid;
  input out1_axis_aclk;
  input out1_axis_aresetn;
  input out1_axis_tready;
  output [31:0]out1_axis_tdata;
  output out1_axis_tlast;
  output out1_axis_tvalid;
  input out2_axis_aclk;
  input out2_axis_aresetn;
  input out2_axis_tready;
  output [31:0]out2_axis_tdata;
  output out2_axis_tlast;
  output out2_axis_tvalid;
endmodule
