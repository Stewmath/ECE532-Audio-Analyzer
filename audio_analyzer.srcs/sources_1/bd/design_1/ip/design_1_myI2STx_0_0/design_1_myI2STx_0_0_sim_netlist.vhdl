-- Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2018.3 (lin64) Build 2405991 Thu Dec  6 23:36:41 MST 2018
-- Date        : Mon Mar 24 14:04:51 2025
-- Host        : MattsThinkpad running 64-bit unknown
-- Command     : write_vhdl -force -mode funcsim -rename_top design_1_myI2STx_0_0 -prefix
--               design_1_myI2STx_0_0_ design_1_myI2STx_0_0_sim_netlist.vhdl
-- Design      : design_1_myI2STx_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7a200tsbg484-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_myI2STx_0_0_myI2STx_v1_0 is
  port (
    lrclk_reg_0 : out STD_LOGIC;
    m00_axis_tdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s00_axis_tready : out STD_LOGIC;
    sdata : out STD_LOGIC;
    m00_axis_tvalid : out STD_LOGIC;
    bclk : out STD_LOGIC;
    s00_axis_aclk : in STD_LOGIC;
    sdata_in : in STD_LOGIC;
    s00_axis_tdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    mclk : in STD_LOGIC;
    s00_axis_tvalid : in STD_LOGIC;
    m00_axis_tready : in STD_LOGIC
  );
end design_1_myI2STx_0_0_myI2STx_v1_0;

architecture STRUCTURE of design_1_myI2STx_0_0_myI2STx_v1_0 is
  signal \FSM_sequential_state[0]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_sequential_state[1]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_sequential_state[2]_i_1_n_0\ : STD_LOGIC;
  signal \^bclk\ : STD_LOGIC;
  signal bclk_i_1_n_0 : STD_LOGIC;
  signal bitcounter : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal \bitcounter[4]_i_2_n_0\ : STD_LOGIC;
  signal \bitcounter_reg_n_0_[0]\ : STD_LOGIC;
  signal \bitcounter_reg_n_0_[1]\ : STD_LOGIC;
  signal \bitcounter_reg_n_0_[2]\ : STD_LOGIC;
  signal \bitcounter_reg_n_0_[3]\ : STD_LOGIC;
  signal \bitcounter_reg_n_0_[4]\ : STD_LOGIC;
  signal \buffer\ : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal bufvalid : STD_LOGIC;
  signal bufvalid_i_1_n_0 : STD_LOGIC;
  signal counter : STD_LOGIC;
  signal \counter[0]_i_1_n_0\ : STD_LOGIC;
  signal halfclk : STD_LOGIC;
  signal halfclk_i_1_n_0 : STD_LOGIC;
  signal left_in_buffer : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal \left_in_buffer[15]_i_1_n_0\ : STD_LOGIC;
  signal lrclk_i_1_n_0 : STD_LOGIC;
  signal \^lrclk_reg_0\ : STD_LOGIC;
  signal \^m00_axis_tvalid\ : STD_LOGIC;
  signal m00_axis_tvalid0_out : STD_LOGIC;
  signal m00_axis_tvalid_i_1_n_0 : STD_LOGIC;
  signal m00_axis_tvalid_i_2_n_0 : STD_LOGIC;
  signal m00_axis_tvalid_i_3_n_0 : STD_LOGIC;
  signal mclkdelay : STD_LOGIC;
  signal p_0_in : STD_LOGIC;
  signal \^s00_axis_tready\ : STD_LOGIC;
  signal s00_axis_tready0 : STD_LOGIC;
  signal s00_axis_tready_i_1_n_0 : STD_LOGIC;
  signal sdata3_out : STD_LOGIC;
  signal sdata_i_2_n_0 : STD_LOGIC;
  signal shiftreg_in : STD_LOGIC_VECTOR ( 30 downto 15 );
  signal \shiftreg_in[30]_i_1_n_0\ : STD_LOGIC;
  signal \shiftreg_in_reg[14]_srl14_n_0\ : STD_LOGIC;
  signal \shiftreg_in_reg_n_0_[0]\ : STD_LOGIC;
  signal shiftreg_out : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal \shiftreg_out[15]_i_1_n_0\ : STD_LOGIC;
  signal \shiftreg_out_reg_n_0_[0]\ : STD_LOGIC;
  signal \shiftreg_out_reg_n_0_[10]\ : STD_LOGIC;
  signal \shiftreg_out_reg_n_0_[11]\ : STD_LOGIC;
  signal \shiftreg_out_reg_n_0_[12]\ : STD_LOGIC;
  signal \shiftreg_out_reg_n_0_[13]\ : STD_LOGIC;
  signal \shiftreg_out_reg_n_0_[14]\ : STD_LOGIC;
  signal \shiftreg_out_reg_n_0_[1]\ : STD_LOGIC;
  signal \shiftreg_out_reg_n_0_[2]\ : STD_LOGIC;
  signal \shiftreg_out_reg_n_0_[3]\ : STD_LOGIC;
  signal \shiftreg_out_reg_n_0_[4]\ : STD_LOGIC;
  signal \shiftreg_out_reg_n_0_[5]\ : STD_LOGIC;
  signal \shiftreg_out_reg_n_0_[6]\ : STD_LOGIC;
  signal \shiftreg_out_reg_n_0_[7]\ : STD_LOGIC;
  signal \shiftreg_out_reg_n_0_[8]\ : STD_LOGIC;
  signal \shiftreg_out_reg_n_0_[9]\ : STD_LOGIC;
  signal state : STD_LOGIC_VECTOR ( 2 downto 0 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \FSM_sequential_state[0]_i_1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \FSM_sequential_state[1]_i_1\ : label is "soft_lutpair0";
  attribute FSM_ENCODED_STATES : string;
  attribute FSM_ENCODED_STATES of \FSM_sequential_state_reg[0]\ : label is "S1:001,S3:011,S2:010,S0:000,S4:100";
  attribute FSM_ENCODED_STATES of \FSM_sequential_state_reg[1]\ : label is "S1:001,S3:011,S2:010,S0:000,S4:100";
  attribute FSM_ENCODED_STATES of \FSM_sequential_state_reg[2]\ : label is "S1:001,S3:011,S2:010,S0:000,S4:100";
  attribute SOFT_HLUTNM of \bitcounter[0]_i_1\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \bitcounter[1]_i_1\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \bitcounter[2]_i_1\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \bitcounter[4]_i_2\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \counter[0]_i_1\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of halfclk_i_1 : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of lrclk_i_1 : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of m00_axis_tvalid_i_3 : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of sdata_i_2 : label is "soft_lutpair5";
  attribute srl_bus_name : string;
  attribute srl_bus_name of \shiftreg_in_reg[14]_srl14\ : label is "\inst/shiftreg_in_reg ";
  attribute srl_name : string;
  attribute srl_name of \shiftreg_in_reg[14]_srl14\ : label is "\inst/shiftreg_in_reg[14]_srl14 ";
  attribute SOFT_HLUTNM of \shiftreg_out[0]_i_1\ : label is "soft_lutpair1";
begin
  bclk <= \^bclk\;
  lrclk_reg_0 <= \^lrclk_reg_0\;
  m00_axis_tvalid <= \^m00_axis_tvalid\;
  s00_axis_tready <= \^s00_axis_tready\;
\FSM_sequential_state[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0F70"
    )
        port map (
      I0 => state(2),
      I1 => state(1),
      I2 => halfclk,
      I3 => state(0),
      O => \FSM_sequential_state[0]_i_1_n_0\
    );
\FSM_sequential_state[1]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0BFF0C00"
    )
        port map (
      I0 => m00_axis_tvalid_i_2_n_0,
      I1 => state(0),
      I2 => state(2),
      I3 => halfclk,
      I4 => state(1),
      O => \FSM_sequential_state[1]_i_1_n_0\
    );
\FSM_sequential_state[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000FFFF00400000"
    )
        port map (
      I0 => \^lrclk_reg_0\,
      I1 => state(1),
      I2 => state(0),
      I3 => m00_axis_tvalid_i_2_n_0,
      I4 => halfclk,
      I5 => state(2),
      O => \FSM_sequential_state[2]_i_1_n_0\
    );
\FSM_sequential_state_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axis_aclk,
      CE => '1',
      D => \FSM_sequential_state[0]_i_1_n_0\,
      Q => state(0),
      R => '0'
    );
\FSM_sequential_state_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axis_aclk,
      CE => '1',
      D => \FSM_sequential_state[1]_i_1_n_0\,
      Q => state(1),
      R => '0'
    );
\FSM_sequential_state_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axis_aclk,
      CE => '1',
      D => \FSM_sequential_state[2]_i_1_n_0\,
      Q => state(2),
      R => '0'
    );
bclk_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"ECFF4400"
    )
        port map (
      I0 => state(2),
      I1 => state(0),
      I2 => state(1),
      I3 => halfclk,
      I4 => \^bclk\,
      O => bclk_i_1_n_0
    );
bclk_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => s00_axis_aclk,
      CE => '1',
      D => bclk_i_1_n_0,
      Q => \^bclk\,
      R => '0'
    );
\bitcounter[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"04"
    )
        port map (
      I0 => state(2),
      I1 => state(1),
      I2 => \bitcounter_reg_n_0_[0]\,
      O => bitcounter(0)
    );
\bitcounter[1]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0220"
    )
        port map (
      I0 => state(1),
      I1 => state(2),
      I2 => \bitcounter_reg_n_0_[0]\,
      I3 => \bitcounter_reg_n_0_[1]\,
      O => bitcounter(1)
    );
\bitcounter[2]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"07000800"
    )
        port map (
      I0 => \bitcounter_reg_n_0_[0]\,
      I1 => \bitcounter_reg_n_0_[1]\,
      I2 => state(2),
      I3 => state(1),
      I4 => \bitcounter_reg_n_0_[2]\,
      O => bitcounter(2)
    );
\bitcounter[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"007F000000800000"
    )
        port map (
      I0 => \bitcounter_reg_n_0_[1]\,
      I1 => \bitcounter_reg_n_0_[0]\,
      I2 => \bitcounter_reg_n_0_[2]\,
      I3 => state(2),
      I4 => state(1),
      I5 => \bitcounter_reg_n_0_[3]\,
      O => bitcounter(3)
    );
\bitcounter[4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFF000080000000"
    )
        port map (
      I0 => \bitcounter_reg_n_0_[2]\,
      I1 => \bitcounter_reg_n_0_[0]\,
      I2 => \bitcounter_reg_n_0_[1]\,
      I3 => \bitcounter_reg_n_0_[3]\,
      I4 => \bitcounter[4]_i_2_n_0\,
      I5 => \bitcounter_reg_n_0_[4]\,
      O => bitcounter(4)
    );
\bitcounter[4]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => state(1),
      I1 => state(2),
      O => \bitcounter[4]_i_2_n_0\
    );
\bitcounter_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axis_aclk,
      CE => sdata3_out,
      D => bitcounter(0),
      Q => \bitcounter_reg_n_0_[0]\,
      R => '0'
    );
\bitcounter_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axis_aclk,
      CE => sdata3_out,
      D => bitcounter(1),
      Q => \bitcounter_reg_n_0_[1]\,
      R => '0'
    );
\bitcounter_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axis_aclk,
      CE => sdata3_out,
      D => bitcounter(2),
      Q => \bitcounter_reg_n_0_[2]\,
      R => '0'
    );
\bitcounter_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axis_aclk,
      CE => sdata3_out,
      D => bitcounter(3),
      Q => \bitcounter_reg_n_0_[3]\,
      R => '0'
    );
\bitcounter_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axis_aclk,
      CE => sdata3_out,
      D => bitcounter(4),
      Q => \bitcounter_reg_n_0_[4]\,
      R => '0'
    );
\buffer[31]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"40"
    )
        port map (
      I0 => bufvalid,
      I1 => s00_axis_tvalid,
      I2 => \^s00_axis_tready\,
      O => s00_axis_tready0
    );
\buffer_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axis_aclk,
      CE => s00_axis_tready0,
      D => s00_axis_tdata(0),
      Q => \buffer\(0),
      R => '0'
    );
\buffer_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axis_aclk,
      CE => s00_axis_tready0,
      D => s00_axis_tdata(10),
      Q => \buffer\(10),
      R => '0'
    );
\buffer_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axis_aclk,
      CE => s00_axis_tready0,
      D => s00_axis_tdata(11),
      Q => \buffer\(11),
      R => '0'
    );
\buffer_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axis_aclk,
      CE => s00_axis_tready0,
      D => s00_axis_tdata(12),
      Q => \buffer\(12),
      R => '0'
    );
\buffer_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axis_aclk,
      CE => s00_axis_tready0,
      D => s00_axis_tdata(13),
      Q => \buffer\(13),
      R => '0'
    );
\buffer_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axis_aclk,
      CE => s00_axis_tready0,
      D => s00_axis_tdata(14),
      Q => \buffer\(14),
      R => '0'
    );
\buffer_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axis_aclk,
      CE => s00_axis_tready0,
      D => s00_axis_tdata(15),
      Q => \buffer\(15),
      R => '0'
    );
\buffer_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axis_aclk,
      CE => s00_axis_tready0,
      D => s00_axis_tdata(16),
      Q => \buffer\(16),
      R => '0'
    );
\buffer_reg[17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axis_aclk,
      CE => s00_axis_tready0,
      D => s00_axis_tdata(17),
      Q => \buffer\(17),
      R => '0'
    );
\buffer_reg[18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axis_aclk,
      CE => s00_axis_tready0,
      D => s00_axis_tdata(18),
      Q => \buffer\(18),
      R => '0'
    );
\buffer_reg[19]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axis_aclk,
      CE => s00_axis_tready0,
      D => s00_axis_tdata(19),
      Q => \buffer\(19),
      R => '0'
    );
\buffer_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axis_aclk,
      CE => s00_axis_tready0,
      D => s00_axis_tdata(1),
      Q => \buffer\(1),
      R => '0'
    );
\buffer_reg[20]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axis_aclk,
      CE => s00_axis_tready0,
      D => s00_axis_tdata(20),
      Q => \buffer\(20),
      R => '0'
    );
\buffer_reg[21]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axis_aclk,
      CE => s00_axis_tready0,
      D => s00_axis_tdata(21),
      Q => \buffer\(21),
      R => '0'
    );
\buffer_reg[22]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axis_aclk,
      CE => s00_axis_tready0,
      D => s00_axis_tdata(22),
      Q => \buffer\(22),
      R => '0'
    );
\buffer_reg[23]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axis_aclk,
      CE => s00_axis_tready0,
      D => s00_axis_tdata(23),
      Q => \buffer\(23),
      R => '0'
    );
\buffer_reg[24]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axis_aclk,
      CE => s00_axis_tready0,
      D => s00_axis_tdata(24),
      Q => \buffer\(24),
      R => '0'
    );
\buffer_reg[25]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axis_aclk,
      CE => s00_axis_tready0,
      D => s00_axis_tdata(25),
      Q => \buffer\(25),
      R => '0'
    );
\buffer_reg[26]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axis_aclk,
      CE => s00_axis_tready0,
      D => s00_axis_tdata(26),
      Q => \buffer\(26),
      R => '0'
    );
\buffer_reg[27]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axis_aclk,
      CE => s00_axis_tready0,
      D => s00_axis_tdata(27),
      Q => \buffer\(27),
      R => '0'
    );
\buffer_reg[28]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axis_aclk,
      CE => s00_axis_tready0,
      D => s00_axis_tdata(28),
      Q => \buffer\(28),
      R => '0'
    );
\buffer_reg[29]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axis_aclk,
      CE => s00_axis_tready0,
      D => s00_axis_tdata(29),
      Q => \buffer\(29),
      R => '0'
    );
\buffer_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axis_aclk,
      CE => s00_axis_tready0,
      D => s00_axis_tdata(2),
      Q => \buffer\(2),
      R => '0'
    );
\buffer_reg[30]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axis_aclk,
      CE => s00_axis_tready0,
      D => s00_axis_tdata(30),
      Q => \buffer\(30),
      R => '0'
    );
\buffer_reg[31]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axis_aclk,
      CE => s00_axis_tready0,
      D => s00_axis_tdata(31),
      Q => \buffer\(31),
      R => '0'
    );
\buffer_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axis_aclk,
      CE => s00_axis_tready0,
      D => s00_axis_tdata(3),
      Q => \buffer\(3),
      R => '0'
    );
\buffer_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axis_aclk,
      CE => s00_axis_tready0,
      D => s00_axis_tdata(4),
      Q => \buffer\(4),
      R => '0'
    );
\buffer_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axis_aclk,
      CE => s00_axis_tready0,
      D => s00_axis_tdata(5),
      Q => \buffer\(5),
      R => '0'
    );
\buffer_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axis_aclk,
      CE => s00_axis_tready0,
      D => s00_axis_tdata(6),
      Q => \buffer\(6),
      R => '0'
    );
\buffer_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axis_aclk,
      CE => s00_axis_tready0,
      D => s00_axis_tdata(7),
      Q => \buffer\(7),
      R => '0'
    );
\buffer_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axis_aclk,
      CE => s00_axis_tready0,
      D => s00_axis_tdata(8),
      Q => \buffer\(8),
      R => '0'
    );
\buffer_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axis_aclk,
      CE => s00_axis_tready0,
      D => s00_axis_tdata(9),
      Q => \buffer\(9),
      R => '0'
    );
bufvalid_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFCFF02AAA8AA"
    )
        port map (
      I0 => s00_axis_tready0,
      I1 => state(0),
      I2 => state(1),
      I3 => halfclk,
      I4 => state(2),
      I5 => bufvalid,
      O => bufvalid_i_1_n_0
    );
bufvalid_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axis_aclk,
      CE => '1',
      D => bufvalid_i_1_n_0,
      Q => bufvalid,
      R => '0'
    );
\counter[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B4"
    )
        port map (
      I0 => mclkdelay,
      I1 => mclk,
      I2 => counter,
      O => \counter[0]_i_1_n_0\
    );
\counter_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axis_aclk,
      CE => '1',
      D => \counter[0]_i_1_n_0\,
      Q => counter,
      R => '0'
    );
halfclk_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00B0"
    )
        port map (
      I0 => halfclk,
      I1 => counter,
      I2 => mclk,
      I3 => mclkdelay,
      O => halfclk_i_1_n_0
    );
halfclk_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axis_aclk,
      CE => '1',
      D => halfclk_i_1_n_0,
      Q => halfclk,
      R => '0'
    );
\left_in_buffer[15]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000400000"
    )
        port map (
      I0 => m00_axis_tvalid_i_2_n_0,
      I1 => state(0),
      I2 => state(1),
      I3 => state(2),
      I4 => halfclk,
      I5 => \^lrclk_reg_0\,
      O => \left_in_buffer[15]_i_1_n_0\
    );
\left_in_buffer_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axis_aclk,
      CE => \left_in_buffer[15]_i_1_n_0\,
      D => shiftreg_in(15),
      Q => left_in_buffer(0),
      R => '0'
    );
\left_in_buffer_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axis_aclk,
      CE => \left_in_buffer[15]_i_1_n_0\,
      D => shiftreg_in(25),
      Q => left_in_buffer(10),
      R => '0'
    );
\left_in_buffer_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axis_aclk,
      CE => \left_in_buffer[15]_i_1_n_0\,
      D => shiftreg_in(26),
      Q => left_in_buffer(11),
      R => '0'
    );
\left_in_buffer_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axis_aclk,
      CE => \left_in_buffer[15]_i_1_n_0\,
      D => shiftreg_in(27),
      Q => left_in_buffer(12),
      R => '0'
    );
\left_in_buffer_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axis_aclk,
      CE => \left_in_buffer[15]_i_1_n_0\,
      D => shiftreg_in(28),
      Q => left_in_buffer(13),
      R => '0'
    );
\left_in_buffer_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axis_aclk,
      CE => \left_in_buffer[15]_i_1_n_0\,
      D => shiftreg_in(29),
      Q => left_in_buffer(14),
      R => '0'
    );
\left_in_buffer_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axis_aclk,
      CE => \left_in_buffer[15]_i_1_n_0\,
      D => shiftreg_in(30),
      Q => left_in_buffer(15),
      R => '0'
    );
\left_in_buffer_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axis_aclk,
      CE => \left_in_buffer[15]_i_1_n_0\,
      D => shiftreg_in(16),
      Q => left_in_buffer(1),
      R => '0'
    );
\left_in_buffer_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axis_aclk,
      CE => \left_in_buffer[15]_i_1_n_0\,
      D => shiftreg_in(17),
      Q => left_in_buffer(2),
      R => '0'
    );
\left_in_buffer_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axis_aclk,
      CE => \left_in_buffer[15]_i_1_n_0\,
      D => shiftreg_in(18),
      Q => left_in_buffer(3),
      R => '0'
    );
\left_in_buffer_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axis_aclk,
      CE => \left_in_buffer[15]_i_1_n_0\,
      D => shiftreg_in(19),
      Q => left_in_buffer(4),
      R => '0'
    );
\left_in_buffer_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axis_aclk,
      CE => \left_in_buffer[15]_i_1_n_0\,
      D => shiftreg_in(20),
      Q => left_in_buffer(5),
      R => '0'
    );
\left_in_buffer_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axis_aclk,
      CE => \left_in_buffer[15]_i_1_n_0\,
      D => shiftreg_in(21),
      Q => left_in_buffer(6),
      R => '0'
    );
\left_in_buffer_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axis_aclk,
      CE => \left_in_buffer[15]_i_1_n_0\,
      D => shiftreg_in(22),
      Q => left_in_buffer(7),
      R => '0'
    );
\left_in_buffer_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axis_aclk,
      CE => \left_in_buffer[15]_i_1_n_0\,
      D => shiftreg_in(23),
      Q => left_in_buffer(8),
      R => '0'
    );
\left_in_buffer_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axis_aclk,
      CE => \left_in_buffer[15]_i_1_n_0\,
      D => shiftreg_in(24),
      Q => left_in_buffer(9),
      R => '0'
    );
lrclk_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FEFF0200"
    )
        port map (
      I0 => state(2),
      I1 => state(1),
      I2 => state(0),
      I3 => halfclk,
      I4 => \^lrclk_reg_0\,
      O => lrclk_i_1_n_0
    );
lrclk_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => s00_axis_aclk,
      CE => '1',
      D => lrclk_i_1_n_0,
      Q => \^lrclk_reg_0\,
      R => '0'
    );
\m00_axis_tdata[31]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0040000000000000"
    )
        port map (
      I0 => m00_axis_tvalid_i_2_n_0,
      I1 => state(0),
      I2 => state(1),
      I3 => state(2),
      I4 => halfclk,
      I5 => \^lrclk_reg_0\,
      O => m00_axis_tvalid0_out
    );
\m00_axis_tdata_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axis_aclk,
      CE => m00_axis_tvalid0_out,
      D => shiftreg_in(15),
      Q => m00_axis_tdata(0),
      R => '0'
    );
\m00_axis_tdata_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axis_aclk,
      CE => m00_axis_tvalid0_out,
      D => shiftreg_in(25),
      Q => m00_axis_tdata(10),
      R => '0'
    );
\m00_axis_tdata_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axis_aclk,
      CE => m00_axis_tvalid0_out,
      D => shiftreg_in(26),
      Q => m00_axis_tdata(11),
      R => '0'
    );
\m00_axis_tdata_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axis_aclk,
      CE => m00_axis_tvalid0_out,
      D => shiftreg_in(27),
      Q => m00_axis_tdata(12),
      R => '0'
    );
\m00_axis_tdata_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axis_aclk,
      CE => m00_axis_tvalid0_out,
      D => shiftreg_in(28),
      Q => m00_axis_tdata(13),
      R => '0'
    );
\m00_axis_tdata_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axis_aclk,
      CE => m00_axis_tvalid0_out,
      D => shiftreg_in(29),
      Q => m00_axis_tdata(14),
      R => '0'
    );
\m00_axis_tdata_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axis_aclk,
      CE => m00_axis_tvalid0_out,
      D => shiftreg_in(30),
      Q => m00_axis_tdata(15),
      R => '0'
    );
\m00_axis_tdata_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axis_aclk,
      CE => m00_axis_tvalid0_out,
      D => left_in_buffer(0),
      Q => m00_axis_tdata(16),
      R => '0'
    );
\m00_axis_tdata_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axis_aclk,
      CE => m00_axis_tvalid0_out,
      D => left_in_buffer(1),
      Q => m00_axis_tdata(17),
      R => '0'
    );
\m00_axis_tdata_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axis_aclk,
      CE => m00_axis_tvalid0_out,
      D => left_in_buffer(2),
      Q => m00_axis_tdata(18),
      R => '0'
    );
\m00_axis_tdata_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axis_aclk,
      CE => m00_axis_tvalid0_out,
      D => left_in_buffer(3),
      Q => m00_axis_tdata(19),
      R => '0'
    );
\m00_axis_tdata_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axis_aclk,
      CE => m00_axis_tvalid0_out,
      D => shiftreg_in(16),
      Q => m00_axis_tdata(1),
      R => '0'
    );
\m00_axis_tdata_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axis_aclk,
      CE => m00_axis_tvalid0_out,
      D => left_in_buffer(4),
      Q => m00_axis_tdata(20),
      R => '0'
    );
\m00_axis_tdata_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axis_aclk,
      CE => m00_axis_tvalid0_out,
      D => left_in_buffer(5),
      Q => m00_axis_tdata(21),
      R => '0'
    );
\m00_axis_tdata_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axis_aclk,
      CE => m00_axis_tvalid0_out,
      D => left_in_buffer(6),
      Q => m00_axis_tdata(22),
      R => '0'
    );
\m00_axis_tdata_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axis_aclk,
      CE => m00_axis_tvalid0_out,
      D => left_in_buffer(7),
      Q => m00_axis_tdata(23),
      R => '0'
    );
\m00_axis_tdata_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axis_aclk,
      CE => m00_axis_tvalid0_out,
      D => left_in_buffer(8),
      Q => m00_axis_tdata(24),
      R => '0'
    );
\m00_axis_tdata_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axis_aclk,
      CE => m00_axis_tvalid0_out,
      D => left_in_buffer(9),
      Q => m00_axis_tdata(25),
      R => '0'
    );
\m00_axis_tdata_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axis_aclk,
      CE => m00_axis_tvalid0_out,
      D => left_in_buffer(10),
      Q => m00_axis_tdata(26),
      R => '0'
    );
\m00_axis_tdata_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axis_aclk,
      CE => m00_axis_tvalid0_out,
      D => left_in_buffer(11),
      Q => m00_axis_tdata(27),
      R => '0'
    );
\m00_axis_tdata_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axis_aclk,
      CE => m00_axis_tvalid0_out,
      D => left_in_buffer(12),
      Q => m00_axis_tdata(28),
      R => '0'
    );
\m00_axis_tdata_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axis_aclk,
      CE => m00_axis_tvalid0_out,
      D => left_in_buffer(13),
      Q => m00_axis_tdata(29),
      R => '0'
    );
\m00_axis_tdata_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axis_aclk,
      CE => m00_axis_tvalid0_out,
      D => shiftreg_in(17),
      Q => m00_axis_tdata(2),
      R => '0'
    );
\m00_axis_tdata_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axis_aclk,
      CE => m00_axis_tvalid0_out,
      D => left_in_buffer(14),
      Q => m00_axis_tdata(30),
      R => '0'
    );
\m00_axis_tdata_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axis_aclk,
      CE => m00_axis_tvalid0_out,
      D => left_in_buffer(15),
      Q => m00_axis_tdata(31),
      R => '0'
    );
\m00_axis_tdata_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axis_aclk,
      CE => m00_axis_tvalid0_out,
      D => shiftreg_in(18),
      Q => m00_axis_tdata(3),
      R => '0'
    );
\m00_axis_tdata_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axis_aclk,
      CE => m00_axis_tvalid0_out,
      D => shiftreg_in(19),
      Q => m00_axis_tdata(4),
      R => '0'
    );
\m00_axis_tdata_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axis_aclk,
      CE => m00_axis_tvalid0_out,
      D => shiftreg_in(20),
      Q => m00_axis_tdata(5),
      R => '0'
    );
\m00_axis_tdata_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axis_aclk,
      CE => m00_axis_tvalid0_out,
      D => shiftreg_in(21),
      Q => m00_axis_tdata(6),
      R => '0'
    );
\m00_axis_tdata_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axis_aclk,
      CE => m00_axis_tvalid0_out,
      D => shiftreg_in(22),
      Q => m00_axis_tdata(7),
      R => '0'
    );
\m00_axis_tdata_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axis_aclk,
      CE => m00_axis_tvalid0_out,
      D => shiftreg_in(23),
      Q => m00_axis_tdata(8),
      R => '0'
    );
\m00_axis_tdata_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axis_aclk,
      CE => m00_axis_tvalid0_out,
      D => shiftreg_in(24),
      Q => m00_axis_tdata(9),
      R => '0'
    );
m00_axis_tvalid_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"08FF0808FFFF0808"
    )
        port map (
      I0 => \^lrclk_reg_0\,
      I1 => \shiftreg_in[30]_i_1_n_0\,
      I2 => m00_axis_tvalid_i_2_n_0,
      I3 => m00_axis_tvalid_i_3_n_0,
      I4 => \^m00_axis_tvalid\,
      I5 => m00_axis_tready,
      O => m00_axis_tvalid_i_1_n_0
    );
m00_axis_tvalid_i_2: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7FFFFFFF"
    )
        port map (
      I0 => \bitcounter_reg_n_0_[3]\,
      I1 => \bitcounter_reg_n_0_[1]\,
      I2 => \bitcounter_reg_n_0_[0]\,
      I3 => \bitcounter_reg_n_0_[2]\,
      I4 => \bitcounter_reg_n_0_[4]\,
      O => m00_axis_tvalid_i_2_n_0
    );
m00_axis_tvalid_i_3: unisim.vcomponents.LUT4
    generic map(
      INIT => X"57FF"
    )
        port map (
      I0 => state(2),
      I1 => state(0),
      I2 => state(1),
      I3 => halfclk,
      O => m00_axis_tvalid_i_3_n_0
    );
m00_axis_tvalid_reg: unisim.vcomponents.FDRE
     port map (
      C => s00_axis_aclk,
      CE => '1',
      D => m00_axis_tvalid_i_1_n_0,
      Q => \^m00_axis_tvalid\,
      R => '0'
    );
mclkdelay_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axis_aclk,
      CE => '1',
      D => mclk,
      Q => mclkdelay,
      R => '0'
    );
s00_axis_tready_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B5"
    )
        port map (
      I0 => bufvalid,
      I1 => s00_axis_tvalid,
      I2 => \^s00_axis_tready\,
      O => s00_axis_tready_i_1_n_0
    );
s00_axis_tready_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axis_aclk,
      CE => '1',
      D => s00_axis_tready_i_1_n_0,
      Q => \^s00_axis_tready\,
      R => '0'
    );
sdata_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"1500"
    )
        port map (
      I0 => state(0),
      I1 => state(1),
      I2 => state(2),
      I3 => halfclk,
      O => sdata3_out
    );
sdata_i_2: unisim.vcomponents.LUT3
    generic map(
      INIT => X"40"
    )
        port map (
      I0 => state(2),
      I1 => state(1),
      I2 => p_0_in,
      O => sdata_i_2_n_0
    );
sdata_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axis_aclk,
      CE => sdata3_out,
      D => sdata_i_2_n_0,
      Q => sdata,
      R => '0'
    );
\shiftreg_in[30]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0800"
    )
        port map (
      I0 => state(0),
      I1 => state(1),
      I2 => state(2),
      I3 => halfclk,
      O => \shiftreg_in[30]_i_1_n_0\
    );
\shiftreg_in_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axis_aclk,
      CE => \shiftreg_in[30]_i_1_n_0\,
      D => sdata_in,
      Q => \shiftreg_in_reg_n_0_[0]\,
      R => '0'
    );
\shiftreg_in_reg[14]_srl14\: unisim.vcomponents.SRL16E
    generic map(
      INIT => X"0000"
    )
        port map (
      A0 => '1',
      A1 => '0',
      A2 => '1',
      A3 => '1',
      CE => \shiftreg_in[30]_i_1_n_0\,
      CLK => s00_axis_aclk,
      D => \shiftreg_in_reg_n_0_[0]\,
      Q => \shiftreg_in_reg[14]_srl14_n_0\
    );
\shiftreg_in_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axis_aclk,
      CE => \shiftreg_in[30]_i_1_n_0\,
      D => \shiftreg_in_reg[14]_srl14_n_0\,
      Q => shiftreg_in(15),
      R => '0'
    );
\shiftreg_in_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axis_aclk,
      CE => \shiftreg_in[30]_i_1_n_0\,
      D => shiftreg_in(15),
      Q => shiftreg_in(16),
      R => '0'
    );
\shiftreg_in_reg[17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axis_aclk,
      CE => \shiftreg_in[30]_i_1_n_0\,
      D => shiftreg_in(16),
      Q => shiftreg_in(17),
      R => '0'
    );
\shiftreg_in_reg[18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axis_aclk,
      CE => \shiftreg_in[30]_i_1_n_0\,
      D => shiftreg_in(17),
      Q => shiftreg_in(18),
      R => '0'
    );
\shiftreg_in_reg[19]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axis_aclk,
      CE => \shiftreg_in[30]_i_1_n_0\,
      D => shiftreg_in(18),
      Q => shiftreg_in(19),
      R => '0'
    );
\shiftreg_in_reg[20]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axis_aclk,
      CE => \shiftreg_in[30]_i_1_n_0\,
      D => shiftreg_in(19),
      Q => shiftreg_in(20),
      R => '0'
    );
\shiftreg_in_reg[21]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axis_aclk,
      CE => \shiftreg_in[30]_i_1_n_0\,
      D => shiftreg_in(20),
      Q => shiftreg_in(21),
      R => '0'
    );
\shiftreg_in_reg[22]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axis_aclk,
      CE => \shiftreg_in[30]_i_1_n_0\,
      D => shiftreg_in(21),
      Q => shiftreg_in(22),
      R => '0'
    );
\shiftreg_in_reg[23]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axis_aclk,
      CE => \shiftreg_in[30]_i_1_n_0\,
      D => shiftreg_in(22),
      Q => shiftreg_in(23),
      R => '0'
    );
\shiftreg_in_reg[24]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axis_aclk,
      CE => \shiftreg_in[30]_i_1_n_0\,
      D => shiftreg_in(23),
      Q => shiftreg_in(24),
      R => '0'
    );
\shiftreg_in_reg[25]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axis_aclk,
      CE => \shiftreg_in[30]_i_1_n_0\,
      D => shiftreg_in(24),
      Q => shiftreg_in(25),
      R => '0'
    );
\shiftreg_in_reg[26]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axis_aclk,
      CE => \shiftreg_in[30]_i_1_n_0\,
      D => shiftreg_in(25),
      Q => shiftreg_in(26),
      R => '0'
    );
\shiftreg_in_reg[27]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axis_aclk,
      CE => \shiftreg_in[30]_i_1_n_0\,
      D => shiftreg_in(26),
      Q => shiftreg_in(27),
      R => '0'
    );
\shiftreg_in_reg[28]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axis_aclk,
      CE => \shiftreg_in[30]_i_1_n_0\,
      D => shiftreg_in(27),
      Q => shiftreg_in(28),
      R => '0'
    );
\shiftreg_in_reg[29]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axis_aclk,
      CE => \shiftreg_in[30]_i_1_n_0\,
      D => shiftreg_in(28),
      Q => shiftreg_in(29),
      R => '0'
    );
\shiftreg_in_reg[30]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axis_aclk,
      CE => \shiftreg_in[30]_i_1_n_0\,
      D => shiftreg_in(29),
      Q => shiftreg_in(30),
      R => '0'
    );
\shiftreg_out[0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"02020300"
    )
        port map (
      I0 => \buffer\(0),
      I1 => state(0),
      I2 => state(1),
      I3 => \buffer\(16),
      I4 => state(2),
      O => shiftreg_out(0)
    );
\shiftreg_out[10]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000000F0CCAACCAA"
    )
        port map (
      I0 => \buffer\(26),
      I1 => \shiftreg_out_reg_n_0_[9]\,
      I2 => \buffer\(10),
      I3 => state(1),
      I4 => state(0),
      I5 => state(2),
      O => shiftreg_out(10)
    );
\shiftreg_out[11]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000000F0CCAACCAA"
    )
        port map (
      I0 => \buffer\(27),
      I1 => \shiftreg_out_reg_n_0_[10]\,
      I2 => \buffer\(11),
      I3 => state(1),
      I4 => state(0),
      I5 => state(2),
      O => shiftreg_out(11)
    );
\shiftreg_out[12]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000000F0CCAACCAA"
    )
        port map (
      I0 => \buffer\(28),
      I1 => \shiftreg_out_reg_n_0_[11]\,
      I2 => \buffer\(12),
      I3 => state(1),
      I4 => state(0),
      I5 => state(2),
      O => shiftreg_out(12)
    );
\shiftreg_out[13]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000000F0CCAACCAA"
    )
        port map (
      I0 => \buffer\(29),
      I1 => \shiftreg_out_reg_n_0_[12]\,
      I2 => \buffer\(13),
      I3 => state(1),
      I4 => state(0),
      I5 => state(2),
      O => shiftreg_out(13)
    );
\shiftreg_out[14]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000000F0CCAACCAA"
    )
        port map (
      I0 => \buffer\(30),
      I1 => \shiftreg_out_reg_n_0_[13]\,
      I2 => \buffer\(14),
      I3 => state(1),
      I4 => state(0),
      I5 => state(2),
      O => shiftreg_out(14)
    );
\shiftreg_out[15]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"200A"
    )
        port map (
      I0 => halfclk,
      I1 => state(2),
      I2 => state(1),
      I3 => state(0),
      O => \shiftreg_out[15]_i_1_n_0\
    );
\shiftreg_out[15]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000000F0CCAACCAA"
    )
        port map (
      I0 => \buffer\(31),
      I1 => \shiftreg_out_reg_n_0_[14]\,
      I2 => \buffer\(15),
      I3 => state(1),
      I4 => state(0),
      I5 => state(2),
      O => shiftreg_out(15)
    );
\shiftreg_out[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000000F0CCAACCAA"
    )
        port map (
      I0 => \buffer\(17),
      I1 => \shiftreg_out_reg_n_0_[0]\,
      I2 => \buffer\(1),
      I3 => state(1),
      I4 => state(0),
      I5 => state(2),
      O => shiftreg_out(1)
    );
\shiftreg_out[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000000F0CCAACCAA"
    )
        port map (
      I0 => \buffer\(18),
      I1 => \shiftreg_out_reg_n_0_[1]\,
      I2 => \buffer\(2),
      I3 => state(1),
      I4 => state(0),
      I5 => state(2),
      O => shiftreg_out(2)
    );
\shiftreg_out[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000000F0CCAACCAA"
    )
        port map (
      I0 => \buffer\(19),
      I1 => \shiftreg_out_reg_n_0_[2]\,
      I2 => \buffer\(3),
      I3 => state(1),
      I4 => state(0),
      I5 => state(2),
      O => shiftreg_out(3)
    );
\shiftreg_out[4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000000F0CCAACCAA"
    )
        port map (
      I0 => \buffer\(20),
      I1 => \shiftreg_out_reg_n_0_[3]\,
      I2 => \buffer\(4),
      I3 => state(1),
      I4 => state(0),
      I5 => state(2),
      O => shiftreg_out(4)
    );
\shiftreg_out[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000000F0CCAACCAA"
    )
        port map (
      I0 => \buffer\(21),
      I1 => \shiftreg_out_reg_n_0_[4]\,
      I2 => \buffer\(5),
      I3 => state(1),
      I4 => state(0),
      I5 => state(2),
      O => shiftreg_out(5)
    );
\shiftreg_out[6]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000000F0CCAACCAA"
    )
        port map (
      I0 => \buffer\(22),
      I1 => \shiftreg_out_reg_n_0_[5]\,
      I2 => \buffer\(6),
      I3 => state(1),
      I4 => state(0),
      I5 => state(2),
      O => shiftreg_out(6)
    );
\shiftreg_out[7]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000000F0CCAACCAA"
    )
        port map (
      I0 => \buffer\(23),
      I1 => \shiftreg_out_reg_n_0_[6]\,
      I2 => \buffer\(7),
      I3 => state(1),
      I4 => state(0),
      I5 => state(2),
      O => shiftreg_out(7)
    );
\shiftreg_out[8]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000000F0CCAACCAA"
    )
        port map (
      I0 => \buffer\(24),
      I1 => \shiftreg_out_reg_n_0_[7]\,
      I2 => \buffer\(8),
      I3 => state(1),
      I4 => state(0),
      I5 => state(2),
      O => shiftreg_out(8)
    );
\shiftreg_out[9]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000000F0CCAACCAA"
    )
        port map (
      I0 => \buffer\(25),
      I1 => \shiftreg_out_reg_n_0_[8]\,
      I2 => \buffer\(9),
      I3 => state(1),
      I4 => state(0),
      I5 => state(2),
      O => shiftreg_out(9)
    );
\shiftreg_out_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axis_aclk,
      CE => \shiftreg_out[15]_i_1_n_0\,
      D => shiftreg_out(0),
      Q => \shiftreg_out_reg_n_0_[0]\,
      R => '0'
    );
\shiftreg_out_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axis_aclk,
      CE => \shiftreg_out[15]_i_1_n_0\,
      D => shiftreg_out(10),
      Q => \shiftreg_out_reg_n_0_[10]\,
      R => '0'
    );
\shiftreg_out_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axis_aclk,
      CE => \shiftreg_out[15]_i_1_n_0\,
      D => shiftreg_out(11),
      Q => \shiftreg_out_reg_n_0_[11]\,
      R => '0'
    );
\shiftreg_out_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axis_aclk,
      CE => \shiftreg_out[15]_i_1_n_0\,
      D => shiftreg_out(12),
      Q => \shiftreg_out_reg_n_0_[12]\,
      R => '0'
    );
\shiftreg_out_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axis_aclk,
      CE => \shiftreg_out[15]_i_1_n_0\,
      D => shiftreg_out(13),
      Q => \shiftreg_out_reg_n_0_[13]\,
      R => '0'
    );
\shiftreg_out_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axis_aclk,
      CE => \shiftreg_out[15]_i_1_n_0\,
      D => shiftreg_out(14),
      Q => \shiftreg_out_reg_n_0_[14]\,
      R => '0'
    );
\shiftreg_out_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axis_aclk,
      CE => \shiftreg_out[15]_i_1_n_0\,
      D => shiftreg_out(15),
      Q => p_0_in,
      R => '0'
    );
\shiftreg_out_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axis_aclk,
      CE => \shiftreg_out[15]_i_1_n_0\,
      D => shiftreg_out(1),
      Q => \shiftreg_out_reg_n_0_[1]\,
      R => '0'
    );
\shiftreg_out_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axis_aclk,
      CE => \shiftreg_out[15]_i_1_n_0\,
      D => shiftreg_out(2),
      Q => \shiftreg_out_reg_n_0_[2]\,
      R => '0'
    );
\shiftreg_out_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axis_aclk,
      CE => \shiftreg_out[15]_i_1_n_0\,
      D => shiftreg_out(3),
      Q => \shiftreg_out_reg_n_0_[3]\,
      R => '0'
    );
\shiftreg_out_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axis_aclk,
      CE => \shiftreg_out[15]_i_1_n_0\,
      D => shiftreg_out(4),
      Q => \shiftreg_out_reg_n_0_[4]\,
      R => '0'
    );
\shiftreg_out_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axis_aclk,
      CE => \shiftreg_out[15]_i_1_n_0\,
      D => shiftreg_out(5),
      Q => \shiftreg_out_reg_n_0_[5]\,
      R => '0'
    );
\shiftreg_out_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axis_aclk,
      CE => \shiftreg_out[15]_i_1_n_0\,
      D => shiftreg_out(6),
      Q => \shiftreg_out_reg_n_0_[6]\,
      R => '0'
    );
\shiftreg_out_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axis_aclk,
      CE => \shiftreg_out[15]_i_1_n_0\,
      D => shiftreg_out(7),
      Q => \shiftreg_out_reg_n_0_[7]\,
      R => '0'
    );
\shiftreg_out_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axis_aclk,
      CE => \shiftreg_out[15]_i_1_n_0\,
      D => shiftreg_out(8),
      Q => \shiftreg_out_reg_n_0_[8]\,
      R => '0'
    );
\shiftreg_out_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axis_aclk,
      CE => \shiftreg_out[15]_i_1_n_0\,
      D => shiftreg_out(9),
      Q => \shiftreg_out_reg_n_0_[9]\,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_myI2STx_0_0 is
  port (
    bclk : out STD_LOGIC;
    lrclk : out STD_LOGIC;
    sdata : out STD_LOGIC;
    mclk : in STD_LOGIC;
    sdata_in : in STD_LOGIC;
    s00_axis_tdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s00_axis_tstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s00_axis_tlast : in STD_LOGIC;
    s00_axis_tvalid : in STD_LOGIC;
    m00_axis_aclk : in STD_LOGIC;
    m00_axis_aresetn : in STD_LOGIC;
    m00_axis_tvalid : out STD_LOGIC;
    m00_axis_tdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m00_axis_tlast : out STD_LOGIC;
    m00_axis_tready : in STD_LOGIC;
    s00_axis_tready : out STD_LOGIC;
    s00_axis_aclk : in STD_LOGIC;
    s00_axis_aresetn : in STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of design_1_myI2STx_0_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of design_1_myI2STx_0_0 : entity is "design_1_myI2STx_0_0,myI2STx_v1_0,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of design_1_myI2STx_0_0 : entity is "yes";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of design_1_myI2STx_0_0 : entity is "myI2STx_v1_0,Vivado 2018.3";
end design_1_myI2STx_0_0;

architecture STRUCTURE of design_1_myI2STx_0_0 is
  signal \<const1>\ : STD_LOGIC;
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of m00_axis_aclk : signal is "xilinx.com:signal:clock:1.0 m00_axis_aclk CLK";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of m00_axis_aclk : signal is "XIL_INTERFACENAME m00_axis_aclk, ASSOCIATED_BUSIF M00_AXIS, ASSOCIATED_RESET m00_axis_aresetn, FREQ_HZ 100000000, PHASE 0.0, CLK_DOMAIN /clk_wiz_0_clk_out1, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of m00_axis_aresetn : signal is "xilinx.com:signal:reset:1.0 m00_axis_aresetn RST";
  attribute X_INTERFACE_PARAMETER of m00_axis_aresetn : signal is "XIL_INTERFACENAME m00_axis_aresetn, POLARITY ACTIVE_LOW, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of m00_axis_tlast : signal is "xilinx.com:interface:axis:1.0 M00_AXIS TLAST";
  attribute X_INTERFACE_INFO of m00_axis_tready : signal is "xilinx.com:interface:axis:1.0 M00_AXIS TREADY";
  attribute X_INTERFACE_PARAMETER of m00_axis_tready : signal is "XIL_INTERFACENAME M00_AXIS, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 1, FREQ_HZ 100000000, PHASE 0.0, CLK_DOMAIN /clk_wiz_0_clk_out1, LAYERED_METADATA undef, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of m00_axis_tvalid : signal is "xilinx.com:interface:axis:1.0 M00_AXIS TVALID";
  attribute X_INTERFACE_INFO of s00_axis_aclk : signal is "xilinx.com:signal:clock:1.0 S00_AXIS_CLK CLK, xilinx.com:signal:clock:1.0 s00_axis_aclk CLK";
  attribute X_INTERFACE_PARAMETER of s00_axis_aclk : signal is "XIL_INTERFACENAME S00_AXIS_CLK, ASSOCIATED_BUSIF S00_AXIS, ASSOCIATED_RESET s00_axis_aresetn, FREQ_HZ 100000000, PHASE 0.000, INSERT_VIP 0, XIL_INTERFACENAME s00_axis_aclk, ASSOCIATED_RESET s00_axis_aresetn, FREQ_HZ 100000000, PHASE 0.0, CLK_DOMAIN /clk_wiz_0_clk_out1, ASSOCIATED_BUSIF S00_AXIS, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of s00_axis_aresetn : signal is "xilinx.com:signal:reset:1.0 S00_AXIS_RST RST, xilinx.com:signal:reset:1.0 s00_axis_aresetn RST";
  attribute X_INTERFACE_PARAMETER of s00_axis_aresetn : signal is "XIL_INTERFACENAME S00_AXIS_RST, POLARITY ACTIVE_LOW, INSERT_VIP 0, XIL_INTERFACENAME s00_axis_aresetn, POLARITY ACTIVE_LOW, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of s00_axis_tlast : signal is "xilinx.com:interface:axis:1.0 S00_AXIS TLAST";
  attribute X_INTERFACE_INFO of s00_axis_tready : signal is "xilinx.com:interface:axis:1.0 S00_AXIS TREADY";
  attribute X_INTERFACE_PARAMETER of s00_axis_tready : signal is "XIL_INTERFACENAME S00_AXIS, WIZ_DATA_WIDTH 32, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 1, HAS_TKEEP 0, HAS_TLAST 1, FREQ_HZ 100000000, PHASE 0.0, CLK_DOMAIN /clk_wiz_0_clk_out1, LAYERED_METADATA undef, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of s00_axis_tvalid : signal is "xilinx.com:interface:axis:1.0 S00_AXIS TVALID";
  attribute X_INTERFACE_INFO of m00_axis_tdata : signal is "xilinx.com:interface:axis:1.0 M00_AXIS TDATA";
  attribute X_INTERFACE_INFO of s00_axis_tdata : signal is "xilinx.com:interface:axis:1.0 S00_AXIS TDATA";
  attribute X_INTERFACE_INFO of s00_axis_tstrb : signal is "xilinx.com:interface:axis:1.0 S00_AXIS TSTRB";
begin
  m00_axis_tlast <= \<const1>\;
VCC: unisim.vcomponents.VCC
     port map (
      P => \<const1>\
    );
inst: entity work.design_1_myI2STx_0_0_myI2STx_v1_0
     port map (
      bclk => bclk,
      lrclk_reg_0 => lrclk,
      m00_axis_tdata(31 downto 0) => m00_axis_tdata(31 downto 0),
      m00_axis_tready => m00_axis_tready,
      m00_axis_tvalid => m00_axis_tvalid,
      mclk => mclk,
      s00_axis_aclk => s00_axis_aclk,
      s00_axis_tdata(31 downto 0) => s00_axis_tdata(31 downto 0),
      s00_axis_tready => s00_axis_tready,
      s00_axis_tvalid => s00_axis_tvalid,
      sdata => sdata,
      sdata_in => sdata_in
    );
end STRUCTURE;
