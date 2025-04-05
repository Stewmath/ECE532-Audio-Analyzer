-- Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2018.3 (lin64) Build 2405991 Thu Dec  6 23:36:41 MST 2018
-- Date        : Tue Apr  1 15:46:11 2025
-- Host        : MattsThinkpad running 64-bit unknown
-- Command     : write_vhdl -force -mode synth_stub
--               /home/matthew/programs/ut/ece532/audio/audio_analyzer/audio_analyzer.srcs/sources_1/bd/design_1/ip/design_1_pitch_analyzer_video_0_0/design_1_pitch_analyzer_video_0_0_stub.vhdl
-- Design      : design_1_pitch_analyzer_video_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7a200tsbg484-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity design_1_pitch_analyzer_video_0_0 is
  Port ( 
    clk : in STD_LOGIC;
    smpl_axis_aclk : in STD_LOGIC;
    smpl_axis_aresetn : in STD_LOGIC;
    smpl_axis_tready : out STD_LOGIC;
    smpl_axis_tdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    smpl_axis_tvalid : in STD_LOGIC;
    pitch_axis_aclk : in STD_LOGIC;
    pitch_axis_aresetn : in STD_LOGIC;
    pitch_axis_tready : out STD_LOGIC;
    pitch_axis_tdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    pitch_axis_tvalid : in STD_LOGIC;
    S_AXI_ACLK : in STD_LOGIC;
    S_AXI_ARESETN : in STD_LOGIC;
    S_AXI_AWADDR : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_AWVALID : in STD_LOGIC;
    S_AXI_AWREADY : out STD_LOGIC;
    S_AXI_WDATA : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_WSTRB : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_WVALID : in STD_LOGIC;
    S_AXI_WREADY : out STD_LOGIC;
    S_AXI_BRESP : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_BVALID : out STD_LOGIC;
    S_AXI_BREADY : in STD_LOGIC;
    S_AXI_ARADDR : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_ARVALID : in STD_LOGIC;
    S_AXI_ARREADY : out STD_LOGIC;
    S_AXI_RDATA : out STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_RRESP : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_RVALID : out STD_LOGIC;
    S_AXI_RREADY : in STD_LOGIC;
    TMDSp : out STD_LOGIC_VECTOR ( 2 downto 0 );
    TMDSn : out STD_LOGIC_VECTOR ( 2 downto 0 );
    TMDSp_clock : out STD_LOGIC;
    TMDSn_clock : out STD_LOGIC
  );

end design_1_pitch_analyzer_video_0_0;

architecture stub of design_1_pitch_analyzer_video_0_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clk,smpl_axis_aclk,smpl_axis_aresetn,smpl_axis_tready,smpl_axis_tdata[31:0],smpl_axis_tvalid,pitch_axis_aclk,pitch_axis_aresetn,pitch_axis_tready,pitch_axis_tdata[31:0],pitch_axis_tvalid,S_AXI_ACLK,S_AXI_ARESETN,S_AXI_AWADDR[31:0],S_AXI_AWVALID,S_AXI_AWREADY,S_AXI_WDATA[31:0],S_AXI_WSTRB[3:0],S_AXI_WVALID,S_AXI_WREADY,S_AXI_BRESP[1:0],S_AXI_BVALID,S_AXI_BREADY,S_AXI_ARADDR[31:0],S_AXI_ARVALID,S_AXI_ARREADY,S_AXI_RDATA[31:0],S_AXI_RRESP[1:0],S_AXI_RVALID,S_AXI_RREADY,TMDSp[2:0],TMDSn[2:0],TMDSp_clock,TMDSn_clock";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "hdmi_top,Vivado 2018.3";
begin
end;
