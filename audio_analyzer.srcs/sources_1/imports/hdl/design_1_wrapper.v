//Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2018.3 (win64) Build 2405991 Thu Dec  6 23:38:27 MST 2018
//Date        : Sat Feb 22 23:48:26 2025
//Host        : DANIEL-PC running 64-bit major release  (build 9200)
//Command     : generate_target design_1_wrapper.bd
//Design      : design_1_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module design_1_wrapper
   (TMDSn_0,
    TMDSn_clock_0,
    TMDSp_0,
    TMDSp_clock_0,
    clk_100MHz);
  output [2:0]TMDSn_0;
  output TMDSn_clock_0;
  output [2:0]TMDSp_0;
  output TMDSp_clock_0;
  input clk_100MHz;

  wire [2:0]TMDSn_0;
  wire TMDSn_clock_0;
  wire [2:0]TMDSp_0;
  wire TMDSp_clock_0;
  wire clk_100MHz;

  design_1 design_1_i
       (.TMDSn_0(TMDSn_0),
        .TMDSn_clock_0(TMDSn_clock_0),
        .TMDSp_0(TMDSp_0),
        .TMDSp_clock_0(TMDSp_clock_0),
        .clk_100MHz(clk_100MHz));
endmodule
