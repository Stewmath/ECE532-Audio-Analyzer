// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.3 (lin64) Build 2405991 Thu Dec  6 23:36:41 MST 2018
// Date        : Tue Apr  1 15:46:11 2025
// Host        : MattsThinkpad running 64-bit unknown
// Command     : write_verilog -force -mode synth_stub
//               /home/matthew/programs/ut/ece532/audio/audio_analyzer/audio_analyzer.srcs/sources_1/bd/design_1/ip/design_1_pitch_analyzer_video_0_0/design_1_pitch_analyzer_video_0_0_stub.v
// Design      : design_1_pitch_analyzer_video_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a200tsbg484-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "hdmi_top,Vivado 2018.3" *)
module design_1_pitch_analyzer_video_0_0(clk, smpl_axis_aclk, smpl_axis_aresetn, 
  smpl_axis_tready, smpl_axis_tdata, smpl_axis_tvalid, pitch_axis_aclk, pitch_axis_aresetn, 
  pitch_axis_tready, pitch_axis_tdata, pitch_axis_tvalid, S_AXI_ACLK, S_AXI_ARESETN, 
  S_AXI_AWADDR, S_AXI_AWVALID, S_AXI_AWREADY, S_AXI_WDATA, S_AXI_WSTRB, S_AXI_WVALID, 
  S_AXI_WREADY, S_AXI_BRESP, S_AXI_BVALID, S_AXI_BREADY, S_AXI_ARADDR, S_AXI_ARVALID, 
  S_AXI_ARREADY, S_AXI_RDATA, S_AXI_RRESP, S_AXI_RVALID, S_AXI_RREADY, TMDSp, TMDSn, TMDSp_clock, 
  TMDSn_clock)
/* synthesis syn_black_box black_box_pad_pin="clk,smpl_axis_aclk,smpl_axis_aresetn,smpl_axis_tready,smpl_axis_tdata[31:0],smpl_axis_tvalid,pitch_axis_aclk,pitch_axis_aresetn,pitch_axis_tready,pitch_axis_tdata[31:0],pitch_axis_tvalid,S_AXI_ACLK,S_AXI_ARESETN,S_AXI_AWADDR[31:0],S_AXI_AWVALID,S_AXI_AWREADY,S_AXI_WDATA[31:0],S_AXI_WSTRB[3:0],S_AXI_WVALID,S_AXI_WREADY,S_AXI_BRESP[1:0],S_AXI_BVALID,S_AXI_BREADY,S_AXI_ARADDR[31:0],S_AXI_ARVALID,S_AXI_ARREADY,S_AXI_RDATA[31:0],S_AXI_RRESP[1:0],S_AXI_RVALID,S_AXI_RREADY,TMDSp[2:0],TMDSn[2:0],TMDSp_clock,TMDSn_clock" */;
  input clk;
  input smpl_axis_aclk;
  input smpl_axis_aresetn;
  output smpl_axis_tready;
  input [31:0]smpl_axis_tdata;
  input smpl_axis_tvalid;
  input pitch_axis_aclk;
  input pitch_axis_aresetn;
  output pitch_axis_tready;
  input [31:0]pitch_axis_tdata;
  input pitch_axis_tvalid;
  input S_AXI_ACLK;
  input S_AXI_ARESETN;
  input [31:0]S_AXI_AWADDR;
  input S_AXI_AWVALID;
  output S_AXI_AWREADY;
  input [31:0]S_AXI_WDATA;
  input [3:0]S_AXI_WSTRB;
  input S_AXI_WVALID;
  output S_AXI_WREADY;
  output [1:0]S_AXI_BRESP;
  output S_AXI_BVALID;
  input S_AXI_BREADY;
  input [31:0]S_AXI_ARADDR;
  input S_AXI_ARVALID;
  output S_AXI_ARREADY;
  output [31:0]S_AXI_RDATA;
  output [1:0]S_AXI_RRESP;
  output S_AXI_RVALID;
  input S_AXI_RREADY;
  output [2:0]TMDSp;
  output [2:0]TMDSn;
  output TMDSp_clock;
  output TMDSn_clock;
endmodule
