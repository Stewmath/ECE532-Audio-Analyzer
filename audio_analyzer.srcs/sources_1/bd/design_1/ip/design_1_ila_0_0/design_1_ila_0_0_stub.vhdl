-- Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2018.3 (lin64) Build 2405991 Thu Dec  6 23:36:41 MST 2018
-- Date        : Thu Mar 13 02:19:07 2025
-- Host        : MattsThinkpad running 64-bit unknown
-- Command     : write_vhdl -force -mode synth_stub -rename_top design_1_ila_0_0 -prefix
--               design_1_ila_0_0_ design_1_ila_0_0_stub.vhdl
-- Design      : design_1_ila_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7a200tsbg484-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity design_1_ila_0_0 is
  Port ( 
    clk : in STD_LOGIC;
    probe0 : in STD_LOGIC_VECTOR ( 5 downto 0 )
  );

end design_1_ila_0_0;

architecture stub of design_1_ila_0_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clk,probe0[5:0]";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "ila,Vivado 2018.3";
begin
end;
