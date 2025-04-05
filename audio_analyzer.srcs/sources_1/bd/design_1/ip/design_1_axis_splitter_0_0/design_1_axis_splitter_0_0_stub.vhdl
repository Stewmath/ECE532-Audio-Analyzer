-- Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2018.3 (lin64) Build 2405991 Thu Dec  6 23:36:41 MST 2018
-- Date        : Sun Mar 30 01:53:52 2025
-- Host        : MattsThinkpad running 64-bit unknown
-- Command     : write_vhdl -force -mode synth_stub -rename_top design_1_axis_splitter_0_0 -prefix
--               design_1_axis_splitter_0_0_ design_1_axis_splitter_0_0_stub.vhdl
-- Design      : design_1_axis_splitter_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7a200tsbg484-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity design_1_axis_splitter_0_0 is
  Port ( 
    in_axis_aclk : in STD_LOGIC;
    in_axis_aresetn : in STD_LOGIC;
    in_axis_tready : out STD_LOGIC;
    in_axis_tdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_axis_tlast : in STD_LOGIC;
    in_axis_tvalid : in STD_LOGIC;
    out1_axis_aclk : in STD_LOGIC;
    out1_axis_aresetn : in STD_LOGIC;
    out1_axis_tready : in STD_LOGIC;
    out1_axis_tdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    out1_axis_tlast : out STD_LOGIC;
    out1_axis_tvalid : out STD_LOGIC;
    out2_axis_aclk : in STD_LOGIC;
    out2_axis_aresetn : in STD_LOGIC;
    out2_axis_tready : in STD_LOGIC;
    out2_axis_tdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    out2_axis_tlast : out STD_LOGIC;
    out2_axis_tvalid : out STD_LOGIC
  );

end design_1_axis_splitter_0_0;

architecture stub of design_1_axis_splitter_0_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "in_axis_aclk,in_axis_aresetn,in_axis_tready,in_axis_tdata[31:0],in_axis_tlast,in_axis_tvalid,out1_axis_aclk,out1_axis_aresetn,out1_axis_tready,out1_axis_tdata[31:0],out1_axis_tlast,out1_axis_tvalid,out2_axis_aclk,out2_axis_aresetn,out2_axis_tready,out2_axis_tdata[31:0],out2_axis_tlast,out2_axis_tvalid";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "axis_splitter,Vivado 2018.3";
begin
end;
