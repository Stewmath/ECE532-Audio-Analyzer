// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.3 (lin64) Build 2405991 Thu Dec  6 23:36:41 MST 2018
// Date        : Fri Mar 21 18:07:10 2025
// Host        : MattsThinkpad running 64-bit unknown
// Command     : write_verilog -force -mode synth_stub -rename_top design_1_keyboard_ip_0_0 -prefix
//               design_1_keyboard_ip_0_0_ design_1_keyboard_ip_0_0_stub.v
// Design      : design_1_keyboard_ip_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a200tsbg484-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "top,Vivado 2018.3" *)
module design_1_keyboard_ip_0_0(clk, PS2Data, PS2Clk, s00_axis_aclk, 
  s00_axis_aresetn, s00_axis_tready, s00_axis_tlast, s00_axis_tdata, s00_axis_tvalid)
/* synthesis syn_black_box black_box_pad_pin="clk,PS2Data,PS2Clk,s00_axis_aclk,s00_axis_aresetn,s00_axis_tready,s00_axis_tlast,s00_axis_tdata[31:0],s00_axis_tvalid" */;
  input clk;
  input PS2Data;
  input PS2Clk;
  input s00_axis_aclk;
  input s00_axis_aresetn;
  input s00_axis_tready;
  output s00_axis_tlast;
  output [31:0]s00_axis_tdata;
  output s00_axis_tvalid;
endmodule
