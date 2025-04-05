-- Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2018.3 (lin64) Build 2405991 Thu Dec  6 23:36:41 MST 2018
-- Date        : Fri Mar 21 18:07:10 2025
-- Host        : MattsThinkpad running 64-bit unknown
-- Command     : write_vhdl -force -mode synth_stub -rename_top design_1_keyboard_ip_0_0 -prefix
--               design_1_keyboard_ip_0_0_ design_1_keyboard_ip_0_0_stub.vhdl
-- Design      : design_1_keyboard_ip_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7a200tsbg484-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity design_1_keyboard_ip_0_0 is
  Port ( 
    clk : in STD_LOGIC;
    PS2Data : in STD_LOGIC;
    PS2Clk : in STD_LOGIC;
    s00_axis_aclk : in STD_LOGIC;
    s00_axis_aresetn : in STD_LOGIC;
    s00_axis_tready : in STD_LOGIC;
    s00_axis_tlast : out STD_LOGIC;
    s00_axis_tdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s00_axis_tvalid : out STD_LOGIC
  );

end design_1_keyboard_ip_0_0;

architecture stub of design_1_keyboard_ip_0_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clk,PS2Data,PS2Clk,s00_axis_aclk,s00_axis_aresetn,s00_axis_tready,s00_axis_tlast,s00_axis_tdata[31:0],s00_axis_tvalid";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "top,Vivado 2018.3";
begin
end;
