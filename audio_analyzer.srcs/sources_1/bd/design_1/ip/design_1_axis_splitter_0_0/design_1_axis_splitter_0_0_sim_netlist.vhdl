-- Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2018.3 (lin64) Build 2405991 Thu Dec  6 23:36:41 MST 2018
-- Date        : Sun Mar 30 01:53:52 2025
-- Host        : MattsThinkpad running 64-bit unknown
-- Command     : write_vhdl -force -mode funcsim -rename_top design_1_axis_splitter_0_0 -prefix
--               design_1_axis_splitter_0_0_ design_1_axis_splitter_0_0_sim_netlist.vhdl
-- Design      : design_1_axis_splitter_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7a200tsbg484-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_axis_splitter_0_0_axis_splitter is
  port (
    out2_axis_tdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    in_axis_tready_reg_0 : out STD_LOGIC;
    out2_axis_tvalid_reg_0 : out STD_LOGIC;
    out1_axis_tvalid_reg_0 : out STD_LOGIC;
    in_axis_tdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    in_axis_aclk : in STD_LOGIC;
    in_axis_aresetn : in STD_LOGIC;
    in_axis_tvalid : in STD_LOGIC;
    out2_axis_tready : in STD_LOGIC;
    out1_axis_tready : in STD_LOGIC
  );
end design_1_axis_splitter_0_0_axis_splitter;

architecture STRUCTURE of design_1_axis_splitter_0_0_axis_splitter is
  signal in_axis_tready_i_1_n_0 : STD_LOGIC;
  signal \^in_axis_tready_reg_0\ : STD_LOGIC;
  signal \out1_axis_tdata[31]_i_1_n_0\ : STD_LOGIC;
  signal out1_axis_tvalid_i_1_n_0 : STD_LOGIC;
  signal \^out1_axis_tvalid_reg_0\ : STD_LOGIC;
  signal out2_axis_tvalid_i_1_n_0 : STD_LOGIC;
  signal \^out2_axis_tvalid_reg_0\ : STD_LOGIC;
  signal stored_data_valid_i_1_n_0 : STD_LOGIC;
  signal stored_data_valid_reg_n_0 : STD_LOGIC;
begin
  in_axis_tready_reg_0 <= \^in_axis_tready_reg_0\;
  out1_axis_tvalid_reg_0 <= \^out1_axis_tvalid_reg_0\;
  out2_axis_tvalid_reg_0 <= \^out2_axis_tvalid_reg_0\;
in_axis_tready_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2F2F2F2F2F2FFF2F"
    )
        port map (
      I0 => \^in_axis_tready_reg_0\,
      I1 => in_axis_tvalid,
      I2 => in_axis_aresetn,
      I3 => stored_data_valid_reg_n_0,
      I4 => \^out1_axis_tvalid_reg_0\,
      I5 => \^out2_axis_tvalid_reg_0\,
      O => in_axis_tready_i_1_n_0
    );
in_axis_tready_reg: unisim.vcomponents.FDRE
     port map (
      C => in_axis_aclk,
      CE => '1',
      D => in_axis_tready_i_1_n_0,
      Q => \^in_axis_tready_reg_0\,
      R => '0'
    );
\out1_axis_tdata[31]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => in_axis_aresetn,
      I1 => \^in_axis_tready_reg_0\,
      I2 => in_axis_tvalid,
      O => \out1_axis_tdata[31]_i_1_n_0\
    );
\out1_axis_tdata_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => in_axis_aclk,
      CE => \out1_axis_tdata[31]_i_1_n_0\,
      D => in_axis_tdata(0),
      Q => out2_axis_tdata(0),
      R => '0'
    );
\out1_axis_tdata_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => in_axis_aclk,
      CE => \out1_axis_tdata[31]_i_1_n_0\,
      D => in_axis_tdata(10),
      Q => out2_axis_tdata(10),
      R => '0'
    );
\out1_axis_tdata_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => in_axis_aclk,
      CE => \out1_axis_tdata[31]_i_1_n_0\,
      D => in_axis_tdata(11),
      Q => out2_axis_tdata(11),
      R => '0'
    );
\out1_axis_tdata_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => in_axis_aclk,
      CE => \out1_axis_tdata[31]_i_1_n_0\,
      D => in_axis_tdata(12),
      Q => out2_axis_tdata(12),
      R => '0'
    );
\out1_axis_tdata_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => in_axis_aclk,
      CE => \out1_axis_tdata[31]_i_1_n_0\,
      D => in_axis_tdata(13),
      Q => out2_axis_tdata(13),
      R => '0'
    );
\out1_axis_tdata_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => in_axis_aclk,
      CE => \out1_axis_tdata[31]_i_1_n_0\,
      D => in_axis_tdata(14),
      Q => out2_axis_tdata(14),
      R => '0'
    );
\out1_axis_tdata_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => in_axis_aclk,
      CE => \out1_axis_tdata[31]_i_1_n_0\,
      D => in_axis_tdata(15),
      Q => out2_axis_tdata(15),
      R => '0'
    );
\out1_axis_tdata_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => in_axis_aclk,
      CE => \out1_axis_tdata[31]_i_1_n_0\,
      D => in_axis_tdata(16),
      Q => out2_axis_tdata(16),
      R => '0'
    );
\out1_axis_tdata_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => in_axis_aclk,
      CE => \out1_axis_tdata[31]_i_1_n_0\,
      D => in_axis_tdata(17),
      Q => out2_axis_tdata(17),
      R => '0'
    );
\out1_axis_tdata_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => in_axis_aclk,
      CE => \out1_axis_tdata[31]_i_1_n_0\,
      D => in_axis_tdata(18),
      Q => out2_axis_tdata(18),
      R => '0'
    );
\out1_axis_tdata_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => in_axis_aclk,
      CE => \out1_axis_tdata[31]_i_1_n_0\,
      D => in_axis_tdata(19),
      Q => out2_axis_tdata(19),
      R => '0'
    );
\out1_axis_tdata_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => in_axis_aclk,
      CE => \out1_axis_tdata[31]_i_1_n_0\,
      D => in_axis_tdata(1),
      Q => out2_axis_tdata(1),
      R => '0'
    );
\out1_axis_tdata_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => in_axis_aclk,
      CE => \out1_axis_tdata[31]_i_1_n_0\,
      D => in_axis_tdata(20),
      Q => out2_axis_tdata(20),
      R => '0'
    );
\out1_axis_tdata_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => in_axis_aclk,
      CE => \out1_axis_tdata[31]_i_1_n_0\,
      D => in_axis_tdata(21),
      Q => out2_axis_tdata(21),
      R => '0'
    );
\out1_axis_tdata_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => in_axis_aclk,
      CE => \out1_axis_tdata[31]_i_1_n_0\,
      D => in_axis_tdata(22),
      Q => out2_axis_tdata(22),
      R => '0'
    );
\out1_axis_tdata_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => in_axis_aclk,
      CE => \out1_axis_tdata[31]_i_1_n_0\,
      D => in_axis_tdata(23),
      Q => out2_axis_tdata(23),
      R => '0'
    );
\out1_axis_tdata_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => in_axis_aclk,
      CE => \out1_axis_tdata[31]_i_1_n_0\,
      D => in_axis_tdata(24),
      Q => out2_axis_tdata(24),
      R => '0'
    );
\out1_axis_tdata_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => in_axis_aclk,
      CE => \out1_axis_tdata[31]_i_1_n_0\,
      D => in_axis_tdata(25),
      Q => out2_axis_tdata(25),
      R => '0'
    );
\out1_axis_tdata_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => in_axis_aclk,
      CE => \out1_axis_tdata[31]_i_1_n_0\,
      D => in_axis_tdata(26),
      Q => out2_axis_tdata(26),
      R => '0'
    );
\out1_axis_tdata_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => in_axis_aclk,
      CE => \out1_axis_tdata[31]_i_1_n_0\,
      D => in_axis_tdata(27),
      Q => out2_axis_tdata(27),
      R => '0'
    );
\out1_axis_tdata_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => in_axis_aclk,
      CE => \out1_axis_tdata[31]_i_1_n_0\,
      D => in_axis_tdata(28),
      Q => out2_axis_tdata(28),
      R => '0'
    );
\out1_axis_tdata_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => in_axis_aclk,
      CE => \out1_axis_tdata[31]_i_1_n_0\,
      D => in_axis_tdata(29),
      Q => out2_axis_tdata(29),
      R => '0'
    );
\out1_axis_tdata_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => in_axis_aclk,
      CE => \out1_axis_tdata[31]_i_1_n_0\,
      D => in_axis_tdata(2),
      Q => out2_axis_tdata(2),
      R => '0'
    );
\out1_axis_tdata_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => in_axis_aclk,
      CE => \out1_axis_tdata[31]_i_1_n_0\,
      D => in_axis_tdata(30),
      Q => out2_axis_tdata(30),
      R => '0'
    );
\out1_axis_tdata_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => in_axis_aclk,
      CE => \out1_axis_tdata[31]_i_1_n_0\,
      D => in_axis_tdata(31),
      Q => out2_axis_tdata(31),
      R => '0'
    );
\out1_axis_tdata_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => in_axis_aclk,
      CE => \out1_axis_tdata[31]_i_1_n_0\,
      D => in_axis_tdata(3),
      Q => out2_axis_tdata(3),
      R => '0'
    );
\out1_axis_tdata_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => in_axis_aclk,
      CE => \out1_axis_tdata[31]_i_1_n_0\,
      D => in_axis_tdata(4),
      Q => out2_axis_tdata(4),
      R => '0'
    );
\out1_axis_tdata_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => in_axis_aclk,
      CE => \out1_axis_tdata[31]_i_1_n_0\,
      D => in_axis_tdata(5),
      Q => out2_axis_tdata(5),
      R => '0'
    );
\out1_axis_tdata_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => in_axis_aclk,
      CE => \out1_axis_tdata[31]_i_1_n_0\,
      D => in_axis_tdata(6),
      Q => out2_axis_tdata(6),
      R => '0'
    );
\out1_axis_tdata_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => in_axis_aclk,
      CE => \out1_axis_tdata[31]_i_1_n_0\,
      D => in_axis_tdata(7),
      Q => out2_axis_tdata(7),
      R => '0'
    );
\out1_axis_tdata_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => in_axis_aclk,
      CE => \out1_axis_tdata[31]_i_1_n_0\,
      D => in_axis_tdata(8),
      Q => out2_axis_tdata(8),
      R => '0'
    );
\out1_axis_tdata_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => in_axis_aclk,
      CE => \out1_axis_tdata[31]_i_1_n_0\,
      D => in_axis_tdata(9),
      Q => out2_axis_tdata(9),
      R => '0'
    );
out1_axis_tvalid_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0080F080"
    )
        port map (
      I0 => in_axis_tvalid,
      I1 => \^in_axis_tready_reg_0\,
      I2 => in_axis_aresetn,
      I3 => \^out1_axis_tvalid_reg_0\,
      I4 => out1_axis_tready,
      O => out1_axis_tvalid_i_1_n_0
    );
out1_axis_tvalid_reg: unisim.vcomponents.FDRE
     port map (
      C => in_axis_aclk,
      CE => '1',
      D => out1_axis_tvalid_i_1_n_0,
      Q => \^out1_axis_tvalid_reg_0\,
      R => '0'
    );
out2_axis_tvalid_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0080F080"
    )
        port map (
      I0 => in_axis_tvalid,
      I1 => \^in_axis_tready_reg_0\,
      I2 => in_axis_aresetn,
      I3 => \^out2_axis_tvalid_reg_0\,
      I4 => out2_axis_tready,
      O => out2_axis_tvalid_i_1_n_0
    );
out2_axis_tvalid_reg: unisim.vcomponents.FDRE
     port map (
      C => in_axis_aclk,
      CE => '1',
      D => out2_axis_tvalid_i_1_n_0,
      Q => \^out2_axis_tvalid_reg_0\,
      R => '0'
    );
stored_data_valid_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F080F080F0800080"
    )
        port map (
      I0 => in_axis_tvalid,
      I1 => \^in_axis_tready_reg_0\,
      I2 => in_axis_aresetn,
      I3 => stored_data_valid_reg_n_0,
      I4 => \^out1_axis_tvalid_reg_0\,
      I5 => \^out2_axis_tvalid_reg_0\,
      O => stored_data_valid_i_1_n_0
    );
stored_data_valid_reg: unisim.vcomponents.FDRE
     port map (
      C => in_axis_aclk,
      CE => '1',
      D => stored_data_valid_i_1_n_0,
      Q => stored_data_valid_reg_n_0,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_axis_splitter_0_0 is
  port (
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
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of design_1_axis_splitter_0_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of design_1_axis_splitter_0_0 : entity is "design_1_axis_splitter_0_0,axis_splitter,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of design_1_axis_splitter_0_0 : entity is "yes";
  attribute IP_DEFINITION_SOURCE : string;
  attribute IP_DEFINITION_SOURCE of design_1_axis_splitter_0_0 : entity is "package_project";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of design_1_axis_splitter_0_0 : entity is "axis_splitter,Vivado 2018.3";
end design_1_axis_splitter_0_0;

architecture STRUCTURE of design_1_axis_splitter_0_0 is
  signal \^in_axis_tlast\ : STD_LOGIC;
  signal \^out2_axis_tdata\ : STD_LOGIC_VECTOR ( 31 downto 0 );
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of in_axis_aclk : signal is "xilinx.com:signal:clock:1.0 in_axis_aclk CLK";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of in_axis_aclk : signal is "XIL_INTERFACENAME in_axis_aclk, ASSOCIATED_BUSIF in_axis, ASSOCIATED_RESET in_axis_aresetn, FREQ_HZ 100000000, PHASE 0.0, CLK_DOMAIN /clk_wiz_0_clk_out1, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of in_axis_aresetn : signal is "xilinx.com:signal:reset:1.0 in_axis_aresetn RST";
  attribute X_INTERFACE_PARAMETER of in_axis_aresetn : signal is "XIL_INTERFACENAME in_axis_aresetn, POLARITY ACTIVE_LOW, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of in_axis_tlast : signal is "xilinx.com:interface:axis:1.0 in_axis TLAST";
  attribute X_INTERFACE_INFO of in_axis_tready : signal is "xilinx.com:interface:axis:1.0 in_axis TREADY";
  attribute X_INTERFACE_INFO of in_axis_tvalid : signal is "xilinx.com:interface:axis:1.0 in_axis TVALID";
  attribute X_INTERFACE_PARAMETER of in_axis_tvalid : signal is "XIL_INTERFACENAME in_axis, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 1, FREQ_HZ 100000000, PHASE 0.0, CLK_DOMAIN /clk_wiz_0_clk_out1, LAYERED_METADATA undef, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of out1_axis_aclk : signal is "xilinx.com:signal:clock:1.0 out1_axis_aclk CLK";
  attribute X_INTERFACE_PARAMETER of out1_axis_aclk : signal is "XIL_INTERFACENAME out1_axis_aclk, ASSOCIATED_BUSIF out1_axis, ASSOCIATED_RESET out1_axis_aresetn, FREQ_HZ 100000000, PHASE 0.0, CLK_DOMAIN /clk_wiz_0_clk_out1, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of out1_axis_aresetn : signal is "xilinx.com:signal:reset:1.0 out1_axis_aresetn RST";
  attribute X_INTERFACE_PARAMETER of out1_axis_aresetn : signal is "XIL_INTERFACENAME out1_axis_aresetn, POLARITY ACTIVE_LOW, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of out1_axis_tlast : signal is "xilinx.com:interface:axis:1.0 out1_axis TLAST";
  attribute X_INTERFACE_INFO of out1_axis_tready : signal is "xilinx.com:interface:axis:1.0 out1_axis TREADY";
  attribute X_INTERFACE_INFO of out1_axis_tvalid : signal is "xilinx.com:interface:axis:1.0 out1_axis TVALID";
  attribute X_INTERFACE_PARAMETER of out1_axis_tvalid : signal is "XIL_INTERFACENAME out1_axis, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 1, FREQ_HZ 100000000, PHASE 0.0, CLK_DOMAIN /clk_wiz_0_clk_out1, LAYERED_METADATA undef, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of out2_axis_aclk : signal is "xilinx.com:signal:clock:1.0 out2_axis_aclk CLK";
  attribute X_INTERFACE_PARAMETER of out2_axis_aclk : signal is "XIL_INTERFACENAME out2_axis_aclk, ASSOCIATED_BUSIF out2_axis, ASSOCIATED_RESET out2_axis_aresetn, FREQ_HZ 100000000, PHASE 0.0, CLK_DOMAIN /clk_wiz_0_clk_out1, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of out2_axis_aresetn : signal is "xilinx.com:signal:reset:1.0 out2_axis_aresetn RST";
  attribute X_INTERFACE_PARAMETER of out2_axis_aresetn : signal is "XIL_INTERFACENAME out2_axis_aresetn, POLARITY ACTIVE_LOW, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of out2_axis_tlast : signal is "xilinx.com:interface:axis:1.0 out2_axis TLAST";
  attribute X_INTERFACE_INFO of out2_axis_tready : signal is "xilinx.com:interface:axis:1.0 out2_axis TREADY";
  attribute X_INTERFACE_INFO of out2_axis_tvalid : signal is "xilinx.com:interface:axis:1.0 out2_axis TVALID";
  attribute X_INTERFACE_PARAMETER of out2_axis_tvalid : signal is "XIL_INTERFACENAME out2_axis, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 1, FREQ_HZ 100000000, PHASE 0.0, CLK_DOMAIN /clk_wiz_0_clk_out1, LAYERED_METADATA undef, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of in_axis_tdata : signal is "xilinx.com:interface:axis:1.0 in_axis TDATA";
  attribute X_INTERFACE_INFO of out1_axis_tdata : signal is "xilinx.com:interface:axis:1.0 out1_axis TDATA";
  attribute X_INTERFACE_INFO of out2_axis_tdata : signal is "xilinx.com:interface:axis:1.0 out2_axis TDATA";
begin
  \^in_axis_tlast\ <= in_axis_tlast;
  out1_axis_tdata(31 downto 0) <= \^out2_axis_tdata\(31 downto 0);
  out1_axis_tlast <= \^in_axis_tlast\;
  out2_axis_tdata(31 downto 0) <= \^out2_axis_tdata\(31 downto 0);
  out2_axis_tlast <= \^in_axis_tlast\;
inst: entity work.design_1_axis_splitter_0_0_axis_splitter
     port map (
      in_axis_aclk => in_axis_aclk,
      in_axis_aresetn => in_axis_aresetn,
      in_axis_tdata(31 downto 0) => in_axis_tdata(31 downto 0),
      in_axis_tready_reg_0 => in_axis_tready,
      in_axis_tvalid => in_axis_tvalid,
      out1_axis_tready => out1_axis_tready,
      out1_axis_tvalid_reg_0 => out1_axis_tvalid,
      out2_axis_tdata(31 downto 0) => \^out2_axis_tdata\(31 downto 0),
      out2_axis_tready => out2_axis_tready,
      out2_axis_tvalid_reg_0 => out2_axis_tvalid
    );
end STRUCTURE;
