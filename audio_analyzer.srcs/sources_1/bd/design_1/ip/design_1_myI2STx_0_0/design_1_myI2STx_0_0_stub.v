// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.3 (lin64) Build 2405991 Thu Dec  6 23:36:41 MST 2018
// Date        : Mon Mar 24 14:04:51 2025
// Host        : MattsThinkpad running 64-bit unknown
// Command     : write_verilog -force -mode synth_stub -rename_top design_1_myI2STx_0_0 -prefix
//               design_1_myI2STx_0_0_ design_1_myI2STx_0_0_stub.v
// Design      : design_1_myI2STx_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a200tsbg484-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "myI2STx_v1_0,Vivado 2018.3" *)
module design_1_myI2STx_0_0(bclk, lrclk, sdata, mclk, sdata_in, s00_axis_tdata, 
  s00_axis_tstrb, s00_axis_tlast, s00_axis_tvalid, m00_axis_aclk, m00_axis_aresetn, 
  m00_axis_tvalid, m00_axis_tdata, m00_axis_tlast, m00_axis_tready, s00_axis_tready, 
  s00_axis_aclk, s00_axis_aresetn)
/* synthesis syn_black_box black_box_pad_pin="bclk,lrclk,sdata,mclk,sdata_in,s00_axis_tdata[31:0],s00_axis_tstrb[3:0],s00_axis_tlast,s00_axis_tvalid,m00_axis_aclk,m00_axis_aresetn,m00_axis_tvalid,m00_axis_tdata[31:0],m00_axis_tlast,m00_axis_tready,s00_axis_tready,s00_axis_aclk,s00_axis_aresetn" */;
  output bclk;
  output lrclk;
  output sdata;
  input mclk;
  input sdata_in;
  input [31:0]s00_axis_tdata;
  input [3:0]s00_axis_tstrb;
  input s00_axis_tlast;
  input s00_axis_tvalid;
  input m00_axis_aclk;
  input m00_axis_aresetn;
  output m00_axis_tvalid;
  output [31:0]m00_axis_tdata;
  output m00_axis_tlast;
  input m00_axis_tready;
  output s00_axis_tready;
  input s00_axis_aclk;
  input s00_axis_aresetn;
endmodule
