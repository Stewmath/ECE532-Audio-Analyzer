// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.3 (lin64) Build 2405991 Thu Dec  6 23:36:41 MST 2018
// Date        : Fri Mar 21 18:07:10 2025
// Host        : MattsThinkpad running 64-bit unknown
// Command     : write_verilog -force -mode funcsim -rename_top design_1_keyboard_ip_0_0 -prefix
//               design_1_keyboard_ip_0_0_ design_1_keyboard_ip_0_0_sim_netlist.v
// Design      : design_1_keyboard_ip_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a200tsbg484-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module design_1_keyboard_ip_0_0_PS2Receiver
   (\keycode_reg[0]_0 ,
    \keycode_reg[1]_0 ,
    \keycode_reg[2]_0 ,
    \keycode_reg[3]_0 ,
    \keycode_reg[4]_0 ,
    \keycode_reg[5]_0 ,
    \keycode_reg[6]_0 ,
    \keycode_reg[7]_0 ,
    E,
    Q,
    CLK,
    PS2Clk,
    PS2Data,
    \keycodev_reg[15]_i_5_0 ,
    start_reg);
  output \keycode_reg[0]_0 ;
  output \keycode_reg[1]_0 ;
  output \keycode_reg[2]_0 ;
  output \keycode_reg[3]_0 ;
  output \keycode_reg[4]_0 ;
  output \keycode_reg[5]_0 ;
  output \keycode_reg[6]_0 ;
  output \keycode_reg[7]_0 ;
  output [0:0]E;
  output [7:0]Q;
  input CLK;
  input PS2Clk;
  input PS2Data;
  input [15:0]\keycodev_reg[15]_i_5_0 ;
  input start_reg;

  wire CLK;
  wire [0:0]E;
  wire PS2Clk;
  wire PS2Data;
  wire [7:0]Q;
  (* MARK_DEBUG *) wire [3:0]cnt;
  wire \cnt[3]_i_1_n_0 ;
  wire \cnt[3]_i_2_n_0 ;
  wire data0;
  wire [7:0]datacur;
  wire \datacur[0]_i_1_n_0 ;
  wire \datacur[1]_i_1_n_0 ;
  wire \datacur[2]_i_1_n_0 ;
  wire \datacur[3]_i_1_n_0 ;
  wire \datacur[4]_i_1_n_0 ;
  wire \datacur[5]_i_1_n_0 ;
  wire \datacur[6]_i_1_n_0 ;
  wire \datacur[7]_i_1_n_0 ;
  wire flag;
  (* MARK_DEBUG *) wire flag_0;
  wire flag_i_1_n_0;
  (* MARK_DEBUG *) wire kclkf;
  (* MARK_DEBUG *) wire kdataf;
  wire \keycode_reg[0]_0 ;
  wire \keycode_reg[1]_0 ;
  wire \keycode_reg[2]_0 ;
  wire \keycode_reg[3]_0 ;
  wire \keycode_reg[4]_0 ;
  wire \keycode_reg[5]_0 ;
  wire \keycode_reg[6]_0 ;
  wire \keycode_reg[7]_0 ;
  wire \keycodev[15]_i_11_n_0 ;
  wire \keycodev[15]_i_12_n_0 ;
  wire \keycodev[15]_i_13_n_0 ;
  wire \keycodev[15]_i_14_n_0 ;
  wire \keycodev[15]_i_15_n_0 ;
  wire \keycodev[15]_i_16_n_0 ;
  wire \keycodev[15]_i_17_n_0 ;
  wire \keycodev[15]_i_18_n_0 ;
  wire \keycodev[15]_i_2_n_0 ;
  wire \keycodev[15]_i_3_n_0 ;
  wire \keycodev[15]_i_4_n_0 ;
  wire \keycodev[15]_i_6_n_0 ;
  wire \keycodev[15]_i_7_n_0 ;
  wire \keycodev[15]_i_9_n_0 ;
  wire \keycodev_reg[15]_i_10_n_0 ;
  wire \keycodev_reg[15]_i_10_n_1 ;
  wire \keycodev_reg[15]_i_10_n_2 ;
  wire \keycodev_reg[15]_i_10_n_3 ;
  wire [15:0]\keycodev_reg[15]_i_5_0 ;
  wire \keycodev_reg[15]_i_5_n_3 ;
  wire oflag_i_1_n_0;
  wire [3:0]p_2_in;
  wire pflag;
  wire start_reg;
  wire [3:0]\NLW_keycodev_reg[15]_i_10_O_UNCONNECTED ;
  wire [3:2]\NLW_keycodev_reg[15]_i_5_CO_UNCONNECTED ;
  wire [3:0]\NLW_keycodev_reg[15]_i_5_O_UNCONNECTED ;

  LUT1 #(
    .INIT(2'h1)) 
    \cnt[0]_i_1 
       (.I0(cnt[0]),
        .O(p_2_in[0]));
  LUT2 #(
    .INIT(4'h6)) 
    \cnt[1]_i_1 
       (.I0(cnt[0]),
        .I1(cnt[1]),
        .O(p_2_in[1]));
  LUT3 #(
    .INIT(8'h78)) 
    \cnt[2]_i_1 
       (.I0(cnt[0]),
        .I1(cnt[1]),
        .I2(cnt[2]),
        .O(p_2_in[2]));
  LUT4 #(
    .INIT(16'h0400)) 
    \cnt[3]_i_1 
       (.I0(cnt[0]),
        .I1(cnt[1]),
        .I2(cnt[2]),
        .I3(cnt[3]),
        .O(\cnt[3]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'h57)) 
    \cnt[3]_i_2 
       (.I0(cnt[3]),
        .I1(cnt[2]),
        .I2(cnt[1]),
        .O(\cnt[3]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'h7F80)) 
    \cnt[3]_i_3 
       (.I0(cnt[1]),
        .I1(cnt[0]),
        .I2(cnt[2]),
        .I3(cnt[3]),
        .O(p_2_in[3]));
  (* KEEP = "yes" *) 
  (* XILINX_LEGACY_PRIM = "FDRE_1" *) 
  (* mark_debug = "true" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \cnt_reg[0] 
       (.C(kclkf),
        .CE(\cnt[3]_i_2_n_0 ),
        .D(p_2_in[0]),
        .Q(cnt[0]),
        .R(\cnt[3]_i_1_n_0 ));
  (* KEEP = "yes" *) 
  (* XILINX_LEGACY_PRIM = "FDRE_1" *) 
  (* mark_debug = "true" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \cnt_reg[1] 
       (.C(kclkf),
        .CE(\cnt[3]_i_2_n_0 ),
        .D(p_2_in[1]),
        .Q(cnt[1]),
        .R(\cnt[3]_i_1_n_0 ));
  (* KEEP = "yes" *) 
  (* XILINX_LEGACY_PRIM = "FDRE_1" *) 
  (* mark_debug = "true" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \cnt_reg[2] 
       (.C(kclkf),
        .CE(\cnt[3]_i_2_n_0 ),
        .D(p_2_in[2]),
        .Q(cnt[2]),
        .R(\cnt[3]_i_1_n_0 ));
  (* KEEP = "yes" *) 
  (* XILINX_LEGACY_PRIM = "FDRE_1" *) 
  (* mark_debug = "true" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \cnt_reg[3] 
       (.C(kclkf),
        .CE(\cnt[3]_i_2_n_0 ),
        .D(p_2_in[3]),
        .Q(cnt[3]),
        .R(\cnt[3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFEF00000020)) 
    \datacur[0]_i_1 
       (.I0(kdataf),
        .I1(cnt[2]),
        .I2(cnt[0]),
        .I3(cnt[1]),
        .I4(cnt[3]),
        .I5(datacur[0]),
        .O(\datacur[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFEF00000020)) 
    \datacur[1]_i_1 
       (.I0(kdataf),
        .I1(cnt[2]),
        .I2(cnt[1]),
        .I3(cnt[0]),
        .I4(cnt[3]),
        .I5(datacur[1]),
        .O(\datacur[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFEFFF00002000)) 
    \datacur[2]_i_1 
       (.I0(kdataf),
        .I1(cnt[2]),
        .I2(cnt[1]),
        .I3(cnt[0]),
        .I4(cnt[3]),
        .I5(datacur[2]),
        .O(\datacur[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFEFF00000200)) 
    \datacur[3]_i_1 
       (.I0(kdataf),
        .I1(cnt[1]),
        .I2(cnt[0]),
        .I3(cnt[2]),
        .I4(cnt[3]),
        .I5(datacur[3]),
        .O(\datacur[3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFBFF00000800)) 
    \datacur[4]_i_1 
       (.I0(kdataf),
        .I1(cnt[0]),
        .I2(cnt[1]),
        .I3(cnt[2]),
        .I4(cnt[3]),
        .I5(datacur[4]),
        .O(\datacur[4]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFBFF00000800)) 
    \datacur[5]_i_1 
       (.I0(kdataf),
        .I1(cnt[1]),
        .I2(cnt[0]),
        .I3(cnt[2]),
        .I4(cnt[3]),
        .I5(datacur[5]),
        .O(\datacur[5]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFBFFF00008000)) 
    \datacur[6]_i_1 
       (.I0(kdataf),
        .I1(cnt[1]),
        .I2(cnt[0]),
        .I3(cnt[2]),
        .I4(cnt[3]),
        .I5(datacur[6]),
        .O(\datacur[6]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFB00000008)) 
    \datacur[7]_i_1 
       (.I0(kdataf),
        .I1(cnt[3]),
        .I2(cnt[2]),
        .I3(cnt[1]),
        .I4(cnt[0]),
        .I5(datacur[7]),
        .O(\datacur[7]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \datacur_reg[0] 
       (.C(kclkf),
        .CE(1'b1),
        .D(\datacur[0]_i_1_n_0 ),
        .Q(datacur[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \datacur_reg[1] 
       (.C(kclkf),
        .CE(1'b1),
        .D(\datacur[1]_i_1_n_0 ),
        .Q(datacur[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \datacur_reg[2] 
       (.C(kclkf),
        .CE(1'b1),
        .D(\datacur[2]_i_1_n_0 ),
        .Q(datacur[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \datacur_reg[3] 
       (.C(kclkf),
        .CE(1'b1),
        .D(\datacur[3]_i_1_n_0 ),
        .Q(datacur[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \datacur_reg[4] 
       (.C(kclkf),
        .CE(1'b1),
        .D(\datacur[4]_i_1_n_0 ),
        .Q(datacur[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \datacur_reg[5] 
       (.C(kclkf),
        .CE(1'b1),
        .D(\datacur[5]_i_1_n_0 ),
        .Q(datacur[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \datacur_reg[6] 
       (.C(kclkf),
        .CE(1'b1),
        .D(\datacur[6]_i_1_n_0 ),
        .Q(datacur[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \datacur_reg[7] 
       (.C(kclkf),
        .CE(1'b1),
        .D(\datacur[7]_i_1_n_0 ),
        .Q(datacur[7]),
        .R(1'b0));
  (* COUNT_MAX = "14" *) 
  (* COUNT_WIDTH = "5" *) 
  design_1_keyboard_ip_0_0_debouncer db_clk
       (.I(PS2Clk),
        .O(kclkf),
        .clk(CLK));
  (* COUNT_MAX = "19" *) 
  (* COUNT_WIDTH = "5" *) 
  design_1_keyboard_ip_0_0_debouncer__parameterized0 db_data
       (.I(PS2Data),
        .O(kdataf),
        .clk(CLK));
  LUT5 #(
    .INIT(32'hFFBF0020)) 
    flag_i_1
       (.I0(cnt[0]),
        .I1(cnt[1]),
        .I2(cnt[3]),
        .I3(cnt[2]),
        .I4(flag_0),
        .O(flag_i_1_n_0));
  (* KEEP = "yes" *) 
  (* XILINX_LEGACY_PRIM = "FD_1" *) 
  (* mark_debug = "true" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    flag_reg
       (.C(kclkf),
        .CE(1'b1),
        .D(flag_i_1_n_0),
        .Q(flag_0),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \keycode_reg[0] 
       (.C(CLK),
        .CE(oflag_i_1_n_0),
        .D(datacur[0]),
        .Q(\keycode_reg[0]_0 ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \keycode_reg[10] 
       (.C(CLK),
        .CE(oflag_i_1_n_0),
        .D(\keycode_reg[2]_0 ),
        .Q(Q[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \keycode_reg[11] 
       (.C(CLK),
        .CE(oflag_i_1_n_0),
        .D(\keycode_reg[3]_0 ),
        .Q(Q[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \keycode_reg[12] 
       (.C(CLK),
        .CE(oflag_i_1_n_0),
        .D(\keycode_reg[4]_0 ),
        .Q(Q[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \keycode_reg[13] 
       (.C(CLK),
        .CE(oflag_i_1_n_0),
        .D(\keycode_reg[5]_0 ),
        .Q(Q[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \keycode_reg[14] 
       (.C(CLK),
        .CE(oflag_i_1_n_0),
        .D(\keycode_reg[6]_0 ),
        .Q(Q[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \keycode_reg[15] 
       (.C(CLK),
        .CE(oflag_i_1_n_0),
        .D(\keycode_reg[7]_0 ),
        .Q(Q[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \keycode_reg[1] 
       (.C(CLK),
        .CE(oflag_i_1_n_0),
        .D(datacur[1]),
        .Q(\keycode_reg[1]_0 ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \keycode_reg[2] 
       (.C(CLK),
        .CE(oflag_i_1_n_0),
        .D(datacur[2]),
        .Q(\keycode_reg[2]_0 ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \keycode_reg[3] 
       (.C(CLK),
        .CE(oflag_i_1_n_0),
        .D(datacur[3]),
        .Q(\keycode_reg[3]_0 ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \keycode_reg[4] 
       (.C(CLK),
        .CE(oflag_i_1_n_0),
        .D(datacur[4]),
        .Q(\keycode_reg[4]_0 ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \keycode_reg[5] 
       (.C(CLK),
        .CE(oflag_i_1_n_0),
        .D(datacur[5]),
        .Q(\keycode_reg[5]_0 ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \keycode_reg[6] 
       (.C(CLK),
        .CE(oflag_i_1_n_0),
        .D(datacur[6]),
        .Q(\keycode_reg[6]_0 ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \keycode_reg[7] 
       (.C(CLK),
        .CE(oflag_i_1_n_0),
        .D(datacur[7]),
        .Q(\keycode_reg[7]_0 ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \keycode_reg[8] 
       (.C(CLK),
        .CE(oflag_i_1_n_0),
        .D(\keycode_reg[0]_0 ),
        .Q(Q[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \keycode_reg[9] 
       (.C(CLK),
        .CE(oflag_i_1_n_0),
        .D(\keycode_reg[1]_0 ),
        .Q(Q[1]),
        .R(1'b0));
  LUT6 #(
    .INIT(64'h000000007F7FFF00)) 
    \keycodev[15]_i_1 
       (.I0(\keycodev[15]_i_2_n_0 ),
        .I1(\keycodev[15]_i_3_n_0 ),
        .I2(\keycodev[15]_i_4_n_0 ),
        .I3(data0),
        .I4(\keycodev[15]_i_6_n_0 ),
        .I5(\keycodev[15]_i_7_n_0 ),
        .O(E));
  LUT2 #(
    .INIT(4'h9)) 
    \keycodev[15]_i_11 
       (.I0(\keycodev_reg[15]_i_5_0 [15]),
        .I1(Q[7]),
        .O(\keycodev[15]_i_11_n_0 ));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    \keycodev[15]_i_12 
       (.I0(Q[4]),
        .I1(\keycodev_reg[15]_i_5_0 [12]),
        .I2(Q[5]),
        .I3(\keycodev_reg[15]_i_5_0 [13]),
        .I4(\keycodev_reg[15]_i_5_0 [14]),
        .I5(Q[6]),
        .O(\keycodev[15]_i_12_n_0 ));
  LUT4 #(
    .INIT(16'h0010)) 
    \keycodev[15]_i_13 
       (.I0(Q[2]),
        .I1(Q[1]),
        .I2(Q[5]),
        .I3(Q[0]),
        .O(\keycodev[15]_i_13_n_0 ));
  LUT4 #(
    .INIT(16'h0001)) 
    \keycodev[15]_i_14 
       (.I0(\keycode_reg[2]_0 ),
        .I1(\keycode_reg[1]_0 ),
        .I2(\keycode_reg[3]_0 ),
        .I3(\keycode_reg[0]_0 ),
        .O(\keycodev[15]_i_14_n_0 ));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    \keycodev[15]_i_15 
       (.I0(Q[1]),
        .I1(\keycodev_reg[15]_i_5_0 [9]),
        .I2(Q[2]),
        .I3(\keycodev_reg[15]_i_5_0 [10]),
        .I4(\keycodev_reg[15]_i_5_0 [11]),
        .I5(Q[3]),
        .O(\keycodev[15]_i_15_n_0 ));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    \keycodev[15]_i_16 
       (.I0(\keycode_reg[6]_0 ),
        .I1(\keycodev_reg[15]_i_5_0 [6]),
        .I2(\keycode_reg[7]_0 ),
        .I3(\keycodev_reg[15]_i_5_0 [7]),
        .I4(\keycodev_reg[15]_i_5_0 [8]),
        .I5(Q[0]),
        .O(\keycodev[15]_i_16_n_0 ));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    \keycodev[15]_i_17 
       (.I0(\keycodev_reg[15]_i_5_0 [5]),
        .I1(\keycode_reg[5]_0 ),
        .I2(\keycode_reg[4]_0 ),
        .I3(\keycodev_reg[15]_i_5_0 [4]),
        .I4(\keycode_reg[3]_0 ),
        .I5(\keycodev_reg[15]_i_5_0 [3]),
        .O(\keycodev[15]_i_17_n_0 ));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    \keycodev[15]_i_18 
       (.I0(\keycodev_reg[15]_i_5_0 [2]),
        .I1(\keycode_reg[2]_0 ),
        .I2(\keycode_reg[0]_0 ),
        .I3(\keycodev_reg[15]_i_5_0 [0]),
        .I4(\keycode_reg[1]_0 ),
        .I5(\keycodev_reg[15]_i_5_0 [1]),
        .O(\keycodev[15]_i_18_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFD00000000)) 
    \keycodev[15]_i_2 
       (.I0(start_reg),
        .I1(\keycodev_reg[15]_i_5_0 [11]),
        .I2(\keycodev_reg[15]_i_5_0 [10]),
        .I3(\keycodev_reg[15]_i_5_0 [9]),
        .I4(\keycodev_reg[15]_i_5_0 [8]),
        .I5(\keycodev[15]_i_9_n_0 ),
        .O(\keycodev[15]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    \keycodev[15]_i_3 
       (.I0(\keycodev_reg[15]_i_5_0 [2]),
        .I1(\keycode_reg[2]_0 ),
        .I2(\keycode_reg[0]_0 ),
        .I3(\keycodev_reg[15]_i_5_0 [0]),
        .I4(\keycode_reg[1]_0 ),
        .I5(\keycodev_reg[15]_i_5_0 [1]),
        .O(\keycodev[15]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    \keycodev[15]_i_4 
       (.I0(\keycodev_reg[15]_i_5_0 [5]),
        .I1(\keycode_reg[5]_0 ),
        .I2(\keycode_reg[4]_0 ),
        .I3(\keycodev_reg[15]_i_5_0 [4]),
        .I4(\keycode_reg[3]_0 ),
        .I5(\keycodev_reg[15]_i_5_0 [3]),
        .O(\keycodev[15]_i_4_n_0 ));
  LUT5 #(
    .INIT(32'hBFFFFFFF)) 
    \keycodev[15]_i_6 
       (.I0(Q[3]),
        .I1(Q[6]),
        .I2(Q[4]),
        .I3(Q[7]),
        .I4(\keycodev[15]_i_13_n_0 ),
        .O(\keycodev[15]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hD555555555555555)) 
    \keycodev[15]_i_7 
       (.I0(flag),
        .I1(\keycodev[15]_i_14_n_0 ),
        .I2(\keycode_reg[7]_0 ),
        .I3(\keycode_reg[4]_0 ),
        .I4(\keycode_reg[6]_0 ),
        .I5(\keycode_reg[5]_0 ),
        .O(\keycodev[15]_i_7_n_0 ));
  LUT4 #(
    .INIT(16'h9009)) 
    \keycodev[15]_i_9 
       (.I0(\keycodev_reg[15]_i_5_0 [7]),
        .I1(\keycode_reg[7]_0 ),
        .I2(\keycodev_reg[15]_i_5_0 [6]),
        .I3(\keycode_reg[6]_0 ),
        .O(\keycodev[15]_i_9_n_0 ));
  CARRY4 \keycodev_reg[15]_i_10 
       (.CI(1'b0),
        .CO({\keycodev_reg[15]_i_10_n_0 ,\keycodev_reg[15]_i_10_n_1 ,\keycodev_reg[15]_i_10_n_2 ,\keycodev_reg[15]_i_10_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b1,1'b1,1'b1,1'b1}),
        .O(\NLW_keycodev_reg[15]_i_10_O_UNCONNECTED [3:0]),
        .S({\keycodev[15]_i_15_n_0 ,\keycodev[15]_i_16_n_0 ,\keycodev[15]_i_17_n_0 ,\keycodev[15]_i_18_n_0 }));
  CARRY4 \keycodev_reg[15]_i_5 
       (.CI(\keycodev_reg[15]_i_10_n_0 ),
        .CO({\NLW_keycodev_reg[15]_i_5_CO_UNCONNECTED [3:2],data0,\keycodev_reg[15]_i_5_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b1,1'b1}),
        .O(\NLW_keycodev_reg[15]_i_5_O_UNCONNECTED [3:0]),
        .S({1'b0,1'b0,\keycodev[15]_i_11_n_0 ,\keycodev[15]_i_12_n_0 }));
  LUT2 #(
    .INIT(4'h2)) 
    oflag_i_1
       (.I0(flag_0),
        .I1(pflag),
        .O(oflag_i_1_n_0));
  FDRE oflag_reg
       (.C(CLK),
        .CE(1'b1),
        .D(oflag_i_1_n_0),
        .Q(flag),
        .R(1'b0));
  FDRE pflag_reg
       (.C(CLK),
        .CE(1'b1),
        .D(flag_0),
        .Q(pflag),
        .R(1'b0));
endmodule

(* COUNT_MAX = "14" *) (* COUNT_WIDTH = "5" *) 
module design_1_keyboard_ip_0_0_debouncer
   (clk,
    I,
    O);
  input clk;
  input I;
  output O;

  wire I;
  wire Iv;
  wire O;
  wire O_i_1_n_0;
  wire O_i_2_n_0;
  wire clk;
  wire \count[0]_i_1_n_0 ;
  wire \count[1]_i_1_n_0 ;
  wire \count[2]_i_1_n_0 ;
  wire \count[3]_i_1_n_0 ;
  wire \count[4]_i_1_n_0 ;
  wire \count[4]_i_2_n_0 ;
  wire [4:0]count_reg;

  FDRE #(
    .INIT(1'b0)) 
    Iv_reg
       (.C(clk),
        .CE(1'b1),
        .D(I),
        .Q(Iv),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'hFE08)) 
    O_i_1
       (.I0(I),
        .I1(Iv),
        .I2(O_i_2_n_0),
        .I3(O),
        .O(O_i_1_n_0));
  LUT5 #(
    .INIT(32'hEFFFFFFF)) 
    O_i_2
       (.I0(count_reg[4]),
        .I1(count_reg[0]),
        .I2(count_reg[3]),
        .I3(count_reg[1]),
        .I4(count_reg[2]),
        .O(O_i_2_n_0));
  FDRE O_reg
       (.C(clk),
        .CE(1'b1),
        .D(O_i_1_n_0),
        .Q(O),
        .R(1'b0));
  LUT6 #(
    .INIT(64'h2022222222222222)) 
    \count[0]_i_1 
       (.I0(\count[4]_i_2_n_0 ),
        .I1(count_reg[0]),
        .I2(count_reg[4]),
        .I3(count_reg[3]),
        .I4(count_reg[1]),
        .I5(count_reg[2]),
        .O(\count[0]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'h60)) 
    \count[1]_i_1 
       (.I0(count_reg[0]),
        .I1(count_reg[1]),
        .I2(\count[4]_i_2_n_0 ),
        .O(\count[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'h7800)) 
    \count[2]_i_1 
       (.I0(count_reg[0]),
        .I1(count_reg[1]),
        .I2(count_reg[2]),
        .I3(\count[4]_i_2_n_0 ),
        .O(\count[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h6CCC0000)) 
    \count[3]_i_1 
       (.I0(count_reg[0]),
        .I1(count_reg[3]),
        .I2(count_reg[1]),
        .I3(count_reg[2]),
        .I4(\count[4]_i_2_n_0 ),
        .O(\count[3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h2AAAAAAA80000000)) 
    \count[4]_i_1 
       (.I0(\count[4]_i_2_n_0 ),
        .I1(count_reg[2]),
        .I2(count_reg[1]),
        .I3(count_reg[3]),
        .I4(count_reg[0]),
        .I5(count_reg[4]),
        .O(\count[4]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT2 #(
    .INIT(4'h9)) 
    \count[4]_i_2 
       (.I0(Iv),
        .I1(I),
        .O(\count[4]_i_2_n_0 ));
  FDRE \count_reg[0] 
       (.C(clk),
        .CE(1'b1),
        .D(\count[0]_i_1_n_0 ),
        .Q(count_reg[0]),
        .R(1'b0));
  FDRE \count_reg[1] 
       (.C(clk),
        .CE(1'b1),
        .D(\count[1]_i_1_n_0 ),
        .Q(count_reg[1]),
        .R(1'b0));
  FDRE \count_reg[2] 
       (.C(clk),
        .CE(1'b1),
        .D(\count[2]_i_1_n_0 ),
        .Q(count_reg[2]),
        .R(1'b0));
  FDRE \count_reg[3] 
       (.C(clk),
        .CE(1'b1),
        .D(\count[3]_i_1_n_0 ),
        .Q(count_reg[3]),
        .R(1'b0));
  FDRE \count_reg[4] 
       (.C(clk),
        .CE(1'b1),
        .D(\count[4]_i_1_n_0 ),
        .Q(count_reg[4]),
        .R(1'b0));
endmodule

(* COUNT_MAX = "19" *) (* COUNT_WIDTH = "5" *) (* ORIG_REF_NAME = "debouncer" *) 
module design_1_keyboard_ip_0_0_debouncer__parameterized0
   (clk,
    I,
    O);
  input clk;
  input I;
  output O;

  wire I;
  wire Iv;
  wire O;
  wire O_i_1_n_0;
  wire O_i_2_n_0;
  wire clk;
  wire \count[0]_i_1_n_0 ;
  wire \count[1]_i_1_n_0 ;
  wire \count[2]_i_1_n_0 ;
  wire \count[3]_i_1_n_0 ;
  wire \count[4]_i_1_n_0 ;
  wire \count[4]_i_2_n_0 ;
  wire [4:0]count_reg;

  FDRE #(
    .INIT(1'b0)) 
    Iv_reg
       (.C(clk),
        .CE(1'b1),
        .D(I),
        .Q(Iv),
        .R(1'b0));
  LUT6 #(
    .INIT(64'hEFFFFFFF20000000)) 
    O_i_1
       (.I0(I),
        .I1(count_reg[2]),
        .I2(count_reg[0]),
        .I3(count_reg[1]),
        .I4(O_i_2_n_0),
        .I5(O),
        .O(O_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT4 #(
    .INIT(16'h0090)) 
    O_i_2
       (.I0(I),
        .I1(Iv),
        .I2(count_reg[4]),
        .I3(count_reg[3]),
        .O(O_i_2_n_0));
  FDRE O_reg
       (.C(clk),
        .CE(1'b1),
        .D(O_i_1_n_0),
        .Q(O),
        .R(1'b0));
  LUT6 #(
    .INIT(64'h4444444444C44444)) 
    \count[0]_i_1 
       (.I0(count_reg[0]),
        .I1(\count[4]_i_2_n_0 ),
        .I2(count_reg[4]),
        .I3(count_reg[3]),
        .I4(count_reg[1]),
        .I5(count_reg[2]),
        .O(\count[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h1000FF00FF000000)) 
    \count[1]_i_1 
       (.I0(count_reg[2]),
        .I1(count_reg[3]),
        .I2(count_reg[4]),
        .I3(\count[4]_i_2_n_0 ),
        .I4(count_reg[1]),
        .I5(count_reg[0]),
        .O(\count[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0D00F000F000F000)) 
    \count[2]_i_1 
       (.I0(count_reg[4]),
        .I1(count_reg[3]),
        .I2(count_reg[2]),
        .I3(\count[4]_i_2_n_0 ),
        .I4(count_reg[1]),
        .I5(count_reg[0]),
        .O(\count[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h7F00007F80000080)) 
    \count[3]_i_1 
       (.I0(count_reg[1]),
        .I1(count_reg[0]),
        .I2(count_reg[2]),
        .I3(I),
        .I4(Iv),
        .I5(count_reg[3]),
        .O(\count[3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h7FFF000080000000)) 
    \count[4]_i_1 
       (.I0(count_reg[3]),
        .I1(count_reg[1]),
        .I2(count_reg[0]),
        .I3(count_reg[2]),
        .I4(\count[4]_i_2_n_0 ),
        .I5(count_reg[4]),
        .O(\count[4]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT2 #(
    .INIT(4'h9)) 
    \count[4]_i_2 
       (.I0(Iv),
        .I1(I),
        .O(\count[4]_i_2_n_0 ));
  FDRE \count_reg[0] 
       (.C(clk),
        .CE(1'b1),
        .D(\count[0]_i_1_n_0 ),
        .Q(count_reg[0]),
        .R(1'b0));
  FDRE \count_reg[1] 
       (.C(clk),
        .CE(1'b1),
        .D(\count[1]_i_1_n_0 ),
        .Q(count_reg[1]),
        .R(1'b0));
  FDRE \count_reg[2] 
       (.C(clk),
        .CE(1'b1),
        .D(\count[2]_i_1_n_0 ),
        .Q(count_reg[2]),
        .R(1'b0));
  FDRE \count_reg[3] 
       (.C(clk),
        .CE(1'b1),
        .D(\count[3]_i_1_n_0 ),
        .Q(count_reg[3]),
        .R(1'b0));
  FDRE \count_reg[4] 
       (.C(clk),
        .CE(1'b1),
        .D(\count[4]_i_1_n_0 ),
        .Q(count_reg[4]),
        .R(1'b0));
endmodule

(* CHECK_LICENSE_TYPE = "design_1_keyboard_ip_0_0,top,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* IP_DEFINITION_SOURCE = "package_project" *) 
(* X_CORE_INFO = "top,Vivado 2018.3" *) 
(* NotValidForBitStream *)
module design_1_keyboard_ip_0_0
   (clk,
    PS2Data,
    PS2Clk,
    s00_axis_aclk,
    s00_axis_aresetn,
    s00_axis_tready,
    s00_axis_tlast,
    s00_axis_tdata,
    s00_axis_tvalid);
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 clk CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME clk, ASSOCIATED_BUSIF s00_axis, FREQ_HZ 100000000, PHASE 0.0, CLK_DOMAIN /clk_wiz_0_clk_out1, INSERT_VIP 0" *) input clk;
  input PS2Data;
  input PS2Clk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 s00_axis_aclk CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME s00_axis_aclk, ASSOCIATED_RESET s00_axis_aresetn, FREQ_HZ 100000000, PHASE 0.0, CLK_DOMAIN /clk_wiz_0_clk_out1, INSERT_VIP 0" *) input s00_axis_aclk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 s00_axis_aresetn RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME s00_axis_aresetn, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) input s00_axis_aresetn;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s00_axis TREADY" *) input s00_axis_tready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s00_axis TLAST" *) output s00_axis_tlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s00_axis TDATA" *) output [31:0]s00_axis_tdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s00_axis TVALID" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME s00_axis, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 1, FREQ_HZ 100000000, PHASE 0.0, CLK_DOMAIN /clk_wiz_0_clk_out1, LAYERED_METADATA undef, INSERT_VIP 0" *) output s00_axis_tvalid;

  wire PS2Clk;
  wire PS2Data;
  wire clk;
  wire s00_axis_aclk;
  wire s00_axis_aresetn;
  wire [31:0]s00_axis_tdata;
  wire s00_axis_tlast;
  wire s00_axis_tready;
  wire s00_axis_tvalid;

  design_1_keyboard_ip_0_0_top inst
       (.PS2Clk(PS2Clk),
        .PS2Data(PS2Data),
        .clk(clk),
        .s00_axis_aclk(s00_axis_aclk),
        .s00_axis_aresetn(s00_axis_aresetn),
        .s00_axis_tdata(s00_axis_tdata),
        .s00_axis_tlast(s00_axis_tlast),
        .s00_axis_tready(s00_axis_tready),
        .s00_axis_tvalid(s00_axis_tvalid));
endmodule

module design_1_keyboard_ip_0_0_top
   (clk,
    PS2Data,
    PS2Clk,
    s00_axis_aclk,
    s00_axis_aresetn,
    s00_axis_tready,
    s00_axis_tlast,
    s00_axis_tdata,
    s00_axis_tvalid);
  input clk;
  input PS2Data;
  input PS2Clk;
  input s00_axis_aclk;
  input s00_axis_aresetn;
  input s00_axis_tready;
  output s00_axis_tlast;
  output [31:0]s00_axis_tdata;
  output s00_axis_tvalid;

  wire \<const0> ;
  wire \<const1> ;
  wire CLK50MHZ;
  wire CLK50MHZ_i_1_n_0;
  wire PS2Clk;
  wire PS2Data;
  wire clk;
  wire [15:8]keycodev;
  wire \keycodev[15]_i_8_n_0 ;
  wire [7:0]keycodev__0;
  wire s00_axis_aclk;
  wire s00_axis_aresetn;
  wire [15:0]\^s00_axis_tdata ;
  wire \s00_axis_tdata[15]_i_1_n_0 ;
  wire s00_axis_tready;
  wire s00_axis_tvalid;
  wire s00_axis_tvalid_i_1_n_0;
  wire [7:0]sel0;
  wire start;
  wire start0;
  wire uut_n_0;
  wire uut_n_1;
  wire uut_n_2;
  wire uut_n_3;
  wire uut_n_4;
  wire uut_n_5;
  wire uut_n_6;
  wire uut_n_7;

  assign s00_axis_tdata[31] = \<const0> ;
  assign s00_axis_tdata[30] = \<const0> ;
  assign s00_axis_tdata[29] = \<const0> ;
  assign s00_axis_tdata[28] = \<const0> ;
  assign s00_axis_tdata[27] = \<const0> ;
  assign s00_axis_tdata[26] = \<const0> ;
  assign s00_axis_tdata[25] = \<const0> ;
  assign s00_axis_tdata[24] = \<const0> ;
  assign s00_axis_tdata[23] = \<const0> ;
  assign s00_axis_tdata[22] = \<const0> ;
  assign s00_axis_tdata[21] = \<const0> ;
  assign s00_axis_tdata[20] = \<const0> ;
  assign s00_axis_tdata[19] = \<const0> ;
  assign s00_axis_tdata[18] = \<const0> ;
  assign s00_axis_tdata[17] = \<const0> ;
  assign s00_axis_tdata[16] = \<const0> ;
  assign s00_axis_tdata[15:0] = \^s00_axis_tdata [15:0];
  assign s00_axis_tlast = \<const1> ;
  LUT1 #(
    .INIT(2'h1)) 
    CLK50MHZ_i_1
       (.I0(CLK50MHZ),
        .O(CLK50MHZ_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    CLK50MHZ_reg
       (.C(clk),
        .CE(1'b1),
        .D(CLK50MHZ_i_1_n_0),
        .Q(CLK50MHZ),
        .R(1'b0));
  GND GND
       (.G(\<const0> ));
  VCC VCC
       (.P(\<const1> ));
  LUT4 #(
    .INIT(16'h8000)) 
    \keycodev[15]_i_8 
       (.I0(keycodev[13]),
        .I1(keycodev[12]),
        .I2(keycodev[15]),
        .I3(keycodev[14]),
        .O(\keycodev[15]_i_8_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \keycodev_reg[0] 
       (.C(clk),
        .CE(start0),
        .D(uut_n_0),
        .Q(keycodev__0[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \keycodev_reg[10] 
       (.C(clk),
        .CE(start0),
        .D(sel0[2]),
        .Q(keycodev[10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \keycodev_reg[11] 
       (.C(clk),
        .CE(start0),
        .D(sel0[3]),
        .Q(keycodev[11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \keycodev_reg[12] 
       (.C(clk),
        .CE(start0),
        .D(sel0[4]),
        .Q(keycodev[12]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \keycodev_reg[13] 
       (.C(clk),
        .CE(start0),
        .D(sel0[5]),
        .Q(keycodev[13]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \keycodev_reg[14] 
       (.C(clk),
        .CE(start0),
        .D(sel0[6]),
        .Q(keycodev[14]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \keycodev_reg[15] 
       (.C(clk),
        .CE(start0),
        .D(sel0[7]),
        .Q(keycodev[15]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \keycodev_reg[1] 
       (.C(clk),
        .CE(start0),
        .D(uut_n_1),
        .Q(keycodev__0[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \keycodev_reg[2] 
       (.C(clk),
        .CE(start0),
        .D(uut_n_2),
        .Q(keycodev__0[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \keycodev_reg[3] 
       (.C(clk),
        .CE(start0),
        .D(uut_n_3),
        .Q(keycodev__0[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \keycodev_reg[4] 
       (.C(clk),
        .CE(start0),
        .D(uut_n_4),
        .Q(keycodev__0[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \keycodev_reg[5] 
       (.C(clk),
        .CE(start0),
        .D(uut_n_5),
        .Q(keycodev__0[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \keycodev_reg[6] 
       (.C(clk),
        .CE(start0),
        .D(uut_n_6),
        .Q(keycodev__0[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \keycodev_reg[7] 
       (.C(clk),
        .CE(start0),
        .D(uut_n_7),
        .Q(keycodev__0[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \keycodev_reg[8] 
       (.C(clk),
        .CE(start0),
        .D(sel0[0]),
        .Q(keycodev[8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \keycodev_reg[9] 
       (.C(clk),
        .CE(start0),
        .D(sel0[1]),
        .Q(keycodev[9]),
        .R(1'b0));
  LUT1 #(
    .INIT(2'h1)) 
    \s00_axis_tdata[15]_i_1 
       (.I0(s00_axis_aresetn),
        .O(\s00_axis_tdata[15]_i_1_n_0 ));
  FDRE \s00_axis_tdata_reg[0] 
       (.C(s00_axis_aclk),
        .CE(start),
        .D(keycodev__0[0]),
        .Q(\^s00_axis_tdata [0]),
        .R(\s00_axis_tdata[15]_i_1_n_0 ));
  FDRE \s00_axis_tdata_reg[10] 
       (.C(s00_axis_aclk),
        .CE(start),
        .D(keycodev[10]),
        .Q(\^s00_axis_tdata [10]),
        .R(\s00_axis_tdata[15]_i_1_n_0 ));
  FDRE \s00_axis_tdata_reg[11] 
       (.C(s00_axis_aclk),
        .CE(start),
        .D(keycodev[11]),
        .Q(\^s00_axis_tdata [11]),
        .R(\s00_axis_tdata[15]_i_1_n_0 ));
  FDRE \s00_axis_tdata_reg[12] 
       (.C(s00_axis_aclk),
        .CE(start),
        .D(keycodev[12]),
        .Q(\^s00_axis_tdata [12]),
        .R(\s00_axis_tdata[15]_i_1_n_0 ));
  FDRE \s00_axis_tdata_reg[13] 
       (.C(s00_axis_aclk),
        .CE(start),
        .D(keycodev[13]),
        .Q(\^s00_axis_tdata [13]),
        .R(\s00_axis_tdata[15]_i_1_n_0 ));
  FDRE \s00_axis_tdata_reg[14] 
       (.C(s00_axis_aclk),
        .CE(start),
        .D(keycodev[14]),
        .Q(\^s00_axis_tdata [14]),
        .R(\s00_axis_tdata[15]_i_1_n_0 ));
  FDRE \s00_axis_tdata_reg[15] 
       (.C(s00_axis_aclk),
        .CE(start),
        .D(keycodev[15]),
        .Q(\^s00_axis_tdata [15]),
        .R(\s00_axis_tdata[15]_i_1_n_0 ));
  FDRE \s00_axis_tdata_reg[1] 
       (.C(s00_axis_aclk),
        .CE(start),
        .D(keycodev__0[1]),
        .Q(\^s00_axis_tdata [1]),
        .R(\s00_axis_tdata[15]_i_1_n_0 ));
  FDRE \s00_axis_tdata_reg[2] 
       (.C(s00_axis_aclk),
        .CE(start),
        .D(keycodev__0[2]),
        .Q(\^s00_axis_tdata [2]),
        .R(\s00_axis_tdata[15]_i_1_n_0 ));
  FDRE \s00_axis_tdata_reg[3] 
       (.C(s00_axis_aclk),
        .CE(start),
        .D(keycodev__0[3]),
        .Q(\^s00_axis_tdata [3]),
        .R(\s00_axis_tdata[15]_i_1_n_0 ));
  FDRE \s00_axis_tdata_reg[4] 
       (.C(s00_axis_aclk),
        .CE(start),
        .D(keycodev__0[4]),
        .Q(\^s00_axis_tdata [4]),
        .R(\s00_axis_tdata[15]_i_1_n_0 ));
  FDRE \s00_axis_tdata_reg[5] 
       (.C(s00_axis_aclk),
        .CE(start),
        .D(keycodev__0[5]),
        .Q(\^s00_axis_tdata [5]),
        .R(\s00_axis_tdata[15]_i_1_n_0 ));
  FDRE \s00_axis_tdata_reg[6] 
       (.C(s00_axis_aclk),
        .CE(start),
        .D(keycodev__0[6]),
        .Q(\^s00_axis_tdata [6]),
        .R(\s00_axis_tdata[15]_i_1_n_0 ));
  FDRE \s00_axis_tdata_reg[7] 
       (.C(s00_axis_aclk),
        .CE(start),
        .D(keycodev__0[7]),
        .Q(\^s00_axis_tdata [7]),
        .R(\s00_axis_tdata[15]_i_1_n_0 ));
  FDRE \s00_axis_tdata_reg[8] 
       (.C(s00_axis_aclk),
        .CE(start),
        .D(keycodev[8]),
        .Q(\^s00_axis_tdata [8]),
        .R(\s00_axis_tdata[15]_i_1_n_0 ));
  FDRE \s00_axis_tdata_reg[9] 
       (.C(s00_axis_aclk),
        .CE(start),
        .D(keycodev[9]),
        .Q(\^s00_axis_tdata [9]),
        .R(\s00_axis_tdata[15]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hF200)) 
    s00_axis_tvalid_i_1
       (.I0(s00_axis_tvalid),
        .I1(s00_axis_tready),
        .I2(start),
        .I3(s00_axis_aresetn),
        .O(s00_axis_tvalid_i_1_n_0));
  FDRE s00_axis_tvalid_reg
       (.C(s00_axis_aclk),
        .CE(1'b1),
        .D(s00_axis_tvalid_i_1_n_0),
        .Q(s00_axis_tvalid),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    start_reg
       (.C(clk),
        .CE(1'b1),
        .D(start0),
        .Q(start),
        .R(1'b0));
  design_1_keyboard_ip_0_0_PS2Receiver uut
       (.CLK(CLK50MHZ),
        .E(start0),
        .PS2Clk(PS2Clk),
        .PS2Data(PS2Data),
        .Q(sel0),
        .\keycode_reg[0]_0 (uut_n_0),
        .\keycode_reg[1]_0 (uut_n_1),
        .\keycode_reg[2]_0 (uut_n_2),
        .\keycode_reg[3]_0 (uut_n_3),
        .\keycode_reg[4]_0 (uut_n_4),
        .\keycode_reg[5]_0 (uut_n_5),
        .\keycode_reg[6]_0 (uut_n_6),
        .\keycode_reg[7]_0 (uut_n_7),
        .\keycodev_reg[15]_i_5_0 ({keycodev,keycodev__0}),
        .start_reg(\keycodev[15]_i_8_n_0 ));
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
