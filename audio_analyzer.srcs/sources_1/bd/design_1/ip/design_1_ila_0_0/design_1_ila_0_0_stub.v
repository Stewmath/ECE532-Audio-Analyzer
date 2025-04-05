// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.3 (lin64) Build 2405991 Thu Dec  6 23:36:41 MST 2018
// Date        : Thu Mar 13 02:19:07 2025
// Host        : MattsThinkpad running 64-bit unknown
// Command     : write_verilog -force -mode synth_stub -rename_top design_1_ila_0_0 -prefix
//               design_1_ila_0_0_ design_1_ila_0_0_stub.v
// Design      : design_1_ila_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a200tsbg484-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "ila,Vivado 2018.3" *)
module design_1_ila_0_0(clk, probe0)
/* synthesis syn_black_box black_box_pad_pin="clk,probe0[5:0]" */;
  input clk;
  input [5:0]probe0;
endmodule
