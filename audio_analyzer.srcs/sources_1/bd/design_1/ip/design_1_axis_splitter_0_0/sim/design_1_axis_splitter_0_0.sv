// (c) Copyright 1995-2025 Xilinx, Inc. All rights reserved.
// 
// This file contains confidential and proprietary information
// of Xilinx, Inc. and is protected under U.S. and
// international copyright and other intellectual property
// laws.
// 
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// Xilinx, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) Xilinx shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or Xilinx had been advised of the
// possibility of the same.
// 
// CRITICAL APPLICATIONS
// Xilinx products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of Xilinx products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
// 
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.
// 
// DO NOT MODIFY THIS FILE.


// IP VLNV: user.org:user:axis_splitter:1.0
// IP Revision: 4

`timescale 1ns/1ps

(* IP_DEFINITION_SOURCE = "package_project" *)
(* DowngradeIPIdentifiedWarnings = "yes" *)
module design_1_axis_splitter_0_0 (
  in_axis_aclk,
  in_axis_aresetn,
  in_axis_tready,
  in_axis_tdata,
  in_axis_tlast,
  in_axis_tvalid,
  out1_axis_aclk,
  out1_axis_aresetn,
  out1_axis_tready,
  out1_axis_tdata,
  out1_axis_tlast,
  out1_axis_tvalid,
  out2_axis_aclk,
  out2_axis_aresetn,
  out2_axis_tready,
  out2_axis_tdata,
  out2_axis_tlast,
  out2_axis_tvalid
);

(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME in_axis_aclk, ASSOCIATED_BUSIF in_axis, ASSOCIATED_RESET in_axis_aresetn, FREQ_HZ 100000000, PHASE 0.0, CLK_DOMAIN /clk_wiz_0_clk_out1, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 in_axis_aclk CLK" *)
input wire in_axis_aclk;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME in_axis_aresetn, POLARITY ACTIVE_LOW, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 in_axis_aresetn RST" *)
input wire in_axis_aresetn;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 in_axis TREADY" *)
output wire in_axis_tready;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 in_axis TDATA" *)
input wire [31 : 0] in_axis_tdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 in_axis TLAST" *)
input wire in_axis_tlast;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME in_axis, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 1, FREQ_HZ 100000000, PHASE 0.0, CLK_DOMAIN /clk_wiz_0_clk_out1, LAYERED_METADATA undef, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 in_axis TVALID" *)
input wire in_axis_tvalid;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME out1_axis_aclk, ASSOCIATED_BUSIF out1_axis, ASSOCIATED_RESET out1_axis_aresetn, FREQ_HZ 100000000, PHASE 0.0, CLK_DOMAIN /clk_wiz_0_clk_out1, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 out1_axis_aclk CLK" *)
input wire out1_axis_aclk;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME out1_axis_aresetn, POLARITY ACTIVE_LOW, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 out1_axis_aresetn RST" *)
input wire out1_axis_aresetn;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 out1_axis TREADY" *)
input wire out1_axis_tready;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 out1_axis TDATA" *)
output wire [31 : 0] out1_axis_tdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 out1_axis TLAST" *)
output wire out1_axis_tlast;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME out1_axis, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 1, FREQ_HZ 100000000, PHASE 0.0, CLK_DOMAIN /clk_wiz_0_clk_out1, LAYERED_METADATA undef, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 out1_axis TVALID" *)
output wire out1_axis_tvalid;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME out2_axis_aclk, ASSOCIATED_BUSIF out2_axis, ASSOCIATED_RESET out2_axis_aresetn, FREQ_HZ 100000000, PHASE 0.0, CLK_DOMAIN /clk_wiz_0_clk_out1, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 out2_axis_aclk CLK" *)
input wire out2_axis_aclk;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME out2_axis_aresetn, POLARITY ACTIVE_LOW, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 out2_axis_aresetn RST" *)
input wire out2_axis_aresetn;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 out2_axis TREADY" *)
input wire out2_axis_tready;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 out2_axis TDATA" *)
output wire [31 : 0] out2_axis_tdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 out2_axis TLAST" *)
output wire out2_axis_tlast;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME out2_axis, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 1, FREQ_HZ 100000000, PHASE 0.0, CLK_DOMAIN /clk_wiz_0_clk_out1, LAYERED_METADATA undef, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 out2_axis TVALID" *)
output wire out2_axis_tvalid;

  axis_splitter inst (
    .in_axis_aclk(in_axis_aclk),
    .in_axis_aresetn(in_axis_aresetn),
    .in_axis_tready(in_axis_tready),
    .in_axis_tdata(in_axis_tdata),
    .in_axis_tlast(in_axis_tlast),
    .in_axis_tvalid(in_axis_tvalid),
    .out1_axis_aclk(out1_axis_aclk),
    .out1_axis_aresetn(out1_axis_aresetn),
    .out1_axis_tready(out1_axis_tready),
    .out1_axis_tdata(out1_axis_tdata),
    .out1_axis_tlast(out1_axis_tlast),
    .out1_axis_tvalid(out1_axis_tvalid),
    .out2_axis_aclk(out2_axis_aclk),
    .out2_axis_aresetn(out2_axis_aresetn),
    .out2_axis_tready(out2_axis_tready),
    .out2_axis_tdata(out2_axis_tdata),
    .out2_axis_tlast(out2_axis_tlast),
    .out2_axis_tvalid(out2_axis_tvalid)
  );
endmodule
