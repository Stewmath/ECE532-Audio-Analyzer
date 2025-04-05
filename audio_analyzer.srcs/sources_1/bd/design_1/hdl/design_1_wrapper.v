//Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2018.3 (lin64) Build 2405991 Thu Dec  6 23:36:41 MST 2018
//Date        : Tue Apr  1 15:20:42 2025
//Host        : MattsThinkpad running 64-bit unknown
//Command     : generate_target design_1_wrapper.bd
//Design      : design_1_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module design_1_wrapper
   (GPIO_0_tri_i,
    TMDSn_0,
    TMDSn_clock_0,
    TMDSp_0,
    TMDSp_clock_0,
    ac_adc_sdata,
    ac_bclk,
    ac_dac_sdata,
    ac_lrclk,
    ac_mclk,
    clk_100MHz,
    dip_switches_8bits_tri_i,
    iic_scl_io,
    iic_sda_io,
    led_8bits_tri_o,
    ps2_clk,
    ps2_data,
    reset,
    usb_uart_rxd,
    usb_uart_txd);
  input [4:0]GPIO_0_tri_i;
  output [2:0]TMDSn_0;
  output TMDSn_clock_0;
  output [2:0]TMDSp_0;
  output TMDSp_clock_0;
  input ac_adc_sdata;
  output ac_bclk;
  output ac_dac_sdata;
  output ac_lrclk;
  output ac_mclk;
  input clk_100MHz;
  input [7:0]dip_switches_8bits_tri_i;
  inout iic_scl_io;
  inout iic_sda_io;
  output [7:0]led_8bits_tri_o;
  input ps2_clk;
  input ps2_data;
  input reset;
  input usb_uart_rxd;
  output usb_uart_txd;

  wire [4:0]GPIO_0_tri_i;
  wire [2:0]TMDSn_0;
  wire TMDSn_clock_0;
  wire [2:0]TMDSp_0;
  wire TMDSp_clock_0;
  wire ac_adc_sdata;
  wire ac_bclk;
  wire ac_dac_sdata;
  wire ac_lrclk;
  wire ac_mclk;
  wire clk_100MHz;
  wire [7:0]dip_switches_8bits_tri_i;
  wire iic_scl_i;
  wire iic_scl_io;
  wire iic_scl_o;
  wire iic_scl_t;
  wire iic_sda_i;
  wire iic_sda_io;
  wire iic_sda_o;
  wire iic_sda_t;
  wire [7:0]led_8bits_tri_o;
  wire ps2_clk;
  wire ps2_data;
  wire reset;
  wire usb_uart_rxd;
  wire usb_uart_txd;

  design_1 design_1_i
       (.GPIO_0_tri_i(GPIO_0_tri_i),
        .TMDSn_0(TMDSn_0),
        .TMDSn_clock_0(TMDSn_clock_0),
        .TMDSp_0(TMDSp_0),
        .TMDSp_clock_0(TMDSp_clock_0),
        .ac_adc_sdata(ac_adc_sdata),
        .ac_bclk(ac_bclk),
        .ac_dac_sdata(ac_dac_sdata),
        .ac_lrclk(ac_lrclk),
        .ac_mclk(ac_mclk),
        .clk_100MHz(clk_100MHz),
        .dip_switches_8bits_tri_i(dip_switches_8bits_tri_i),
        .iic_scl_i(iic_scl_i),
        .iic_scl_o(iic_scl_o),
        .iic_scl_t(iic_scl_t),
        .iic_sda_i(iic_sda_i),
        .iic_sda_o(iic_sda_o),
        .iic_sda_t(iic_sda_t),
        .led_8bits_tri_o(led_8bits_tri_o),
        .ps2_clk(ps2_clk),
        .ps2_data(ps2_data),
        .reset(reset),
        .usb_uart_rxd(usb_uart_rxd),
        .usb_uart_txd(usb_uart_txd));
  IOBUF iic_scl_iobuf
       (.I(iic_scl_o),
        .IO(iic_scl_io),
        .O(iic_scl_i),
        .T(iic_scl_t));
  IOBUF iic_sda_iobuf
       (.I(iic_sda_o),
        .IO(iic_sda_io),
        .O(iic_sda_i),
        .T(iic_sda_t));
endmodule
