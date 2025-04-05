// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.3 (lin64) Build 2405991 Thu Dec  6 23:36:41 MST 2018
// Date        : Mon Mar 24 14:04:51 2025
// Host        : MattsThinkpad running 64-bit unknown
// Command     : write_verilog -force -mode funcsim -rename_top design_1_myI2STx_0_0 -prefix
//               design_1_myI2STx_0_0_ design_1_myI2STx_0_0_sim_netlist.v
// Design      : design_1_myI2STx_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a200tsbg484-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "design_1_myI2STx_0_0,myI2STx_v1_0,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* X_CORE_INFO = "myI2STx_v1_0,Vivado 2018.3" *) 
(* NotValidForBitStream *)
module design_1_myI2STx_0_0
   (bclk,
    lrclk,
    sdata,
    mclk,
    sdata_in,
    s00_axis_tdata,
    s00_axis_tstrb,
    s00_axis_tlast,
    s00_axis_tvalid,
    m00_axis_aclk,
    m00_axis_aresetn,
    m00_axis_tvalid,
    m00_axis_tdata,
    m00_axis_tlast,
    m00_axis_tready,
    s00_axis_tready,
    s00_axis_aclk,
    s00_axis_aresetn);
  output bclk;
  output lrclk;
  output sdata;
  input mclk;
  input sdata_in;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S00_AXIS TDATA" *) input [31:0]s00_axis_tdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S00_AXIS TSTRB" *) input [3:0]s00_axis_tstrb;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S00_AXIS TLAST" *) input s00_axis_tlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S00_AXIS TVALID" *) input s00_axis_tvalid;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 m00_axis_aclk CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME m00_axis_aclk, ASSOCIATED_BUSIF M00_AXIS, ASSOCIATED_RESET m00_axis_aresetn, FREQ_HZ 100000000, PHASE 0.0, CLK_DOMAIN /clk_wiz_0_clk_out1, INSERT_VIP 0" *) input m00_axis_aclk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 m00_axis_aresetn RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME m00_axis_aresetn, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) input m00_axis_aresetn;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M00_AXIS TVALID" *) output m00_axis_tvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M00_AXIS TDATA" *) output [31:0]m00_axis_tdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M00_AXIS TLAST" *) output m00_axis_tlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M00_AXIS TREADY" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME M00_AXIS, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 1, FREQ_HZ 100000000, PHASE 0.0, CLK_DOMAIN /clk_wiz_0_clk_out1, LAYERED_METADATA undef, INSERT_VIP 0" *) input m00_axis_tready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S00_AXIS TREADY" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S00_AXIS, WIZ_DATA_WIDTH 32, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 1, HAS_TKEEP 0, HAS_TLAST 1, FREQ_HZ 100000000, PHASE 0.0, CLK_DOMAIN /clk_wiz_0_clk_out1, LAYERED_METADATA undef, INSERT_VIP 0" *) output s00_axis_tready;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 S00_AXIS_CLK CLK, xilinx.com:signal:clock:1.0 s00_axis_aclk CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S00_AXIS_CLK, ASSOCIATED_BUSIF S00_AXIS, ASSOCIATED_RESET s00_axis_aresetn, FREQ_HZ 100000000, PHASE 0.000, INSERT_VIP 0, XIL_INTERFACENAME s00_axis_aclk, ASSOCIATED_RESET s00_axis_aresetn, FREQ_HZ 100000000, PHASE 0.0, CLK_DOMAIN /clk_wiz_0_clk_out1, ASSOCIATED_BUSIF S00_AXIS, INSERT_VIP 0" *) input s00_axis_aclk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 S00_AXIS_RST RST, xilinx.com:signal:reset:1.0 s00_axis_aresetn RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S00_AXIS_RST, POLARITY ACTIVE_LOW, INSERT_VIP 0, XIL_INTERFACENAME s00_axis_aresetn, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) input s00_axis_aresetn;

  wire \<const1> ;
  wire bclk;
  wire lrclk;
  wire [31:0]m00_axis_tdata;
  wire m00_axis_tready;
  wire m00_axis_tvalid;
  wire mclk;
  wire s00_axis_aclk;
  wire [31:0]s00_axis_tdata;
  wire s00_axis_tready;
  wire s00_axis_tvalid;
  wire sdata;
  wire sdata_in;

  assign m00_axis_tlast = \<const1> ;
  VCC VCC
       (.P(\<const1> ));
  design_1_myI2STx_0_0_myI2STx_v1_0 inst
       (.bclk(bclk),
        .lrclk_reg_0(lrclk),
        .m00_axis_tdata(m00_axis_tdata),
        .m00_axis_tready(m00_axis_tready),
        .m00_axis_tvalid(m00_axis_tvalid),
        .mclk(mclk),
        .s00_axis_aclk(s00_axis_aclk),
        .s00_axis_tdata(s00_axis_tdata),
        .s00_axis_tready(s00_axis_tready),
        .s00_axis_tvalid(s00_axis_tvalid),
        .sdata(sdata),
        .sdata_in(sdata_in));
endmodule

module design_1_myI2STx_0_0_myI2STx_v1_0
   (lrclk_reg_0,
    m00_axis_tdata,
    s00_axis_tready,
    sdata,
    m00_axis_tvalid,
    bclk,
    s00_axis_aclk,
    sdata_in,
    s00_axis_tdata,
    mclk,
    s00_axis_tvalid,
    m00_axis_tready);
  output lrclk_reg_0;
  output [31:0]m00_axis_tdata;
  output s00_axis_tready;
  output sdata;
  output m00_axis_tvalid;
  output bclk;
  input s00_axis_aclk;
  input sdata_in;
  input [31:0]s00_axis_tdata;
  input mclk;
  input s00_axis_tvalid;
  input m00_axis_tready;

  wire \FSM_sequential_state[0]_i_1_n_0 ;
  wire \FSM_sequential_state[1]_i_1_n_0 ;
  wire \FSM_sequential_state[2]_i_1_n_0 ;
  wire bclk;
  wire bclk_i_1_n_0;
  wire [4:0]bitcounter;
  wire \bitcounter[4]_i_2_n_0 ;
  wire \bitcounter_reg_n_0_[0] ;
  wire \bitcounter_reg_n_0_[1] ;
  wire \bitcounter_reg_n_0_[2] ;
  wire \bitcounter_reg_n_0_[3] ;
  wire \bitcounter_reg_n_0_[4] ;
  wire [31:0]buffer;
  wire bufvalid;
  wire bufvalid_i_1_n_0;
  wire counter;
  wire \counter[0]_i_1_n_0 ;
  wire halfclk;
  wire halfclk_i_1_n_0;
  wire [15:0]left_in_buffer;
  wire \left_in_buffer[15]_i_1_n_0 ;
  wire lrclk_i_1_n_0;
  wire lrclk_reg_0;
  wire [31:0]m00_axis_tdata;
  wire m00_axis_tready;
  wire m00_axis_tvalid;
  wire m00_axis_tvalid0_out;
  wire m00_axis_tvalid_i_1_n_0;
  wire m00_axis_tvalid_i_2_n_0;
  wire m00_axis_tvalid_i_3_n_0;
  wire mclk;
  wire mclkdelay;
  wire p_0_in;
  wire s00_axis_aclk;
  wire [31:0]s00_axis_tdata;
  wire s00_axis_tready;
  wire s00_axis_tready0;
  wire s00_axis_tready_i_1_n_0;
  wire s00_axis_tvalid;
  wire sdata;
  wire sdata3_out;
  wire sdata_i_2_n_0;
  wire sdata_in;
  wire [30:15]shiftreg_in;
  wire \shiftreg_in[30]_i_1_n_0 ;
  wire \shiftreg_in_reg[14]_srl14_n_0 ;
  wire \shiftreg_in_reg_n_0_[0] ;
  wire [15:0]shiftreg_out;
  wire \shiftreg_out[15]_i_1_n_0 ;
  wire \shiftreg_out_reg_n_0_[0] ;
  wire \shiftreg_out_reg_n_0_[10] ;
  wire \shiftreg_out_reg_n_0_[11] ;
  wire \shiftreg_out_reg_n_0_[12] ;
  wire \shiftreg_out_reg_n_0_[13] ;
  wire \shiftreg_out_reg_n_0_[14] ;
  wire \shiftreg_out_reg_n_0_[1] ;
  wire \shiftreg_out_reg_n_0_[2] ;
  wire \shiftreg_out_reg_n_0_[3] ;
  wire \shiftreg_out_reg_n_0_[4] ;
  wire \shiftreg_out_reg_n_0_[5] ;
  wire \shiftreg_out_reg_n_0_[6] ;
  wire \shiftreg_out_reg_n_0_[7] ;
  wire \shiftreg_out_reg_n_0_[8] ;
  wire \shiftreg_out_reg_n_0_[9] ;
  wire [2:0]state;

  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'h0F70)) 
    \FSM_sequential_state[0]_i_1 
       (.I0(state[2]),
        .I1(state[1]),
        .I2(halfclk),
        .I3(state[0]),
        .O(\FSM_sequential_state[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h0BFF0C00)) 
    \FSM_sequential_state[1]_i_1 
       (.I0(m00_axis_tvalid_i_2_n_0),
        .I1(state[0]),
        .I2(state[2]),
        .I3(halfclk),
        .I4(state[1]),
        .O(\FSM_sequential_state[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000FFFF00400000)) 
    \FSM_sequential_state[2]_i_1 
       (.I0(lrclk_reg_0),
        .I1(state[1]),
        .I2(state[0]),
        .I3(m00_axis_tvalid_i_2_n_0),
        .I4(halfclk),
        .I5(state[2]),
        .O(\FSM_sequential_state[2]_i_1_n_0 ));
  (* FSM_ENCODED_STATES = "S1:001,S3:011,S2:010,S0:000,S4:100" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_sequential_state_reg[0] 
       (.C(s00_axis_aclk),
        .CE(1'b1),
        .D(\FSM_sequential_state[0]_i_1_n_0 ),
        .Q(state[0]),
        .R(1'b0));
  (* FSM_ENCODED_STATES = "S1:001,S3:011,S2:010,S0:000,S4:100" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_sequential_state_reg[1] 
       (.C(s00_axis_aclk),
        .CE(1'b1),
        .D(\FSM_sequential_state[1]_i_1_n_0 ),
        .Q(state[1]),
        .R(1'b0));
  (* FSM_ENCODED_STATES = "S1:001,S3:011,S2:010,S0:000,S4:100" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_sequential_state_reg[2] 
       (.C(s00_axis_aclk),
        .CE(1'b1),
        .D(\FSM_sequential_state[2]_i_1_n_0 ),
        .Q(state[2]),
        .R(1'b0));
  LUT5 #(
    .INIT(32'hECFF4400)) 
    bclk_i_1
       (.I0(state[2]),
        .I1(state[0]),
        .I2(state[1]),
        .I3(halfclk),
        .I4(bclk),
        .O(bclk_i_1_n_0));
  FDRE #(
    .INIT(1'b1)) 
    bclk_reg
       (.C(s00_axis_aclk),
        .CE(1'b1),
        .D(bclk_i_1_n_0),
        .Q(bclk),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT3 #(
    .INIT(8'h04)) 
    \bitcounter[0]_i_1 
       (.I0(state[2]),
        .I1(state[1]),
        .I2(\bitcounter_reg_n_0_[0] ),
        .O(bitcounter[0]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT4 #(
    .INIT(16'h0220)) 
    \bitcounter[1]_i_1 
       (.I0(state[1]),
        .I1(state[2]),
        .I2(\bitcounter_reg_n_0_[0] ),
        .I3(\bitcounter_reg_n_0_[1] ),
        .O(bitcounter[1]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT5 #(
    .INIT(32'h07000800)) 
    \bitcounter[2]_i_1 
       (.I0(\bitcounter_reg_n_0_[0] ),
        .I1(\bitcounter_reg_n_0_[1] ),
        .I2(state[2]),
        .I3(state[1]),
        .I4(\bitcounter_reg_n_0_[2] ),
        .O(bitcounter[2]));
  LUT6 #(
    .INIT(64'h007F000000800000)) 
    \bitcounter[3]_i_1 
       (.I0(\bitcounter_reg_n_0_[1] ),
        .I1(\bitcounter_reg_n_0_[0] ),
        .I2(\bitcounter_reg_n_0_[2] ),
        .I3(state[2]),
        .I4(state[1]),
        .I5(\bitcounter_reg_n_0_[3] ),
        .O(bitcounter[3]));
  LUT6 #(
    .INIT(64'h7FFF000080000000)) 
    \bitcounter[4]_i_1 
       (.I0(\bitcounter_reg_n_0_[2] ),
        .I1(\bitcounter_reg_n_0_[0] ),
        .I2(\bitcounter_reg_n_0_[1] ),
        .I3(\bitcounter_reg_n_0_[3] ),
        .I4(\bitcounter[4]_i_2_n_0 ),
        .I5(\bitcounter_reg_n_0_[4] ),
        .O(bitcounter[4]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \bitcounter[4]_i_2 
       (.I0(state[1]),
        .I1(state[2]),
        .O(\bitcounter[4]_i_2_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \bitcounter_reg[0] 
       (.C(s00_axis_aclk),
        .CE(sdata3_out),
        .D(bitcounter[0]),
        .Q(\bitcounter_reg_n_0_[0] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \bitcounter_reg[1] 
       (.C(s00_axis_aclk),
        .CE(sdata3_out),
        .D(bitcounter[1]),
        .Q(\bitcounter_reg_n_0_[1] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \bitcounter_reg[2] 
       (.C(s00_axis_aclk),
        .CE(sdata3_out),
        .D(bitcounter[2]),
        .Q(\bitcounter_reg_n_0_[2] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \bitcounter_reg[3] 
       (.C(s00_axis_aclk),
        .CE(sdata3_out),
        .D(bitcounter[3]),
        .Q(\bitcounter_reg_n_0_[3] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \bitcounter_reg[4] 
       (.C(s00_axis_aclk),
        .CE(sdata3_out),
        .D(bitcounter[4]),
        .Q(\bitcounter_reg_n_0_[4] ),
        .R(1'b0));
  LUT3 #(
    .INIT(8'h40)) 
    \buffer[31]_i_1 
       (.I0(bufvalid),
        .I1(s00_axis_tvalid),
        .I2(s00_axis_tready),
        .O(s00_axis_tready0));
  FDRE #(
    .INIT(1'b0)) 
    \buffer_reg[0] 
       (.C(s00_axis_aclk),
        .CE(s00_axis_tready0),
        .D(s00_axis_tdata[0]),
        .Q(buffer[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \buffer_reg[10] 
       (.C(s00_axis_aclk),
        .CE(s00_axis_tready0),
        .D(s00_axis_tdata[10]),
        .Q(buffer[10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \buffer_reg[11] 
       (.C(s00_axis_aclk),
        .CE(s00_axis_tready0),
        .D(s00_axis_tdata[11]),
        .Q(buffer[11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \buffer_reg[12] 
       (.C(s00_axis_aclk),
        .CE(s00_axis_tready0),
        .D(s00_axis_tdata[12]),
        .Q(buffer[12]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \buffer_reg[13] 
       (.C(s00_axis_aclk),
        .CE(s00_axis_tready0),
        .D(s00_axis_tdata[13]),
        .Q(buffer[13]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \buffer_reg[14] 
       (.C(s00_axis_aclk),
        .CE(s00_axis_tready0),
        .D(s00_axis_tdata[14]),
        .Q(buffer[14]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \buffer_reg[15] 
       (.C(s00_axis_aclk),
        .CE(s00_axis_tready0),
        .D(s00_axis_tdata[15]),
        .Q(buffer[15]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \buffer_reg[16] 
       (.C(s00_axis_aclk),
        .CE(s00_axis_tready0),
        .D(s00_axis_tdata[16]),
        .Q(buffer[16]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \buffer_reg[17] 
       (.C(s00_axis_aclk),
        .CE(s00_axis_tready0),
        .D(s00_axis_tdata[17]),
        .Q(buffer[17]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \buffer_reg[18] 
       (.C(s00_axis_aclk),
        .CE(s00_axis_tready0),
        .D(s00_axis_tdata[18]),
        .Q(buffer[18]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \buffer_reg[19] 
       (.C(s00_axis_aclk),
        .CE(s00_axis_tready0),
        .D(s00_axis_tdata[19]),
        .Q(buffer[19]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \buffer_reg[1] 
       (.C(s00_axis_aclk),
        .CE(s00_axis_tready0),
        .D(s00_axis_tdata[1]),
        .Q(buffer[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \buffer_reg[20] 
       (.C(s00_axis_aclk),
        .CE(s00_axis_tready0),
        .D(s00_axis_tdata[20]),
        .Q(buffer[20]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \buffer_reg[21] 
       (.C(s00_axis_aclk),
        .CE(s00_axis_tready0),
        .D(s00_axis_tdata[21]),
        .Q(buffer[21]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \buffer_reg[22] 
       (.C(s00_axis_aclk),
        .CE(s00_axis_tready0),
        .D(s00_axis_tdata[22]),
        .Q(buffer[22]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \buffer_reg[23] 
       (.C(s00_axis_aclk),
        .CE(s00_axis_tready0),
        .D(s00_axis_tdata[23]),
        .Q(buffer[23]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \buffer_reg[24] 
       (.C(s00_axis_aclk),
        .CE(s00_axis_tready0),
        .D(s00_axis_tdata[24]),
        .Q(buffer[24]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \buffer_reg[25] 
       (.C(s00_axis_aclk),
        .CE(s00_axis_tready0),
        .D(s00_axis_tdata[25]),
        .Q(buffer[25]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \buffer_reg[26] 
       (.C(s00_axis_aclk),
        .CE(s00_axis_tready0),
        .D(s00_axis_tdata[26]),
        .Q(buffer[26]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \buffer_reg[27] 
       (.C(s00_axis_aclk),
        .CE(s00_axis_tready0),
        .D(s00_axis_tdata[27]),
        .Q(buffer[27]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \buffer_reg[28] 
       (.C(s00_axis_aclk),
        .CE(s00_axis_tready0),
        .D(s00_axis_tdata[28]),
        .Q(buffer[28]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \buffer_reg[29] 
       (.C(s00_axis_aclk),
        .CE(s00_axis_tready0),
        .D(s00_axis_tdata[29]),
        .Q(buffer[29]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \buffer_reg[2] 
       (.C(s00_axis_aclk),
        .CE(s00_axis_tready0),
        .D(s00_axis_tdata[2]),
        .Q(buffer[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \buffer_reg[30] 
       (.C(s00_axis_aclk),
        .CE(s00_axis_tready0),
        .D(s00_axis_tdata[30]),
        .Q(buffer[30]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \buffer_reg[31] 
       (.C(s00_axis_aclk),
        .CE(s00_axis_tready0),
        .D(s00_axis_tdata[31]),
        .Q(buffer[31]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \buffer_reg[3] 
       (.C(s00_axis_aclk),
        .CE(s00_axis_tready0),
        .D(s00_axis_tdata[3]),
        .Q(buffer[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \buffer_reg[4] 
       (.C(s00_axis_aclk),
        .CE(s00_axis_tready0),
        .D(s00_axis_tdata[4]),
        .Q(buffer[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \buffer_reg[5] 
       (.C(s00_axis_aclk),
        .CE(s00_axis_tready0),
        .D(s00_axis_tdata[5]),
        .Q(buffer[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \buffer_reg[6] 
       (.C(s00_axis_aclk),
        .CE(s00_axis_tready0),
        .D(s00_axis_tdata[6]),
        .Q(buffer[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \buffer_reg[7] 
       (.C(s00_axis_aclk),
        .CE(s00_axis_tready0),
        .D(s00_axis_tdata[7]),
        .Q(buffer[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \buffer_reg[8] 
       (.C(s00_axis_aclk),
        .CE(s00_axis_tready0),
        .D(s00_axis_tdata[8]),
        .Q(buffer[8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \buffer_reg[9] 
       (.C(s00_axis_aclk),
        .CE(s00_axis_tready0),
        .D(s00_axis_tdata[9]),
        .Q(buffer[9]),
        .R(1'b0));
  LUT6 #(
    .INIT(64'hFFFFFCFF02AAA8AA)) 
    bufvalid_i_1
       (.I0(s00_axis_tready0),
        .I1(state[0]),
        .I2(state[1]),
        .I3(halfclk),
        .I4(state[2]),
        .I5(bufvalid),
        .O(bufvalid_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    bufvalid_reg
       (.C(s00_axis_aclk),
        .CE(1'b1),
        .D(bufvalid_i_1_n_0),
        .Q(bufvalid),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT3 #(
    .INIT(8'hB4)) 
    \counter[0]_i_1 
       (.I0(mclkdelay),
        .I1(mclk),
        .I2(counter),
        .O(\counter[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[0] 
       (.C(s00_axis_aclk),
        .CE(1'b1),
        .D(\counter[0]_i_1_n_0 ),
        .Q(counter),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT4 #(
    .INIT(16'h00B0)) 
    halfclk_i_1
       (.I0(halfclk),
        .I1(counter),
        .I2(mclk),
        .I3(mclkdelay),
        .O(halfclk_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    halfclk_reg
       (.C(s00_axis_aclk),
        .CE(1'b1),
        .D(halfclk_i_1_n_0),
        .Q(halfclk),
        .R(1'b0));
  LUT6 #(
    .INIT(64'h0000000000400000)) 
    \left_in_buffer[15]_i_1 
       (.I0(m00_axis_tvalid_i_2_n_0),
        .I1(state[0]),
        .I2(state[1]),
        .I3(state[2]),
        .I4(halfclk),
        .I5(lrclk_reg_0),
        .O(\left_in_buffer[15]_i_1_n_0 ));
  FDRE \left_in_buffer_reg[0] 
       (.C(s00_axis_aclk),
        .CE(\left_in_buffer[15]_i_1_n_0 ),
        .D(shiftreg_in[15]),
        .Q(left_in_buffer[0]),
        .R(1'b0));
  FDRE \left_in_buffer_reg[10] 
       (.C(s00_axis_aclk),
        .CE(\left_in_buffer[15]_i_1_n_0 ),
        .D(shiftreg_in[25]),
        .Q(left_in_buffer[10]),
        .R(1'b0));
  FDRE \left_in_buffer_reg[11] 
       (.C(s00_axis_aclk),
        .CE(\left_in_buffer[15]_i_1_n_0 ),
        .D(shiftreg_in[26]),
        .Q(left_in_buffer[11]),
        .R(1'b0));
  FDRE \left_in_buffer_reg[12] 
       (.C(s00_axis_aclk),
        .CE(\left_in_buffer[15]_i_1_n_0 ),
        .D(shiftreg_in[27]),
        .Q(left_in_buffer[12]),
        .R(1'b0));
  FDRE \left_in_buffer_reg[13] 
       (.C(s00_axis_aclk),
        .CE(\left_in_buffer[15]_i_1_n_0 ),
        .D(shiftreg_in[28]),
        .Q(left_in_buffer[13]),
        .R(1'b0));
  FDRE \left_in_buffer_reg[14] 
       (.C(s00_axis_aclk),
        .CE(\left_in_buffer[15]_i_1_n_0 ),
        .D(shiftreg_in[29]),
        .Q(left_in_buffer[14]),
        .R(1'b0));
  FDRE \left_in_buffer_reg[15] 
       (.C(s00_axis_aclk),
        .CE(\left_in_buffer[15]_i_1_n_0 ),
        .D(shiftreg_in[30]),
        .Q(left_in_buffer[15]),
        .R(1'b0));
  FDRE \left_in_buffer_reg[1] 
       (.C(s00_axis_aclk),
        .CE(\left_in_buffer[15]_i_1_n_0 ),
        .D(shiftreg_in[16]),
        .Q(left_in_buffer[1]),
        .R(1'b0));
  FDRE \left_in_buffer_reg[2] 
       (.C(s00_axis_aclk),
        .CE(\left_in_buffer[15]_i_1_n_0 ),
        .D(shiftreg_in[17]),
        .Q(left_in_buffer[2]),
        .R(1'b0));
  FDRE \left_in_buffer_reg[3] 
       (.C(s00_axis_aclk),
        .CE(\left_in_buffer[15]_i_1_n_0 ),
        .D(shiftreg_in[18]),
        .Q(left_in_buffer[3]),
        .R(1'b0));
  FDRE \left_in_buffer_reg[4] 
       (.C(s00_axis_aclk),
        .CE(\left_in_buffer[15]_i_1_n_0 ),
        .D(shiftreg_in[19]),
        .Q(left_in_buffer[4]),
        .R(1'b0));
  FDRE \left_in_buffer_reg[5] 
       (.C(s00_axis_aclk),
        .CE(\left_in_buffer[15]_i_1_n_0 ),
        .D(shiftreg_in[20]),
        .Q(left_in_buffer[5]),
        .R(1'b0));
  FDRE \left_in_buffer_reg[6] 
       (.C(s00_axis_aclk),
        .CE(\left_in_buffer[15]_i_1_n_0 ),
        .D(shiftreg_in[21]),
        .Q(left_in_buffer[6]),
        .R(1'b0));
  FDRE \left_in_buffer_reg[7] 
       (.C(s00_axis_aclk),
        .CE(\left_in_buffer[15]_i_1_n_0 ),
        .D(shiftreg_in[22]),
        .Q(left_in_buffer[7]),
        .R(1'b0));
  FDRE \left_in_buffer_reg[8] 
       (.C(s00_axis_aclk),
        .CE(\left_in_buffer[15]_i_1_n_0 ),
        .D(shiftreg_in[23]),
        .Q(left_in_buffer[8]),
        .R(1'b0));
  FDRE \left_in_buffer_reg[9] 
       (.C(s00_axis_aclk),
        .CE(\left_in_buffer[15]_i_1_n_0 ),
        .D(shiftreg_in[24]),
        .Q(left_in_buffer[9]),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT5 #(
    .INIT(32'hFEFF0200)) 
    lrclk_i_1
       (.I0(state[2]),
        .I1(state[1]),
        .I2(state[0]),
        .I3(halfclk),
        .I4(lrclk_reg_0),
        .O(lrclk_i_1_n_0));
  FDRE #(
    .INIT(1'b1)) 
    lrclk_reg
       (.C(s00_axis_aclk),
        .CE(1'b1),
        .D(lrclk_i_1_n_0),
        .Q(lrclk_reg_0),
        .R(1'b0));
  LUT6 #(
    .INIT(64'h0040000000000000)) 
    \m00_axis_tdata[31]_i_1 
       (.I0(m00_axis_tvalid_i_2_n_0),
        .I1(state[0]),
        .I2(state[1]),
        .I3(state[2]),
        .I4(halfclk),
        .I5(lrclk_reg_0),
        .O(m00_axis_tvalid0_out));
  FDRE \m00_axis_tdata_reg[0] 
       (.C(s00_axis_aclk),
        .CE(m00_axis_tvalid0_out),
        .D(shiftreg_in[15]),
        .Q(m00_axis_tdata[0]),
        .R(1'b0));
  FDRE \m00_axis_tdata_reg[10] 
       (.C(s00_axis_aclk),
        .CE(m00_axis_tvalid0_out),
        .D(shiftreg_in[25]),
        .Q(m00_axis_tdata[10]),
        .R(1'b0));
  FDRE \m00_axis_tdata_reg[11] 
       (.C(s00_axis_aclk),
        .CE(m00_axis_tvalid0_out),
        .D(shiftreg_in[26]),
        .Q(m00_axis_tdata[11]),
        .R(1'b0));
  FDRE \m00_axis_tdata_reg[12] 
       (.C(s00_axis_aclk),
        .CE(m00_axis_tvalid0_out),
        .D(shiftreg_in[27]),
        .Q(m00_axis_tdata[12]),
        .R(1'b0));
  FDRE \m00_axis_tdata_reg[13] 
       (.C(s00_axis_aclk),
        .CE(m00_axis_tvalid0_out),
        .D(shiftreg_in[28]),
        .Q(m00_axis_tdata[13]),
        .R(1'b0));
  FDRE \m00_axis_tdata_reg[14] 
       (.C(s00_axis_aclk),
        .CE(m00_axis_tvalid0_out),
        .D(shiftreg_in[29]),
        .Q(m00_axis_tdata[14]),
        .R(1'b0));
  FDRE \m00_axis_tdata_reg[15] 
       (.C(s00_axis_aclk),
        .CE(m00_axis_tvalid0_out),
        .D(shiftreg_in[30]),
        .Q(m00_axis_tdata[15]),
        .R(1'b0));
  FDRE \m00_axis_tdata_reg[16] 
       (.C(s00_axis_aclk),
        .CE(m00_axis_tvalid0_out),
        .D(left_in_buffer[0]),
        .Q(m00_axis_tdata[16]),
        .R(1'b0));
  FDRE \m00_axis_tdata_reg[17] 
       (.C(s00_axis_aclk),
        .CE(m00_axis_tvalid0_out),
        .D(left_in_buffer[1]),
        .Q(m00_axis_tdata[17]),
        .R(1'b0));
  FDRE \m00_axis_tdata_reg[18] 
       (.C(s00_axis_aclk),
        .CE(m00_axis_tvalid0_out),
        .D(left_in_buffer[2]),
        .Q(m00_axis_tdata[18]),
        .R(1'b0));
  FDRE \m00_axis_tdata_reg[19] 
       (.C(s00_axis_aclk),
        .CE(m00_axis_tvalid0_out),
        .D(left_in_buffer[3]),
        .Q(m00_axis_tdata[19]),
        .R(1'b0));
  FDRE \m00_axis_tdata_reg[1] 
       (.C(s00_axis_aclk),
        .CE(m00_axis_tvalid0_out),
        .D(shiftreg_in[16]),
        .Q(m00_axis_tdata[1]),
        .R(1'b0));
  FDRE \m00_axis_tdata_reg[20] 
       (.C(s00_axis_aclk),
        .CE(m00_axis_tvalid0_out),
        .D(left_in_buffer[4]),
        .Q(m00_axis_tdata[20]),
        .R(1'b0));
  FDRE \m00_axis_tdata_reg[21] 
       (.C(s00_axis_aclk),
        .CE(m00_axis_tvalid0_out),
        .D(left_in_buffer[5]),
        .Q(m00_axis_tdata[21]),
        .R(1'b0));
  FDRE \m00_axis_tdata_reg[22] 
       (.C(s00_axis_aclk),
        .CE(m00_axis_tvalid0_out),
        .D(left_in_buffer[6]),
        .Q(m00_axis_tdata[22]),
        .R(1'b0));
  FDRE \m00_axis_tdata_reg[23] 
       (.C(s00_axis_aclk),
        .CE(m00_axis_tvalid0_out),
        .D(left_in_buffer[7]),
        .Q(m00_axis_tdata[23]),
        .R(1'b0));
  FDRE \m00_axis_tdata_reg[24] 
       (.C(s00_axis_aclk),
        .CE(m00_axis_tvalid0_out),
        .D(left_in_buffer[8]),
        .Q(m00_axis_tdata[24]),
        .R(1'b0));
  FDRE \m00_axis_tdata_reg[25] 
       (.C(s00_axis_aclk),
        .CE(m00_axis_tvalid0_out),
        .D(left_in_buffer[9]),
        .Q(m00_axis_tdata[25]),
        .R(1'b0));
  FDRE \m00_axis_tdata_reg[26] 
       (.C(s00_axis_aclk),
        .CE(m00_axis_tvalid0_out),
        .D(left_in_buffer[10]),
        .Q(m00_axis_tdata[26]),
        .R(1'b0));
  FDRE \m00_axis_tdata_reg[27] 
       (.C(s00_axis_aclk),
        .CE(m00_axis_tvalid0_out),
        .D(left_in_buffer[11]),
        .Q(m00_axis_tdata[27]),
        .R(1'b0));
  FDRE \m00_axis_tdata_reg[28] 
       (.C(s00_axis_aclk),
        .CE(m00_axis_tvalid0_out),
        .D(left_in_buffer[12]),
        .Q(m00_axis_tdata[28]),
        .R(1'b0));
  FDRE \m00_axis_tdata_reg[29] 
       (.C(s00_axis_aclk),
        .CE(m00_axis_tvalid0_out),
        .D(left_in_buffer[13]),
        .Q(m00_axis_tdata[29]),
        .R(1'b0));
  FDRE \m00_axis_tdata_reg[2] 
       (.C(s00_axis_aclk),
        .CE(m00_axis_tvalid0_out),
        .D(shiftreg_in[17]),
        .Q(m00_axis_tdata[2]),
        .R(1'b0));
  FDRE \m00_axis_tdata_reg[30] 
       (.C(s00_axis_aclk),
        .CE(m00_axis_tvalid0_out),
        .D(left_in_buffer[14]),
        .Q(m00_axis_tdata[30]),
        .R(1'b0));
  FDRE \m00_axis_tdata_reg[31] 
       (.C(s00_axis_aclk),
        .CE(m00_axis_tvalid0_out),
        .D(left_in_buffer[15]),
        .Q(m00_axis_tdata[31]),
        .R(1'b0));
  FDRE \m00_axis_tdata_reg[3] 
       (.C(s00_axis_aclk),
        .CE(m00_axis_tvalid0_out),
        .D(shiftreg_in[18]),
        .Q(m00_axis_tdata[3]),
        .R(1'b0));
  FDRE \m00_axis_tdata_reg[4] 
       (.C(s00_axis_aclk),
        .CE(m00_axis_tvalid0_out),
        .D(shiftreg_in[19]),
        .Q(m00_axis_tdata[4]),
        .R(1'b0));
  FDRE \m00_axis_tdata_reg[5] 
       (.C(s00_axis_aclk),
        .CE(m00_axis_tvalid0_out),
        .D(shiftreg_in[20]),
        .Q(m00_axis_tdata[5]),
        .R(1'b0));
  FDRE \m00_axis_tdata_reg[6] 
       (.C(s00_axis_aclk),
        .CE(m00_axis_tvalid0_out),
        .D(shiftreg_in[21]),
        .Q(m00_axis_tdata[6]),
        .R(1'b0));
  FDRE \m00_axis_tdata_reg[7] 
       (.C(s00_axis_aclk),
        .CE(m00_axis_tvalid0_out),
        .D(shiftreg_in[22]),
        .Q(m00_axis_tdata[7]),
        .R(1'b0));
  FDRE \m00_axis_tdata_reg[8] 
       (.C(s00_axis_aclk),
        .CE(m00_axis_tvalid0_out),
        .D(shiftreg_in[23]),
        .Q(m00_axis_tdata[8]),
        .R(1'b0));
  FDRE \m00_axis_tdata_reg[9] 
       (.C(s00_axis_aclk),
        .CE(m00_axis_tvalid0_out),
        .D(shiftreg_in[24]),
        .Q(m00_axis_tdata[9]),
        .R(1'b0));
  LUT6 #(
    .INIT(64'h08FF0808FFFF0808)) 
    m00_axis_tvalid_i_1
       (.I0(lrclk_reg_0),
        .I1(\shiftreg_in[30]_i_1_n_0 ),
        .I2(m00_axis_tvalid_i_2_n_0),
        .I3(m00_axis_tvalid_i_3_n_0),
        .I4(m00_axis_tvalid),
        .I5(m00_axis_tready),
        .O(m00_axis_tvalid_i_1_n_0));
  LUT5 #(
    .INIT(32'h7FFFFFFF)) 
    m00_axis_tvalid_i_2
       (.I0(\bitcounter_reg_n_0_[3] ),
        .I1(\bitcounter_reg_n_0_[1] ),
        .I2(\bitcounter_reg_n_0_[0] ),
        .I3(\bitcounter_reg_n_0_[2] ),
        .I4(\bitcounter_reg_n_0_[4] ),
        .O(m00_axis_tvalid_i_2_n_0));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT4 #(
    .INIT(16'h57FF)) 
    m00_axis_tvalid_i_3
       (.I0(state[2]),
        .I1(state[0]),
        .I2(state[1]),
        .I3(halfclk),
        .O(m00_axis_tvalid_i_3_n_0));
  FDRE m00_axis_tvalid_reg
       (.C(s00_axis_aclk),
        .CE(1'b1),
        .D(m00_axis_tvalid_i_1_n_0),
        .Q(m00_axis_tvalid),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    mclkdelay_reg
       (.C(s00_axis_aclk),
        .CE(1'b1),
        .D(mclk),
        .Q(mclkdelay),
        .R(1'b0));
  LUT3 #(
    .INIT(8'hB5)) 
    s00_axis_tready_i_1
       (.I0(bufvalid),
        .I1(s00_axis_tvalid),
        .I2(s00_axis_tready),
        .O(s00_axis_tready_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    s00_axis_tready_reg
       (.C(s00_axis_aclk),
        .CE(1'b1),
        .D(s00_axis_tready_i_1_n_0),
        .Q(s00_axis_tready),
        .R(1'b0));
  LUT4 #(
    .INIT(16'h1500)) 
    sdata_i_1
       (.I0(state[0]),
        .I1(state[1]),
        .I2(state[2]),
        .I3(halfclk),
        .O(sdata3_out));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT3 #(
    .INIT(8'h40)) 
    sdata_i_2
       (.I0(state[2]),
        .I1(state[1]),
        .I2(p_0_in),
        .O(sdata_i_2_n_0));
  FDRE #(
    .INIT(1'b0)) 
    sdata_reg
       (.C(s00_axis_aclk),
        .CE(sdata3_out),
        .D(sdata_i_2_n_0),
        .Q(sdata),
        .R(1'b0));
  LUT4 #(
    .INIT(16'h0800)) 
    \shiftreg_in[30]_i_1 
       (.I0(state[0]),
        .I1(state[1]),
        .I2(state[2]),
        .I3(halfclk),
        .O(\shiftreg_in[30]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \shiftreg_in_reg[0] 
       (.C(s00_axis_aclk),
        .CE(\shiftreg_in[30]_i_1_n_0 ),
        .D(sdata_in),
        .Q(\shiftreg_in_reg_n_0_[0] ),
        .R(1'b0));
  (* srl_bus_name = "\inst/shiftreg_in_reg " *) 
  (* srl_name = "\inst/shiftreg_in_reg[14]_srl14 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \shiftreg_in_reg[14]_srl14 
       (.A0(1'b1),
        .A1(1'b0),
        .A2(1'b1),
        .A3(1'b1),
        .CE(\shiftreg_in[30]_i_1_n_0 ),
        .CLK(s00_axis_aclk),
        .D(\shiftreg_in_reg_n_0_[0] ),
        .Q(\shiftreg_in_reg[14]_srl14_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \shiftreg_in_reg[15] 
       (.C(s00_axis_aclk),
        .CE(\shiftreg_in[30]_i_1_n_0 ),
        .D(\shiftreg_in_reg[14]_srl14_n_0 ),
        .Q(shiftreg_in[15]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \shiftreg_in_reg[16] 
       (.C(s00_axis_aclk),
        .CE(\shiftreg_in[30]_i_1_n_0 ),
        .D(shiftreg_in[15]),
        .Q(shiftreg_in[16]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \shiftreg_in_reg[17] 
       (.C(s00_axis_aclk),
        .CE(\shiftreg_in[30]_i_1_n_0 ),
        .D(shiftreg_in[16]),
        .Q(shiftreg_in[17]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \shiftreg_in_reg[18] 
       (.C(s00_axis_aclk),
        .CE(\shiftreg_in[30]_i_1_n_0 ),
        .D(shiftreg_in[17]),
        .Q(shiftreg_in[18]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \shiftreg_in_reg[19] 
       (.C(s00_axis_aclk),
        .CE(\shiftreg_in[30]_i_1_n_0 ),
        .D(shiftreg_in[18]),
        .Q(shiftreg_in[19]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \shiftreg_in_reg[20] 
       (.C(s00_axis_aclk),
        .CE(\shiftreg_in[30]_i_1_n_0 ),
        .D(shiftreg_in[19]),
        .Q(shiftreg_in[20]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \shiftreg_in_reg[21] 
       (.C(s00_axis_aclk),
        .CE(\shiftreg_in[30]_i_1_n_0 ),
        .D(shiftreg_in[20]),
        .Q(shiftreg_in[21]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \shiftreg_in_reg[22] 
       (.C(s00_axis_aclk),
        .CE(\shiftreg_in[30]_i_1_n_0 ),
        .D(shiftreg_in[21]),
        .Q(shiftreg_in[22]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \shiftreg_in_reg[23] 
       (.C(s00_axis_aclk),
        .CE(\shiftreg_in[30]_i_1_n_0 ),
        .D(shiftreg_in[22]),
        .Q(shiftreg_in[23]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \shiftreg_in_reg[24] 
       (.C(s00_axis_aclk),
        .CE(\shiftreg_in[30]_i_1_n_0 ),
        .D(shiftreg_in[23]),
        .Q(shiftreg_in[24]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \shiftreg_in_reg[25] 
       (.C(s00_axis_aclk),
        .CE(\shiftreg_in[30]_i_1_n_0 ),
        .D(shiftreg_in[24]),
        .Q(shiftreg_in[25]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \shiftreg_in_reg[26] 
       (.C(s00_axis_aclk),
        .CE(\shiftreg_in[30]_i_1_n_0 ),
        .D(shiftreg_in[25]),
        .Q(shiftreg_in[26]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \shiftreg_in_reg[27] 
       (.C(s00_axis_aclk),
        .CE(\shiftreg_in[30]_i_1_n_0 ),
        .D(shiftreg_in[26]),
        .Q(shiftreg_in[27]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \shiftreg_in_reg[28] 
       (.C(s00_axis_aclk),
        .CE(\shiftreg_in[30]_i_1_n_0 ),
        .D(shiftreg_in[27]),
        .Q(shiftreg_in[28]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \shiftreg_in_reg[29] 
       (.C(s00_axis_aclk),
        .CE(\shiftreg_in[30]_i_1_n_0 ),
        .D(shiftreg_in[28]),
        .Q(shiftreg_in[29]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \shiftreg_in_reg[30] 
       (.C(s00_axis_aclk),
        .CE(\shiftreg_in[30]_i_1_n_0 ),
        .D(shiftreg_in[29]),
        .Q(shiftreg_in[30]),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'h02020300)) 
    \shiftreg_out[0]_i_1 
       (.I0(buffer[0]),
        .I1(state[0]),
        .I2(state[1]),
        .I3(buffer[16]),
        .I4(state[2]),
        .O(shiftreg_out[0]));
  LUT6 #(
    .INIT(64'h000000F0CCAACCAA)) 
    \shiftreg_out[10]_i_1 
       (.I0(buffer[26]),
        .I1(\shiftreg_out_reg_n_0_[9] ),
        .I2(buffer[10]),
        .I3(state[1]),
        .I4(state[0]),
        .I5(state[2]),
        .O(shiftreg_out[10]));
  LUT6 #(
    .INIT(64'h000000F0CCAACCAA)) 
    \shiftreg_out[11]_i_1 
       (.I0(buffer[27]),
        .I1(\shiftreg_out_reg_n_0_[10] ),
        .I2(buffer[11]),
        .I3(state[1]),
        .I4(state[0]),
        .I5(state[2]),
        .O(shiftreg_out[11]));
  LUT6 #(
    .INIT(64'h000000F0CCAACCAA)) 
    \shiftreg_out[12]_i_1 
       (.I0(buffer[28]),
        .I1(\shiftreg_out_reg_n_0_[11] ),
        .I2(buffer[12]),
        .I3(state[1]),
        .I4(state[0]),
        .I5(state[2]),
        .O(shiftreg_out[12]));
  LUT6 #(
    .INIT(64'h000000F0CCAACCAA)) 
    \shiftreg_out[13]_i_1 
       (.I0(buffer[29]),
        .I1(\shiftreg_out_reg_n_0_[12] ),
        .I2(buffer[13]),
        .I3(state[1]),
        .I4(state[0]),
        .I5(state[2]),
        .O(shiftreg_out[13]));
  LUT6 #(
    .INIT(64'h000000F0CCAACCAA)) 
    \shiftreg_out[14]_i_1 
       (.I0(buffer[30]),
        .I1(\shiftreg_out_reg_n_0_[13] ),
        .I2(buffer[14]),
        .I3(state[1]),
        .I4(state[0]),
        .I5(state[2]),
        .O(shiftreg_out[14]));
  LUT4 #(
    .INIT(16'h200A)) 
    \shiftreg_out[15]_i_1 
       (.I0(halfclk),
        .I1(state[2]),
        .I2(state[1]),
        .I3(state[0]),
        .O(\shiftreg_out[15]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h000000F0CCAACCAA)) 
    \shiftreg_out[15]_i_2 
       (.I0(buffer[31]),
        .I1(\shiftreg_out_reg_n_0_[14] ),
        .I2(buffer[15]),
        .I3(state[1]),
        .I4(state[0]),
        .I5(state[2]),
        .O(shiftreg_out[15]));
  LUT6 #(
    .INIT(64'h000000F0CCAACCAA)) 
    \shiftreg_out[1]_i_1 
       (.I0(buffer[17]),
        .I1(\shiftreg_out_reg_n_0_[0] ),
        .I2(buffer[1]),
        .I3(state[1]),
        .I4(state[0]),
        .I5(state[2]),
        .O(shiftreg_out[1]));
  LUT6 #(
    .INIT(64'h000000F0CCAACCAA)) 
    \shiftreg_out[2]_i_1 
       (.I0(buffer[18]),
        .I1(\shiftreg_out_reg_n_0_[1] ),
        .I2(buffer[2]),
        .I3(state[1]),
        .I4(state[0]),
        .I5(state[2]),
        .O(shiftreg_out[2]));
  LUT6 #(
    .INIT(64'h000000F0CCAACCAA)) 
    \shiftreg_out[3]_i_1 
       (.I0(buffer[19]),
        .I1(\shiftreg_out_reg_n_0_[2] ),
        .I2(buffer[3]),
        .I3(state[1]),
        .I4(state[0]),
        .I5(state[2]),
        .O(shiftreg_out[3]));
  LUT6 #(
    .INIT(64'h000000F0CCAACCAA)) 
    \shiftreg_out[4]_i_1 
       (.I0(buffer[20]),
        .I1(\shiftreg_out_reg_n_0_[3] ),
        .I2(buffer[4]),
        .I3(state[1]),
        .I4(state[0]),
        .I5(state[2]),
        .O(shiftreg_out[4]));
  LUT6 #(
    .INIT(64'h000000F0CCAACCAA)) 
    \shiftreg_out[5]_i_1 
       (.I0(buffer[21]),
        .I1(\shiftreg_out_reg_n_0_[4] ),
        .I2(buffer[5]),
        .I3(state[1]),
        .I4(state[0]),
        .I5(state[2]),
        .O(shiftreg_out[5]));
  LUT6 #(
    .INIT(64'h000000F0CCAACCAA)) 
    \shiftreg_out[6]_i_1 
       (.I0(buffer[22]),
        .I1(\shiftreg_out_reg_n_0_[5] ),
        .I2(buffer[6]),
        .I3(state[1]),
        .I4(state[0]),
        .I5(state[2]),
        .O(shiftreg_out[6]));
  LUT6 #(
    .INIT(64'h000000F0CCAACCAA)) 
    \shiftreg_out[7]_i_1 
       (.I0(buffer[23]),
        .I1(\shiftreg_out_reg_n_0_[6] ),
        .I2(buffer[7]),
        .I3(state[1]),
        .I4(state[0]),
        .I5(state[2]),
        .O(shiftreg_out[7]));
  LUT6 #(
    .INIT(64'h000000F0CCAACCAA)) 
    \shiftreg_out[8]_i_1 
       (.I0(buffer[24]),
        .I1(\shiftreg_out_reg_n_0_[7] ),
        .I2(buffer[8]),
        .I3(state[1]),
        .I4(state[0]),
        .I5(state[2]),
        .O(shiftreg_out[8]));
  LUT6 #(
    .INIT(64'h000000F0CCAACCAA)) 
    \shiftreg_out[9]_i_1 
       (.I0(buffer[25]),
        .I1(\shiftreg_out_reg_n_0_[8] ),
        .I2(buffer[9]),
        .I3(state[1]),
        .I4(state[0]),
        .I5(state[2]),
        .O(shiftreg_out[9]));
  FDRE #(
    .INIT(1'b0)) 
    \shiftreg_out_reg[0] 
       (.C(s00_axis_aclk),
        .CE(\shiftreg_out[15]_i_1_n_0 ),
        .D(shiftreg_out[0]),
        .Q(\shiftreg_out_reg_n_0_[0] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \shiftreg_out_reg[10] 
       (.C(s00_axis_aclk),
        .CE(\shiftreg_out[15]_i_1_n_0 ),
        .D(shiftreg_out[10]),
        .Q(\shiftreg_out_reg_n_0_[10] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \shiftreg_out_reg[11] 
       (.C(s00_axis_aclk),
        .CE(\shiftreg_out[15]_i_1_n_0 ),
        .D(shiftreg_out[11]),
        .Q(\shiftreg_out_reg_n_0_[11] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \shiftreg_out_reg[12] 
       (.C(s00_axis_aclk),
        .CE(\shiftreg_out[15]_i_1_n_0 ),
        .D(shiftreg_out[12]),
        .Q(\shiftreg_out_reg_n_0_[12] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \shiftreg_out_reg[13] 
       (.C(s00_axis_aclk),
        .CE(\shiftreg_out[15]_i_1_n_0 ),
        .D(shiftreg_out[13]),
        .Q(\shiftreg_out_reg_n_0_[13] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \shiftreg_out_reg[14] 
       (.C(s00_axis_aclk),
        .CE(\shiftreg_out[15]_i_1_n_0 ),
        .D(shiftreg_out[14]),
        .Q(\shiftreg_out_reg_n_0_[14] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \shiftreg_out_reg[15] 
       (.C(s00_axis_aclk),
        .CE(\shiftreg_out[15]_i_1_n_0 ),
        .D(shiftreg_out[15]),
        .Q(p_0_in),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \shiftreg_out_reg[1] 
       (.C(s00_axis_aclk),
        .CE(\shiftreg_out[15]_i_1_n_0 ),
        .D(shiftreg_out[1]),
        .Q(\shiftreg_out_reg_n_0_[1] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \shiftreg_out_reg[2] 
       (.C(s00_axis_aclk),
        .CE(\shiftreg_out[15]_i_1_n_0 ),
        .D(shiftreg_out[2]),
        .Q(\shiftreg_out_reg_n_0_[2] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \shiftreg_out_reg[3] 
       (.C(s00_axis_aclk),
        .CE(\shiftreg_out[15]_i_1_n_0 ),
        .D(shiftreg_out[3]),
        .Q(\shiftreg_out_reg_n_0_[3] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \shiftreg_out_reg[4] 
       (.C(s00_axis_aclk),
        .CE(\shiftreg_out[15]_i_1_n_0 ),
        .D(shiftreg_out[4]),
        .Q(\shiftreg_out_reg_n_0_[4] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \shiftreg_out_reg[5] 
       (.C(s00_axis_aclk),
        .CE(\shiftreg_out[15]_i_1_n_0 ),
        .D(shiftreg_out[5]),
        .Q(\shiftreg_out_reg_n_0_[5] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \shiftreg_out_reg[6] 
       (.C(s00_axis_aclk),
        .CE(\shiftreg_out[15]_i_1_n_0 ),
        .D(shiftreg_out[6]),
        .Q(\shiftreg_out_reg_n_0_[6] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \shiftreg_out_reg[7] 
       (.C(s00_axis_aclk),
        .CE(\shiftreg_out[15]_i_1_n_0 ),
        .D(shiftreg_out[7]),
        .Q(\shiftreg_out_reg_n_0_[7] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \shiftreg_out_reg[8] 
       (.C(s00_axis_aclk),
        .CE(\shiftreg_out[15]_i_1_n_0 ),
        .D(shiftreg_out[8]),
        .Q(\shiftreg_out_reg_n_0_[8] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \shiftreg_out_reg[9] 
       (.C(s00_axis_aclk),
        .CE(\shiftreg_out[15]_i_1_n_0 ),
        .D(shiftreg_out[9]),
        .Q(\shiftreg_out_reg_n_0_[9] ),
        .R(1'b0));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule
`endif
