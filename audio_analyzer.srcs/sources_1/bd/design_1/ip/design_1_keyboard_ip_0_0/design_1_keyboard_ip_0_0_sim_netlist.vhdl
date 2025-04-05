-- Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2018.3 (lin64) Build 2405991 Thu Dec  6 23:36:41 MST 2018
-- Date        : Fri Mar 21 18:07:10 2025
-- Host        : MattsThinkpad running 64-bit unknown
-- Command     : write_vhdl -force -mode funcsim -rename_top design_1_keyboard_ip_0_0 -prefix
--               design_1_keyboard_ip_0_0_ design_1_keyboard_ip_0_0_sim_netlist.vhdl
-- Design      : design_1_keyboard_ip_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7a200tsbg484-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_keyboard_ip_0_0_debouncer is
  port (
    clk : in STD_LOGIC;
    I : in STD_LOGIC;
    O : out STD_LOGIC
  );
  attribute COUNT_MAX : integer;
  attribute COUNT_MAX of design_1_keyboard_ip_0_0_debouncer : entity is 14;
  attribute COUNT_WIDTH : integer;
  attribute COUNT_WIDTH of design_1_keyboard_ip_0_0_debouncer : entity is 5;
end design_1_keyboard_ip_0_0_debouncer;

architecture STRUCTURE of design_1_keyboard_ip_0_0_debouncer is
  signal Iv : STD_LOGIC;
  signal \^o\ : STD_LOGIC;
  signal O_i_1_n_0 : STD_LOGIC;
  signal O_i_2_n_0 : STD_LOGIC;
  signal \count[0]_i_1_n_0\ : STD_LOGIC;
  signal \count[1]_i_1_n_0\ : STD_LOGIC;
  signal \count[2]_i_1_n_0\ : STD_LOGIC;
  signal \count[3]_i_1_n_0\ : STD_LOGIC;
  signal \count[4]_i_1_n_0\ : STD_LOGIC;
  signal \count[4]_i_2_n_0\ : STD_LOGIC;
  signal count_reg : STD_LOGIC_VECTOR ( 4 downto 0 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of O_i_1 : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \count[2]_i_1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \count[3]_i_1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \count[4]_i_2\ : label is "soft_lutpair1";
begin
  O <= \^o\;
Iv_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => I,
      Q => Iv,
      R => '0'
    );
O_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FE08"
    )
        port map (
      I0 => I,
      I1 => Iv,
      I2 => O_i_2_n_0,
      I3 => \^o\,
      O => O_i_1_n_0
    );
O_i_2: unisim.vcomponents.LUT5
    generic map(
      INIT => X"EFFFFFFF"
    )
        port map (
      I0 => count_reg(4),
      I1 => count_reg(0),
      I2 => count_reg(3),
      I3 => count_reg(1),
      I4 => count_reg(2),
      O => O_i_2_n_0
    );
O_reg: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => O_i_1_n_0,
      Q => \^o\,
      R => '0'
    );
\count[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2022222222222222"
    )
        port map (
      I0 => \count[4]_i_2_n_0\,
      I1 => count_reg(0),
      I2 => count_reg(4),
      I3 => count_reg(3),
      I4 => count_reg(1),
      I5 => count_reg(2),
      O => \count[0]_i_1_n_0\
    );
\count[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"60"
    )
        port map (
      I0 => count_reg(0),
      I1 => count_reg(1),
      I2 => \count[4]_i_2_n_0\,
      O => \count[1]_i_1_n_0\
    );
\count[2]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7800"
    )
        port map (
      I0 => count_reg(0),
      I1 => count_reg(1),
      I2 => count_reg(2),
      I3 => \count[4]_i_2_n_0\,
      O => \count[2]_i_1_n_0\
    );
\count[3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"6CCC0000"
    )
        port map (
      I0 => count_reg(0),
      I1 => count_reg(3),
      I2 => count_reg(1),
      I3 => count_reg(2),
      I4 => \count[4]_i_2_n_0\,
      O => \count[3]_i_1_n_0\
    );
\count[4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2AAAAAAA80000000"
    )
        port map (
      I0 => \count[4]_i_2_n_0\,
      I1 => count_reg(2),
      I2 => count_reg(1),
      I3 => count_reg(3),
      I4 => count_reg(0),
      I5 => count_reg(4),
      O => \count[4]_i_1_n_0\
    );
\count[4]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => Iv,
      I1 => I,
      O => \count[4]_i_2_n_0\
    );
\count_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \count[0]_i_1_n_0\,
      Q => count_reg(0),
      R => '0'
    );
\count_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \count[1]_i_1_n_0\,
      Q => count_reg(1),
      R => '0'
    );
\count_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \count[2]_i_1_n_0\,
      Q => count_reg(2),
      R => '0'
    );
\count_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \count[3]_i_1_n_0\,
      Q => count_reg(3),
      R => '0'
    );
\count_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \count[4]_i_1_n_0\,
      Q => count_reg(4),
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity \design_1_keyboard_ip_0_0_debouncer__parameterized0\ is
  port (
    clk : in STD_LOGIC;
    I : in STD_LOGIC;
    O : out STD_LOGIC
  );
  attribute COUNT_MAX : integer;
  attribute COUNT_MAX of \design_1_keyboard_ip_0_0_debouncer__parameterized0\ : entity is 19;
  attribute COUNT_WIDTH : integer;
  attribute COUNT_WIDTH of \design_1_keyboard_ip_0_0_debouncer__parameterized0\ : entity is 5;
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of \design_1_keyboard_ip_0_0_debouncer__parameterized0\ : entity is "debouncer";
end \design_1_keyboard_ip_0_0_debouncer__parameterized0\;

architecture STRUCTURE of \design_1_keyboard_ip_0_0_debouncer__parameterized0\ is
  signal Iv : STD_LOGIC;
  signal \^o\ : STD_LOGIC;
  signal O_i_1_n_0 : STD_LOGIC;
  signal O_i_2_n_0 : STD_LOGIC;
  signal \count[0]_i_1_n_0\ : STD_LOGIC;
  signal \count[1]_i_1_n_0\ : STD_LOGIC;
  signal \count[2]_i_1_n_0\ : STD_LOGIC;
  signal \count[3]_i_1_n_0\ : STD_LOGIC;
  signal \count[4]_i_1_n_0\ : STD_LOGIC;
  signal \count[4]_i_2_n_0\ : STD_LOGIC;
  signal count_reg : STD_LOGIC_VECTOR ( 4 downto 0 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of O_i_2 : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \count[4]_i_2\ : label is "soft_lutpair2";
begin
  O <= \^o\;
Iv_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => I,
      Q => Iv,
      R => '0'
    );
O_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"EFFFFFFF20000000"
    )
        port map (
      I0 => I,
      I1 => count_reg(2),
      I2 => count_reg(0),
      I3 => count_reg(1),
      I4 => O_i_2_n_0,
      I5 => \^o\,
      O => O_i_1_n_0
    );
O_i_2: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0090"
    )
        port map (
      I0 => I,
      I1 => Iv,
      I2 => count_reg(4),
      I3 => count_reg(3),
      O => O_i_2_n_0
    );
O_reg: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => O_i_1_n_0,
      Q => \^o\,
      R => '0'
    );
\count[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"4444444444C44444"
    )
        port map (
      I0 => count_reg(0),
      I1 => \count[4]_i_2_n_0\,
      I2 => count_reg(4),
      I3 => count_reg(3),
      I4 => count_reg(1),
      I5 => count_reg(2),
      O => \count[0]_i_1_n_0\
    );
\count[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"1000FF00FF000000"
    )
        port map (
      I0 => count_reg(2),
      I1 => count_reg(3),
      I2 => count_reg(4),
      I3 => \count[4]_i_2_n_0\,
      I4 => count_reg(1),
      I5 => count_reg(0),
      O => \count[1]_i_1_n_0\
    );
\count[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0D00F000F000F000"
    )
        port map (
      I0 => count_reg(4),
      I1 => count_reg(3),
      I2 => count_reg(2),
      I3 => \count[4]_i_2_n_0\,
      I4 => count_reg(1),
      I5 => count_reg(0),
      O => \count[2]_i_1_n_0\
    );
\count[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7F00007F80000080"
    )
        port map (
      I0 => count_reg(1),
      I1 => count_reg(0),
      I2 => count_reg(2),
      I3 => I,
      I4 => Iv,
      I5 => count_reg(3),
      O => \count[3]_i_1_n_0\
    );
\count[4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFF000080000000"
    )
        port map (
      I0 => count_reg(3),
      I1 => count_reg(1),
      I2 => count_reg(0),
      I3 => count_reg(2),
      I4 => \count[4]_i_2_n_0\,
      I5 => count_reg(4),
      O => \count[4]_i_1_n_0\
    );
\count[4]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => Iv,
      I1 => I,
      O => \count[4]_i_2_n_0\
    );
\count_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \count[0]_i_1_n_0\,
      Q => count_reg(0),
      R => '0'
    );
\count_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \count[1]_i_1_n_0\,
      Q => count_reg(1),
      R => '0'
    );
\count_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \count[2]_i_1_n_0\,
      Q => count_reg(2),
      R => '0'
    );
\count_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \count[3]_i_1_n_0\,
      Q => count_reg(3),
      R => '0'
    );
\count_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \count[4]_i_1_n_0\,
      Q => count_reg(4),
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_keyboard_ip_0_0_PS2Receiver is
  port (
    \keycode_reg[0]_0\ : out STD_LOGIC;
    \keycode_reg[1]_0\ : out STD_LOGIC;
    \keycode_reg[2]_0\ : out STD_LOGIC;
    \keycode_reg[3]_0\ : out STD_LOGIC;
    \keycode_reg[4]_0\ : out STD_LOGIC;
    \keycode_reg[5]_0\ : out STD_LOGIC;
    \keycode_reg[6]_0\ : out STD_LOGIC;
    \keycode_reg[7]_0\ : out STD_LOGIC;
    E : out STD_LOGIC_VECTOR ( 0 to 0 );
    Q : out STD_LOGIC_VECTOR ( 7 downto 0 );
    CLK : in STD_LOGIC;
    PS2Clk : in STD_LOGIC;
    PS2Data : in STD_LOGIC;
    \keycodev_reg[15]_i_5_0\ : in STD_LOGIC_VECTOR ( 15 downto 0 );
    start_reg : in STD_LOGIC
  );
end design_1_keyboard_ip_0_0_PS2Receiver;

architecture STRUCTURE of design_1_keyboard_ip_0_0_PS2Receiver is
  signal \^q\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal cnt : STD_LOGIC_VECTOR ( 3 downto 0 );
  attribute MARK_DEBUG : boolean;
  attribute MARK_DEBUG of cnt : signal is std.standard.true;
  signal \cnt[3]_i_1_n_0\ : STD_LOGIC;
  signal \cnt[3]_i_2_n_0\ : STD_LOGIC;
  signal data0 : STD_LOGIC;
  signal datacur : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \datacur[0]_i_1_n_0\ : STD_LOGIC;
  signal \datacur[1]_i_1_n_0\ : STD_LOGIC;
  signal \datacur[2]_i_1_n_0\ : STD_LOGIC;
  signal \datacur[3]_i_1_n_0\ : STD_LOGIC;
  signal \datacur[4]_i_1_n_0\ : STD_LOGIC;
  signal \datacur[5]_i_1_n_0\ : STD_LOGIC;
  signal \datacur[6]_i_1_n_0\ : STD_LOGIC;
  signal \datacur[7]_i_1_n_0\ : STD_LOGIC;
  signal flag : STD_LOGIC;
  signal flag_0 : STD_LOGIC;
  attribute MARK_DEBUG of flag_0 : signal is std.standard.true;
  signal flag_i_1_n_0 : STD_LOGIC;
  signal kclkf : STD_LOGIC;
  attribute MARK_DEBUG of kclkf : signal is std.standard.true;
  signal kdataf : STD_LOGIC;
  attribute MARK_DEBUG of kdataf : signal is std.standard.true;
  signal \^keycode_reg[0]_0\ : STD_LOGIC;
  signal \^keycode_reg[1]_0\ : STD_LOGIC;
  signal \^keycode_reg[2]_0\ : STD_LOGIC;
  signal \^keycode_reg[3]_0\ : STD_LOGIC;
  signal \^keycode_reg[4]_0\ : STD_LOGIC;
  signal \^keycode_reg[5]_0\ : STD_LOGIC;
  signal \^keycode_reg[6]_0\ : STD_LOGIC;
  signal \^keycode_reg[7]_0\ : STD_LOGIC;
  signal \keycodev[15]_i_11_n_0\ : STD_LOGIC;
  signal \keycodev[15]_i_12_n_0\ : STD_LOGIC;
  signal \keycodev[15]_i_13_n_0\ : STD_LOGIC;
  signal \keycodev[15]_i_14_n_0\ : STD_LOGIC;
  signal \keycodev[15]_i_15_n_0\ : STD_LOGIC;
  signal \keycodev[15]_i_16_n_0\ : STD_LOGIC;
  signal \keycodev[15]_i_17_n_0\ : STD_LOGIC;
  signal \keycodev[15]_i_18_n_0\ : STD_LOGIC;
  signal \keycodev[15]_i_2_n_0\ : STD_LOGIC;
  signal \keycodev[15]_i_3_n_0\ : STD_LOGIC;
  signal \keycodev[15]_i_4_n_0\ : STD_LOGIC;
  signal \keycodev[15]_i_6_n_0\ : STD_LOGIC;
  signal \keycodev[15]_i_7_n_0\ : STD_LOGIC;
  signal \keycodev[15]_i_9_n_0\ : STD_LOGIC;
  signal \keycodev_reg[15]_i_10_n_0\ : STD_LOGIC;
  signal \keycodev_reg[15]_i_10_n_1\ : STD_LOGIC;
  signal \keycodev_reg[15]_i_10_n_2\ : STD_LOGIC;
  signal \keycodev_reg[15]_i_10_n_3\ : STD_LOGIC;
  signal \keycodev_reg[15]_i_5_n_3\ : STD_LOGIC;
  signal oflag_i_1_n_0 : STD_LOGIC;
  signal p_2_in : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal pflag : STD_LOGIC;
  signal \NLW_keycodev_reg[15]_i_10_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_keycodev_reg[15]_i_5_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal \NLW_keycodev_reg[15]_i_5_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  attribute KEEP : string;
  attribute KEEP of \cnt_reg[0]\ : label is "yes";
  attribute XILINX_LEGACY_PRIM : string;
  attribute XILINX_LEGACY_PRIM of \cnt_reg[0]\ : label is "FDRE_1";
  attribute mark_debug_string : string;
  attribute mark_debug_string of \cnt_reg[0]\ : label is "true";
  attribute KEEP of \cnt_reg[1]\ : label is "yes";
  attribute XILINX_LEGACY_PRIM of \cnt_reg[1]\ : label is "FDRE_1";
  attribute mark_debug_string of \cnt_reg[1]\ : label is "true";
  attribute KEEP of \cnt_reg[2]\ : label is "yes";
  attribute XILINX_LEGACY_PRIM of \cnt_reg[2]\ : label is "FDRE_1";
  attribute mark_debug_string of \cnt_reg[2]\ : label is "true";
  attribute KEEP of \cnt_reg[3]\ : label is "yes";
  attribute XILINX_LEGACY_PRIM of \cnt_reg[3]\ : label is "FDRE_1";
  attribute mark_debug_string of \cnt_reg[3]\ : label is "true";
  attribute COUNT_MAX : integer;
  attribute COUNT_MAX of db_clk : label is 14;
  attribute COUNT_WIDTH : integer;
  attribute COUNT_WIDTH of db_clk : label is 5;
  attribute COUNT_MAX of db_data : label is 19;
  attribute COUNT_WIDTH of db_data : label is 5;
  attribute KEEP of flag_reg : label is "yes";
  attribute XILINX_LEGACY_PRIM of flag_reg : label is "FD_1";
  attribute mark_debug_string of flag_reg : label is "true";
begin
  Q(7 downto 0) <= \^q\(7 downto 0);
  \keycode_reg[0]_0\ <= \^keycode_reg[0]_0\;
  \keycode_reg[1]_0\ <= \^keycode_reg[1]_0\;
  \keycode_reg[2]_0\ <= \^keycode_reg[2]_0\;
  \keycode_reg[3]_0\ <= \^keycode_reg[3]_0\;
  \keycode_reg[4]_0\ <= \^keycode_reg[4]_0\;
  \keycode_reg[5]_0\ <= \^keycode_reg[5]_0\;
  \keycode_reg[6]_0\ <= \^keycode_reg[6]_0\;
  \keycode_reg[7]_0\ <= \^keycode_reg[7]_0\;
\cnt[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => cnt(0),
      O => p_2_in(0)
    );
\cnt[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => cnt(0),
      I1 => cnt(1),
      O => p_2_in(1)
    );
\cnt[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => cnt(0),
      I1 => cnt(1),
      I2 => cnt(2),
      O => p_2_in(2)
    );
\cnt[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0400"
    )
        port map (
      I0 => cnt(0),
      I1 => cnt(1),
      I2 => cnt(2),
      I3 => cnt(3),
      O => \cnt[3]_i_1_n_0\
    );
\cnt[3]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"57"
    )
        port map (
      I0 => cnt(3),
      I1 => cnt(2),
      I2 => cnt(1),
      O => \cnt[3]_i_2_n_0\
    );
\cnt[3]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
        port map (
      I0 => cnt(1),
      I1 => cnt(0),
      I2 => cnt(2),
      I3 => cnt(3),
      O => p_2_in(3)
    );
\cnt_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => kclkf,
      CE => \cnt[3]_i_2_n_0\,
      D => p_2_in(0),
      Q => cnt(0),
      R => \cnt[3]_i_1_n_0\
    );
\cnt_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => kclkf,
      CE => \cnt[3]_i_2_n_0\,
      D => p_2_in(1),
      Q => cnt(1),
      R => \cnt[3]_i_1_n_0\
    );
\cnt_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => kclkf,
      CE => \cnt[3]_i_2_n_0\,
      D => p_2_in(2),
      Q => cnt(2),
      R => \cnt[3]_i_1_n_0\
    );
\cnt_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => kclkf,
      CE => \cnt[3]_i_2_n_0\,
      D => p_2_in(3),
      Q => cnt(3),
      R => \cnt[3]_i_1_n_0\
    );
\datacur[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFEF00000020"
    )
        port map (
      I0 => kdataf,
      I1 => cnt(2),
      I2 => cnt(0),
      I3 => cnt(1),
      I4 => cnt(3),
      I5 => datacur(0),
      O => \datacur[0]_i_1_n_0\
    );
\datacur[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFEF00000020"
    )
        port map (
      I0 => kdataf,
      I1 => cnt(2),
      I2 => cnt(1),
      I3 => cnt(0),
      I4 => cnt(3),
      I5 => datacur(1),
      O => \datacur[1]_i_1_n_0\
    );
\datacur[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFEFFF00002000"
    )
        port map (
      I0 => kdataf,
      I1 => cnt(2),
      I2 => cnt(1),
      I3 => cnt(0),
      I4 => cnt(3),
      I5 => datacur(2),
      O => \datacur[2]_i_1_n_0\
    );
\datacur[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFEFF00000200"
    )
        port map (
      I0 => kdataf,
      I1 => cnt(1),
      I2 => cnt(0),
      I3 => cnt(2),
      I4 => cnt(3),
      I5 => datacur(3),
      O => \datacur[3]_i_1_n_0\
    );
\datacur[4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFBFF00000800"
    )
        port map (
      I0 => kdataf,
      I1 => cnt(0),
      I2 => cnt(1),
      I3 => cnt(2),
      I4 => cnt(3),
      I5 => datacur(4),
      O => \datacur[4]_i_1_n_0\
    );
\datacur[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFBFF00000800"
    )
        port map (
      I0 => kdataf,
      I1 => cnt(1),
      I2 => cnt(0),
      I3 => cnt(2),
      I4 => cnt(3),
      I5 => datacur(5),
      O => \datacur[5]_i_1_n_0\
    );
\datacur[6]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFBFFF00008000"
    )
        port map (
      I0 => kdataf,
      I1 => cnt(1),
      I2 => cnt(0),
      I3 => cnt(2),
      I4 => cnt(3),
      I5 => datacur(6),
      O => \datacur[6]_i_1_n_0\
    );
\datacur[7]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFB00000008"
    )
        port map (
      I0 => kdataf,
      I1 => cnt(3),
      I2 => cnt(2),
      I3 => cnt(1),
      I4 => cnt(0),
      I5 => datacur(7),
      O => \datacur[7]_i_1_n_0\
    );
\datacur_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => kclkf,
      CE => '1',
      D => \datacur[0]_i_1_n_0\,
      Q => datacur(0),
      R => '0'
    );
\datacur_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => kclkf,
      CE => '1',
      D => \datacur[1]_i_1_n_0\,
      Q => datacur(1),
      R => '0'
    );
\datacur_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => kclkf,
      CE => '1',
      D => \datacur[2]_i_1_n_0\,
      Q => datacur(2),
      R => '0'
    );
\datacur_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => kclkf,
      CE => '1',
      D => \datacur[3]_i_1_n_0\,
      Q => datacur(3),
      R => '0'
    );
\datacur_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => kclkf,
      CE => '1',
      D => \datacur[4]_i_1_n_0\,
      Q => datacur(4),
      R => '0'
    );
\datacur_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => kclkf,
      CE => '1',
      D => \datacur[5]_i_1_n_0\,
      Q => datacur(5),
      R => '0'
    );
\datacur_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => kclkf,
      CE => '1',
      D => \datacur[6]_i_1_n_0\,
      Q => datacur(6),
      R => '0'
    );
\datacur_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => kclkf,
      CE => '1',
      D => \datacur[7]_i_1_n_0\,
      Q => datacur(7),
      R => '0'
    );
db_clk: entity work.design_1_keyboard_ip_0_0_debouncer
     port map (
      I => PS2Clk,
      O => kclkf,
      clk => CLK
    );
db_data: entity work.\design_1_keyboard_ip_0_0_debouncer__parameterized0\
     port map (
      I => PS2Data,
      O => kdataf,
      clk => CLK
    );
flag_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFBF0020"
    )
        port map (
      I0 => cnt(0),
      I1 => cnt(1),
      I2 => cnt(3),
      I3 => cnt(2),
      I4 => flag_0,
      O => flag_i_1_n_0
    );
flag_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => kclkf,
      CE => '1',
      D => flag_i_1_n_0,
      Q => flag_0,
      R => '0'
    );
\keycode_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => oflag_i_1_n_0,
      D => datacur(0),
      Q => \^keycode_reg[0]_0\,
      R => '0'
    );
\keycode_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => oflag_i_1_n_0,
      D => \^keycode_reg[2]_0\,
      Q => \^q\(2),
      R => '0'
    );
\keycode_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => oflag_i_1_n_0,
      D => \^keycode_reg[3]_0\,
      Q => \^q\(3),
      R => '0'
    );
\keycode_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => oflag_i_1_n_0,
      D => \^keycode_reg[4]_0\,
      Q => \^q\(4),
      R => '0'
    );
\keycode_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => oflag_i_1_n_0,
      D => \^keycode_reg[5]_0\,
      Q => \^q\(5),
      R => '0'
    );
\keycode_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => oflag_i_1_n_0,
      D => \^keycode_reg[6]_0\,
      Q => \^q\(6),
      R => '0'
    );
\keycode_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => oflag_i_1_n_0,
      D => \^keycode_reg[7]_0\,
      Q => \^q\(7),
      R => '0'
    );
\keycode_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => oflag_i_1_n_0,
      D => datacur(1),
      Q => \^keycode_reg[1]_0\,
      R => '0'
    );
\keycode_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => oflag_i_1_n_0,
      D => datacur(2),
      Q => \^keycode_reg[2]_0\,
      R => '0'
    );
\keycode_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => oflag_i_1_n_0,
      D => datacur(3),
      Q => \^keycode_reg[3]_0\,
      R => '0'
    );
\keycode_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => oflag_i_1_n_0,
      D => datacur(4),
      Q => \^keycode_reg[4]_0\,
      R => '0'
    );
\keycode_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => oflag_i_1_n_0,
      D => datacur(5),
      Q => \^keycode_reg[5]_0\,
      R => '0'
    );
\keycode_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => oflag_i_1_n_0,
      D => datacur(6),
      Q => \^keycode_reg[6]_0\,
      R => '0'
    );
\keycode_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => oflag_i_1_n_0,
      D => datacur(7),
      Q => \^keycode_reg[7]_0\,
      R => '0'
    );
\keycode_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => oflag_i_1_n_0,
      D => \^keycode_reg[0]_0\,
      Q => \^q\(0),
      R => '0'
    );
\keycode_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => oflag_i_1_n_0,
      D => \^keycode_reg[1]_0\,
      Q => \^q\(1),
      R => '0'
    );
\keycodev[15]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000000007F7FFF00"
    )
        port map (
      I0 => \keycodev[15]_i_2_n_0\,
      I1 => \keycodev[15]_i_3_n_0\,
      I2 => \keycodev[15]_i_4_n_0\,
      I3 => data0,
      I4 => \keycodev[15]_i_6_n_0\,
      I5 => \keycodev[15]_i_7_n_0\,
      O => E(0)
    );
\keycodev[15]_i_11\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => \keycodev_reg[15]_i_5_0\(15),
      I1 => \^q\(7),
      O => \keycodev[15]_i_11_n_0\
    );
\keycodev[15]_i_12\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => \^q\(4),
      I1 => \keycodev_reg[15]_i_5_0\(12),
      I2 => \^q\(5),
      I3 => \keycodev_reg[15]_i_5_0\(13),
      I4 => \keycodev_reg[15]_i_5_0\(14),
      I5 => \^q\(6),
      O => \keycodev[15]_i_12_n_0\
    );
\keycodev[15]_i_13\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0010"
    )
        port map (
      I0 => \^q\(2),
      I1 => \^q\(1),
      I2 => \^q\(5),
      I3 => \^q\(0),
      O => \keycodev[15]_i_13_n_0\
    );
\keycodev[15]_i_14\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0001"
    )
        port map (
      I0 => \^keycode_reg[2]_0\,
      I1 => \^keycode_reg[1]_0\,
      I2 => \^keycode_reg[3]_0\,
      I3 => \^keycode_reg[0]_0\,
      O => \keycodev[15]_i_14_n_0\
    );
\keycodev[15]_i_15\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => \^q\(1),
      I1 => \keycodev_reg[15]_i_5_0\(9),
      I2 => \^q\(2),
      I3 => \keycodev_reg[15]_i_5_0\(10),
      I4 => \keycodev_reg[15]_i_5_0\(11),
      I5 => \^q\(3),
      O => \keycodev[15]_i_15_n_0\
    );
\keycodev[15]_i_16\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => \^keycode_reg[6]_0\,
      I1 => \keycodev_reg[15]_i_5_0\(6),
      I2 => \^keycode_reg[7]_0\,
      I3 => \keycodev_reg[15]_i_5_0\(7),
      I4 => \keycodev_reg[15]_i_5_0\(8),
      I5 => \^q\(0),
      O => \keycodev[15]_i_16_n_0\
    );
\keycodev[15]_i_17\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => \keycodev_reg[15]_i_5_0\(5),
      I1 => \^keycode_reg[5]_0\,
      I2 => \^keycode_reg[4]_0\,
      I3 => \keycodev_reg[15]_i_5_0\(4),
      I4 => \^keycode_reg[3]_0\,
      I5 => \keycodev_reg[15]_i_5_0\(3),
      O => \keycodev[15]_i_17_n_0\
    );
\keycodev[15]_i_18\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => \keycodev_reg[15]_i_5_0\(2),
      I1 => \^keycode_reg[2]_0\,
      I2 => \^keycode_reg[0]_0\,
      I3 => \keycodev_reg[15]_i_5_0\(0),
      I4 => \^keycode_reg[1]_0\,
      I5 => \keycodev_reg[15]_i_5_0\(1),
      O => \keycodev[15]_i_18_n_0\
    );
\keycodev[15]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFD00000000"
    )
        port map (
      I0 => start_reg,
      I1 => \keycodev_reg[15]_i_5_0\(11),
      I2 => \keycodev_reg[15]_i_5_0\(10),
      I3 => \keycodev_reg[15]_i_5_0\(9),
      I4 => \keycodev_reg[15]_i_5_0\(8),
      I5 => \keycodev[15]_i_9_n_0\,
      O => \keycodev[15]_i_2_n_0\
    );
\keycodev[15]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => \keycodev_reg[15]_i_5_0\(2),
      I1 => \^keycode_reg[2]_0\,
      I2 => \^keycode_reg[0]_0\,
      I3 => \keycodev_reg[15]_i_5_0\(0),
      I4 => \^keycode_reg[1]_0\,
      I5 => \keycodev_reg[15]_i_5_0\(1),
      O => \keycodev[15]_i_3_n_0\
    );
\keycodev[15]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => \keycodev_reg[15]_i_5_0\(5),
      I1 => \^keycode_reg[5]_0\,
      I2 => \^keycode_reg[4]_0\,
      I3 => \keycodev_reg[15]_i_5_0\(4),
      I4 => \^keycode_reg[3]_0\,
      I5 => \keycodev_reg[15]_i_5_0\(3),
      O => \keycodev[15]_i_4_n_0\
    );
\keycodev[15]_i_6\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"BFFFFFFF"
    )
        port map (
      I0 => \^q\(3),
      I1 => \^q\(6),
      I2 => \^q\(4),
      I3 => \^q\(7),
      I4 => \keycodev[15]_i_13_n_0\,
      O => \keycodev[15]_i_6_n_0\
    );
\keycodev[15]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"D555555555555555"
    )
        port map (
      I0 => flag,
      I1 => \keycodev[15]_i_14_n_0\,
      I2 => \^keycode_reg[7]_0\,
      I3 => \^keycode_reg[4]_0\,
      I4 => \^keycode_reg[6]_0\,
      I5 => \^keycode_reg[5]_0\,
      O => \keycodev[15]_i_7_n_0\
    );
\keycodev[15]_i_9\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => \keycodev_reg[15]_i_5_0\(7),
      I1 => \^keycode_reg[7]_0\,
      I2 => \keycodev_reg[15]_i_5_0\(6),
      I3 => \^keycode_reg[6]_0\,
      O => \keycodev[15]_i_9_n_0\
    );
\keycodev_reg[15]_i_10\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \keycodev_reg[15]_i_10_n_0\,
      CO(2) => \keycodev_reg[15]_i_10_n_1\,
      CO(1) => \keycodev_reg[15]_i_10_n_2\,
      CO(0) => \keycodev_reg[15]_i_10_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"1111",
      O(3 downto 0) => \NLW_keycodev_reg[15]_i_10_O_UNCONNECTED\(3 downto 0),
      S(3) => \keycodev[15]_i_15_n_0\,
      S(2) => \keycodev[15]_i_16_n_0\,
      S(1) => \keycodev[15]_i_17_n_0\,
      S(0) => \keycodev[15]_i_18_n_0\
    );
\keycodev_reg[15]_i_5\: unisim.vcomponents.CARRY4
     port map (
      CI => \keycodev_reg[15]_i_10_n_0\,
      CO(3 downto 2) => \NLW_keycodev_reg[15]_i_5_CO_UNCONNECTED\(3 downto 2),
      CO(1) => data0,
      CO(0) => \keycodev_reg[15]_i_5_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0011",
      O(3 downto 0) => \NLW_keycodev_reg[15]_i_5_O_UNCONNECTED\(3 downto 0),
      S(3 downto 2) => B"00",
      S(1) => \keycodev[15]_i_11_n_0\,
      S(0) => \keycodev[15]_i_12_n_0\
    );
oflag_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => flag_0,
      I1 => pflag,
      O => oflag_i_1_n_0
    );
oflag_reg: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => '1',
      D => oflag_i_1_n_0,
      Q => flag,
      R => '0'
    );
pflag_reg: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => '1',
      D => flag_0,
      Q => pflag,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_keyboard_ip_0_0_top is
  port (
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
end design_1_keyboard_ip_0_0_top;

architecture STRUCTURE of design_1_keyboard_ip_0_0_top is
  signal \<const0>\ : STD_LOGIC;
  signal \<const1>\ : STD_LOGIC;
  signal CLK50MHZ : STD_LOGIC;
  signal CLK50MHZ_i_1_n_0 : STD_LOGIC;
  signal keycodev : STD_LOGIC_VECTOR ( 15 downto 8 );
  signal \keycodev[15]_i_8_n_0\ : STD_LOGIC;
  signal \keycodev__0\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \^s00_axis_tdata\ : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal \s00_axis_tdata[15]_i_1_n_0\ : STD_LOGIC;
  signal \^s00_axis_tvalid\ : STD_LOGIC;
  signal s00_axis_tvalid_i_1_n_0 : STD_LOGIC;
  signal sel0 : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal start : STD_LOGIC;
  signal start0 : STD_LOGIC;
  signal uut_n_0 : STD_LOGIC;
  signal uut_n_1 : STD_LOGIC;
  signal uut_n_2 : STD_LOGIC;
  signal uut_n_3 : STD_LOGIC;
  signal uut_n_4 : STD_LOGIC;
  signal uut_n_5 : STD_LOGIC;
  signal uut_n_6 : STD_LOGIC;
  signal uut_n_7 : STD_LOGIC;
begin
  s00_axis_tdata(31) <= \<const0>\;
  s00_axis_tdata(30) <= \<const0>\;
  s00_axis_tdata(29) <= \<const0>\;
  s00_axis_tdata(28) <= \<const0>\;
  s00_axis_tdata(27) <= \<const0>\;
  s00_axis_tdata(26) <= \<const0>\;
  s00_axis_tdata(25) <= \<const0>\;
  s00_axis_tdata(24) <= \<const0>\;
  s00_axis_tdata(23) <= \<const0>\;
  s00_axis_tdata(22) <= \<const0>\;
  s00_axis_tdata(21) <= \<const0>\;
  s00_axis_tdata(20) <= \<const0>\;
  s00_axis_tdata(19) <= \<const0>\;
  s00_axis_tdata(18) <= \<const0>\;
  s00_axis_tdata(17) <= \<const0>\;
  s00_axis_tdata(16) <= \<const0>\;
  s00_axis_tdata(15 downto 0) <= \^s00_axis_tdata\(15 downto 0);
  s00_axis_tlast <= \<const1>\;
  s00_axis_tvalid <= \^s00_axis_tvalid\;
CLK50MHZ_i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => CLK50MHZ,
      O => CLK50MHZ_i_1_n_0
    );
CLK50MHZ_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => CLK50MHZ_i_1_n_0,
      Q => CLK50MHZ,
      R => '0'
    );
GND: unisim.vcomponents.GND
     port map (
      G => \<const0>\
    );
VCC: unisim.vcomponents.VCC
     port map (
      P => \<const1>\
    );
\keycodev[15]_i_8\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8000"
    )
        port map (
      I0 => keycodev(13),
      I1 => keycodev(12),
      I2 => keycodev(15),
      I3 => keycodev(14),
      O => \keycodev[15]_i_8_n_0\
    );
\keycodev_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => start0,
      D => uut_n_0,
      Q => \keycodev__0\(0),
      R => '0'
    );
\keycodev_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => start0,
      D => sel0(2),
      Q => keycodev(10),
      R => '0'
    );
\keycodev_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => start0,
      D => sel0(3),
      Q => keycodev(11),
      R => '0'
    );
\keycodev_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => start0,
      D => sel0(4),
      Q => keycodev(12),
      R => '0'
    );
\keycodev_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => start0,
      D => sel0(5),
      Q => keycodev(13),
      R => '0'
    );
\keycodev_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => start0,
      D => sel0(6),
      Q => keycodev(14),
      R => '0'
    );
\keycodev_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => start0,
      D => sel0(7),
      Q => keycodev(15),
      R => '0'
    );
\keycodev_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => start0,
      D => uut_n_1,
      Q => \keycodev__0\(1),
      R => '0'
    );
\keycodev_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => start0,
      D => uut_n_2,
      Q => \keycodev__0\(2),
      R => '0'
    );
\keycodev_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => start0,
      D => uut_n_3,
      Q => \keycodev__0\(3),
      R => '0'
    );
\keycodev_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => start0,
      D => uut_n_4,
      Q => \keycodev__0\(4),
      R => '0'
    );
\keycodev_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => start0,
      D => uut_n_5,
      Q => \keycodev__0\(5),
      R => '0'
    );
\keycodev_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => start0,
      D => uut_n_6,
      Q => \keycodev__0\(6),
      R => '0'
    );
\keycodev_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => start0,
      D => uut_n_7,
      Q => \keycodev__0\(7),
      R => '0'
    );
\keycodev_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => start0,
      D => sel0(0),
      Q => keycodev(8),
      R => '0'
    );
\keycodev_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => start0,
      D => sel0(1),
      Q => keycodev(9),
      R => '0'
    );
\s00_axis_tdata[15]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => s00_axis_aresetn,
      O => \s00_axis_tdata[15]_i_1_n_0\
    );
\s00_axis_tdata_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axis_aclk,
      CE => start,
      D => \keycodev__0\(0),
      Q => \^s00_axis_tdata\(0),
      R => \s00_axis_tdata[15]_i_1_n_0\
    );
\s00_axis_tdata_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axis_aclk,
      CE => start,
      D => keycodev(10),
      Q => \^s00_axis_tdata\(10),
      R => \s00_axis_tdata[15]_i_1_n_0\
    );
\s00_axis_tdata_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axis_aclk,
      CE => start,
      D => keycodev(11),
      Q => \^s00_axis_tdata\(11),
      R => \s00_axis_tdata[15]_i_1_n_0\
    );
\s00_axis_tdata_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axis_aclk,
      CE => start,
      D => keycodev(12),
      Q => \^s00_axis_tdata\(12),
      R => \s00_axis_tdata[15]_i_1_n_0\
    );
\s00_axis_tdata_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axis_aclk,
      CE => start,
      D => keycodev(13),
      Q => \^s00_axis_tdata\(13),
      R => \s00_axis_tdata[15]_i_1_n_0\
    );
\s00_axis_tdata_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axis_aclk,
      CE => start,
      D => keycodev(14),
      Q => \^s00_axis_tdata\(14),
      R => \s00_axis_tdata[15]_i_1_n_0\
    );
\s00_axis_tdata_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axis_aclk,
      CE => start,
      D => keycodev(15),
      Q => \^s00_axis_tdata\(15),
      R => \s00_axis_tdata[15]_i_1_n_0\
    );
\s00_axis_tdata_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axis_aclk,
      CE => start,
      D => \keycodev__0\(1),
      Q => \^s00_axis_tdata\(1),
      R => \s00_axis_tdata[15]_i_1_n_0\
    );
\s00_axis_tdata_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axis_aclk,
      CE => start,
      D => \keycodev__0\(2),
      Q => \^s00_axis_tdata\(2),
      R => \s00_axis_tdata[15]_i_1_n_0\
    );
\s00_axis_tdata_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axis_aclk,
      CE => start,
      D => \keycodev__0\(3),
      Q => \^s00_axis_tdata\(3),
      R => \s00_axis_tdata[15]_i_1_n_0\
    );
\s00_axis_tdata_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axis_aclk,
      CE => start,
      D => \keycodev__0\(4),
      Q => \^s00_axis_tdata\(4),
      R => \s00_axis_tdata[15]_i_1_n_0\
    );
\s00_axis_tdata_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axis_aclk,
      CE => start,
      D => \keycodev__0\(5),
      Q => \^s00_axis_tdata\(5),
      R => \s00_axis_tdata[15]_i_1_n_0\
    );
\s00_axis_tdata_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axis_aclk,
      CE => start,
      D => \keycodev__0\(6),
      Q => \^s00_axis_tdata\(6),
      R => \s00_axis_tdata[15]_i_1_n_0\
    );
\s00_axis_tdata_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axis_aclk,
      CE => start,
      D => \keycodev__0\(7),
      Q => \^s00_axis_tdata\(7),
      R => \s00_axis_tdata[15]_i_1_n_0\
    );
\s00_axis_tdata_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axis_aclk,
      CE => start,
      D => keycodev(8),
      Q => \^s00_axis_tdata\(8),
      R => \s00_axis_tdata[15]_i_1_n_0\
    );
\s00_axis_tdata_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axis_aclk,
      CE => start,
      D => keycodev(9),
      Q => \^s00_axis_tdata\(9),
      R => \s00_axis_tdata[15]_i_1_n_0\
    );
s00_axis_tvalid_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F200"
    )
        port map (
      I0 => \^s00_axis_tvalid\,
      I1 => s00_axis_tready,
      I2 => start,
      I3 => s00_axis_aresetn,
      O => s00_axis_tvalid_i_1_n_0
    );
s00_axis_tvalid_reg: unisim.vcomponents.FDRE
     port map (
      C => s00_axis_aclk,
      CE => '1',
      D => s00_axis_tvalid_i_1_n_0,
      Q => \^s00_axis_tvalid\,
      R => '0'
    );
start_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => start0,
      Q => start,
      R => '0'
    );
uut: entity work.design_1_keyboard_ip_0_0_PS2Receiver
     port map (
      CLK => CLK50MHZ,
      E(0) => start0,
      PS2Clk => PS2Clk,
      PS2Data => PS2Data,
      Q(7 downto 0) => sel0(7 downto 0),
      \keycode_reg[0]_0\ => uut_n_0,
      \keycode_reg[1]_0\ => uut_n_1,
      \keycode_reg[2]_0\ => uut_n_2,
      \keycode_reg[3]_0\ => uut_n_3,
      \keycode_reg[4]_0\ => uut_n_4,
      \keycode_reg[5]_0\ => uut_n_5,
      \keycode_reg[6]_0\ => uut_n_6,
      \keycode_reg[7]_0\ => uut_n_7,
      \keycodev_reg[15]_i_5_0\(15 downto 8) => keycodev(15 downto 8),
      \keycodev_reg[15]_i_5_0\(7 downto 0) => \keycodev__0\(7 downto 0),
      start_reg => \keycodev[15]_i_8_n_0\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_keyboard_ip_0_0 is
  port (
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
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of design_1_keyboard_ip_0_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of design_1_keyboard_ip_0_0 : entity is "design_1_keyboard_ip_0_0,top,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of design_1_keyboard_ip_0_0 : entity is "yes";
  attribute IP_DEFINITION_SOURCE : string;
  attribute IP_DEFINITION_SOURCE of design_1_keyboard_ip_0_0 : entity is "package_project";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of design_1_keyboard_ip_0_0 : entity is "top,Vivado 2018.3";
end design_1_keyboard_ip_0_0;

architecture STRUCTURE of design_1_keyboard_ip_0_0 is
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of clk : signal is "xilinx.com:signal:clock:1.0 clk CLK";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of clk : signal is "XIL_INTERFACENAME clk, ASSOCIATED_BUSIF s00_axis, FREQ_HZ 100000000, PHASE 0.0, CLK_DOMAIN /clk_wiz_0_clk_out1, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of s00_axis_aclk : signal is "xilinx.com:signal:clock:1.0 s00_axis_aclk CLK";
  attribute X_INTERFACE_PARAMETER of s00_axis_aclk : signal is "XIL_INTERFACENAME s00_axis_aclk, ASSOCIATED_RESET s00_axis_aresetn, FREQ_HZ 100000000, PHASE 0.0, CLK_DOMAIN /clk_wiz_0_clk_out1, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of s00_axis_aresetn : signal is "xilinx.com:signal:reset:1.0 s00_axis_aresetn RST";
  attribute X_INTERFACE_PARAMETER of s00_axis_aresetn : signal is "XIL_INTERFACENAME s00_axis_aresetn, POLARITY ACTIVE_LOW, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of s00_axis_tlast : signal is "xilinx.com:interface:axis:1.0 s00_axis TLAST";
  attribute X_INTERFACE_INFO of s00_axis_tready : signal is "xilinx.com:interface:axis:1.0 s00_axis TREADY";
  attribute X_INTERFACE_INFO of s00_axis_tvalid : signal is "xilinx.com:interface:axis:1.0 s00_axis TVALID";
  attribute X_INTERFACE_PARAMETER of s00_axis_tvalid : signal is "XIL_INTERFACENAME s00_axis, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 1, FREQ_HZ 100000000, PHASE 0.0, CLK_DOMAIN /clk_wiz_0_clk_out1, LAYERED_METADATA undef, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of s00_axis_tdata : signal is "xilinx.com:interface:axis:1.0 s00_axis TDATA";
begin
inst: entity work.design_1_keyboard_ip_0_0_top
     port map (
      PS2Clk => PS2Clk,
      PS2Data => PS2Data,
      clk => clk,
      s00_axis_aclk => s00_axis_aclk,
      s00_axis_aresetn => s00_axis_aresetn,
      s00_axis_tdata(31 downto 0) => s00_axis_tdata(31 downto 0),
      s00_axis_tlast => s00_axis_tlast,
      s00_axis_tready => s00_axis_tready,
      s00_axis_tvalid => s00_axis_tvalid
    );
end STRUCTURE;
