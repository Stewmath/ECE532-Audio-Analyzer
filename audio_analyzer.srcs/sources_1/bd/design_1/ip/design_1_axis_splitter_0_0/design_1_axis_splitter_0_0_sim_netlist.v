// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.3 (lin64) Build 2405991 Thu Dec  6 23:36:41 MST 2018
// Date        : Sun Mar 30 01:53:52 2025
// Host        : MattsThinkpad running 64-bit unknown
// Command     : write_verilog -force -mode funcsim -rename_top design_1_axis_splitter_0_0 -prefix
//               design_1_axis_splitter_0_0_ design_1_axis_splitter_0_0_sim_netlist.v
// Design      : design_1_axis_splitter_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a200tsbg484-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module design_1_axis_splitter_0_0_axis_splitter
   (out2_axis_tdata,
    in_axis_tready_reg_0,
    out2_axis_tvalid_reg_0,
    out1_axis_tvalid_reg_0,
    in_axis_tdata,
    in_axis_aclk,
    in_axis_aresetn,
    in_axis_tvalid,
    out2_axis_tready,
    out1_axis_tready);
  output [31:0]out2_axis_tdata;
  output in_axis_tready_reg_0;
  output out2_axis_tvalid_reg_0;
  output out1_axis_tvalid_reg_0;
  input [31:0]in_axis_tdata;
  input in_axis_aclk;
  input in_axis_aresetn;
  input in_axis_tvalid;
  input out2_axis_tready;
  input out1_axis_tready;

  wire in_axis_aclk;
  wire in_axis_aresetn;
  wire [31:0]in_axis_tdata;
  wire in_axis_tready_i_1_n_0;
  wire in_axis_tready_reg_0;
  wire in_axis_tvalid;
  wire \out1_axis_tdata[31]_i_1_n_0 ;
  wire out1_axis_tready;
  wire out1_axis_tvalid_i_1_n_0;
  wire out1_axis_tvalid_reg_0;
  wire [31:0]out2_axis_tdata;
  wire out2_axis_tready;
  wire out2_axis_tvalid_i_1_n_0;
  wire out2_axis_tvalid_reg_0;
  wire stored_data_valid_i_1_n_0;
  wire stored_data_valid_reg_n_0;

  LUT6 #(
    .INIT(64'h2F2F2F2F2F2FFF2F)) 
    in_axis_tready_i_1
       (.I0(in_axis_tready_reg_0),
        .I1(in_axis_tvalid),
        .I2(in_axis_aresetn),
        .I3(stored_data_valid_reg_n_0),
        .I4(out1_axis_tvalid_reg_0),
        .I5(out2_axis_tvalid_reg_0),
        .O(in_axis_tready_i_1_n_0));
  FDRE in_axis_tready_reg
       (.C(in_axis_aclk),
        .CE(1'b1),
        .D(in_axis_tready_i_1_n_0),
        .Q(in_axis_tready_reg_0),
        .R(1'b0));
  LUT3 #(
    .INIT(8'h80)) 
    \out1_axis_tdata[31]_i_1 
       (.I0(in_axis_aresetn),
        .I1(in_axis_tready_reg_0),
        .I2(in_axis_tvalid),
        .O(\out1_axis_tdata[31]_i_1_n_0 ));
  FDRE \out1_axis_tdata_reg[0] 
       (.C(in_axis_aclk),
        .CE(\out1_axis_tdata[31]_i_1_n_0 ),
        .D(in_axis_tdata[0]),
        .Q(out2_axis_tdata[0]),
        .R(1'b0));
  FDRE \out1_axis_tdata_reg[10] 
       (.C(in_axis_aclk),
        .CE(\out1_axis_tdata[31]_i_1_n_0 ),
        .D(in_axis_tdata[10]),
        .Q(out2_axis_tdata[10]),
        .R(1'b0));
  FDRE \out1_axis_tdata_reg[11] 
       (.C(in_axis_aclk),
        .CE(\out1_axis_tdata[31]_i_1_n_0 ),
        .D(in_axis_tdata[11]),
        .Q(out2_axis_tdata[11]),
        .R(1'b0));
  FDRE \out1_axis_tdata_reg[12] 
       (.C(in_axis_aclk),
        .CE(\out1_axis_tdata[31]_i_1_n_0 ),
        .D(in_axis_tdata[12]),
        .Q(out2_axis_tdata[12]),
        .R(1'b0));
  FDRE \out1_axis_tdata_reg[13] 
       (.C(in_axis_aclk),
        .CE(\out1_axis_tdata[31]_i_1_n_0 ),
        .D(in_axis_tdata[13]),
        .Q(out2_axis_tdata[13]),
        .R(1'b0));
  FDRE \out1_axis_tdata_reg[14] 
       (.C(in_axis_aclk),
        .CE(\out1_axis_tdata[31]_i_1_n_0 ),
        .D(in_axis_tdata[14]),
        .Q(out2_axis_tdata[14]),
        .R(1'b0));
  FDRE \out1_axis_tdata_reg[15] 
       (.C(in_axis_aclk),
        .CE(\out1_axis_tdata[31]_i_1_n_0 ),
        .D(in_axis_tdata[15]),
        .Q(out2_axis_tdata[15]),
        .R(1'b0));
  FDRE \out1_axis_tdata_reg[16] 
       (.C(in_axis_aclk),
        .CE(\out1_axis_tdata[31]_i_1_n_0 ),
        .D(in_axis_tdata[16]),
        .Q(out2_axis_tdata[16]),
        .R(1'b0));
  FDRE \out1_axis_tdata_reg[17] 
       (.C(in_axis_aclk),
        .CE(\out1_axis_tdata[31]_i_1_n_0 ),
        .D(in_axis_tdata[17]),
        .Q(out2_axis_tdata[17]),
        .R(1'b0));
  FDRE \out1_axis_tdata_reg[18] 
       (.C(in_axis_aclk),
        .CE(\out1_axis_tdata[31]_i_1_n_0 ),
        .D(in_axis_tdata[18]),
        .Q(out2_axis_tdata[18]),
        .R(1'b0));
  FDRE \out1_axis_tdata_reg[19] 
       (.C(in_axis_aclk),
        .CE(\out1_axis_tdata[31]_i_1_n_0 ),
        .D(in_axis_tdata[19]),
        .Q(out2_axis_tdata[19]),
        .R(1'b0));
  FDRE \out1_axis_tdata_reg[1] 
       (.C(in_axis_aclk),
        .CE(\out1_axis_tdata[31]_i_1_n_0 ),
        .D(in_axis_tdata[1]),
        .Q(out2_axis_tdata[1]),
        .R(1'b0));
  FDRE \out1_axis_tdata_reg[20] 
       (.C(in_axis_aclk),
        .CE(\out1_axis_tdata[31]_i_1_n_0 ),
        .D(in_axis_tdata[20]),
        .Q(out2_axis_tdata[20]),
        .R(1'b0));
  FDRE \out1_axis_tdata_reg[21] 
       (.C(in_axis_aclk),
        .CE(\out1_axis_tdata[31]_i_1_n_0 ),
        .D(in_axis_tdata[21]),
        .Q(out2_axis_tdata[21]),
        .R(1'b0));
  FDRE \out1_axis_tdata_reg[22] 
       (.C(in_axis_aclk),
        .CE(\out1_axis_tdata[31]_i_1_n_0 ),
        .D(in_axis_tdata[22]),
        .Q(out2_axis_tdata[22]),
        .R(1'b0));
  FDRE \out1_axis_tdata_reg[23] 
       (.C(in_axis_aclk),
        .CE(\out1_axis_tdata[31]_i_1_n_0 ),
        .D(in_axis_tdata[23]),
        .Q(out2_axis_tdata[23]),
        .R(1'b0));
  FDRE \out1_axis_tdata_reg[24] 
       (.C(in_axis_aclk),
        .CE(\out1_axis_tdata[31]_i_1_n_0 ),
        .D(in_axis_tdata[24]),
        .Q(out2_axis_tdata[24]),
        .R(1'b0));
  FDRE \out1_axis_tdata_reg[25] 
       (.C(in_axis_aclk),
        .CE(\out1_axis_tdata[31]_i_1_n_0 ),
        .D(in_axis_tdata[25]),
        .Q(out2_axis_tdata[25]),
        .R(1'b0));
  FDRE \out1_axis_tdata_reg[26] 
       (.C(in_axis_aclk),
        .CE(\out1_axis_tdata[31]_i_1_n_0 ),
        .D(in_axis_tdata[26]),
        .Q(out2_axis_tdata[26]),
        .R(1'b0));
  FDRE \out1_axis_tdata_reg[27] 
       (.C(in_axis_aclk),
        .CE(\out1_axis_tdata[31]_i_1_n_0 ),
        .D(in_axis_tdata[27]),
        .Q(out2_axis_tdata[27]),
        .R(1'b0));
  FDRE \out1_axis_tdata_reg[28] 
       (.C(in_axis_aclk),
        .CE(\out1_axis_tdata[31]_i_1_n_0 ),
        .D(in_axis_tdata[28]),
        .Q(out2_axis_tdata[28]),
        .R(1'b0));
  FDRE \out1_axis_tdata_reg[29] 
       (.C(in_axis_aclk),
        .CE(\out1_axis_tdata[31]_i_1_n_0 ),
        .D(in_axis_tdata[29]),
        .Q(out2_axis_tdata[29]),
        .R(1'b0));
  FDRE \out1_axis_tdata_reg[2] 
       (.C(in_axis_aclk),
        .CE(\out1_axis_tdata[31]_i_1_n_0 ),
        .D(in_axis_tdata[2]),
        .Q(out2_axis_tdata[2]),
        .R(1'b0));
  FDRE \out1_axis_tdata_reg[30] 
       (.C(in_axis_aclk),
        .CE(\out1_axis_tdata[31]_i_1_n_0 ),
        .D(in_axis_tdata[30]),
        .Q(out2_axis_tdata[30]),
        .R(1'b0));
  FDRE \out1_axis_tdata_reg[31] 
       (.C(in_axis_aclk),
        .CE(\out1_axis_tdata[31]_i_1_n_0 ),
        .D(in_axis_tdata[31]),
        .Q(out2_axis_tdata[31]),
        .R(1'b0));
  FDRE \out1_axis_tdata_reg[3] 
       (.C(in_axis_aclk),
        .CE(\out1_axis_tdata[31]_i_1_n_0 ),
        .D(in_axis_tdata[3]),
        .Q(out2_axis_tdata[3]),
        .R(1'b0));
  FDRE \out1_axis_tdata_reg[4] 
       (.C(in_axis_aclk),
        .CE(\out1_axis_tdata[31]_i_1_n_0 ),
        .D(in_axis_tdata[4]),
        .Q(out2_axis_tdata[4]),
        .R(1'b0));
  FDRE \out1_axis_tdata_reg[5] 
       (.C(in_axis_aclk),
        .CE(\out1_axis_tdata[31]_i_1_n_0 ),
        .D(in_axis_tdata[5]),
        .Q(out2_axis_tdata[5]),
        .R(1'b0));
  FDRE \out1_axis_tdata_reg[6] 
       (.C(in_axis_aclk),
        .CE(\out1_axis_tdata[31]_i_1_n_0 ),
        .D(in_axis_tdata[6]),
        .Q(out2_axis_tdata[6]),
        .R(1'b0));
  FDRE \out1_axis_tdata_reg[7] 
       (.C(in_axis_aclk),
        .CE(\out1_axis_tdata[31]_i_1_n_0 ),
        .D(in_axis_tdata[7]),
        .Q(out2_axis_tdata[7]),
        .R(1'b0));
  FDRE \out1_axis_tdata_reg[8] 
       (.C(in_axis_aclk),
        .CE(\out1_axis_tdata[31]_i_1_n_0 ),
        .D(in_axis_tdata[8]),
        .Q(out2_axis_tdata[8]),
        .R(1'b0));
  FDRE \out1_axis_tdata_reg[9] 
       (.C(in_axis_aclk),
        .CE(\out1_axis_tdata[31]_i_1_n_0 ),
        .D(in_axis_tdata[9]),
        .Q(out2_axis_tdata[9]),
        .R(1'b0));
  LUT5 #(
    .INIT(32'h0080F080)) 
    out1_axis_tvalid_i_1
       (.I0(in_axis_tvalid),
        .I1(in_axis_tready_reg_0),
        .I2(in_axis_aresetn),
        .I3(out1_axis_tvalid_reg_0),
        .I4(out1_axis_tready),
        .O(out1_axis_tvalid_i_1_n_0));
  FDRE out1_axis_tvalid_reg
       (.C(in_axis_aclk),
        .CE(1'b1),
        .D(out1_axis_tvalid_i_1_n_0),
        .Q(out1_axis_tvalid_reg_0),
        .R(1'b0));
  LUT5 #(
    .INIT(32'h0080F080)) 
    out2_axis_tvalid_i_1
       (.I0(in_axis_tvalid),
        .I1(in_axis_tready_reg_0),
        .I2(in_axis_aresetn),
        .I3(out2_axis_tvalid_reg_0),
        .I4(out2_axis_tready),
        .O(out2_axis_tvalid_i_1_n_0));
  FDRE out2_axis_tvalid_reg
       (.C(in_axis_aclk),
        .CE(1'b1),
        .D(out2_axis_tvalid_i_1_n_0),
        .Q(out2_axis_tvalid_reg_0),
        .R(1'b0));
  LUT6 #(
    .INIT(64'hF080F080F0800080)) 
    stored_data_valid_i_1
       (.I0(in_axis_tvalid),
        .I1(in_axis_tready_reg_0),
        .I2(in_axis_aresetn),
        .I3(stored_data_valid_reg_n_0),
        .I4(out1_axis_tvalid_reg_0),
        .I5(out2_axis_tvalid_reg_0),
        .O(stored_data_valid_i_1_n_0));
  FDRE stored_data_valid_reg
       (.C(in_axis_aclk),
        .CE(1'b1),
        .D(stored_data_valid_i_1_n_0),
        .Q(stored_data_valid_reg_n_0),
        .R(1'b0));
endmodule

(* CHECK_LICENSE_TYPE = "design_1_axis_splitter_0_0,axis_splitter,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* IP_DEFINITION_SOURCE = "package_project" *) 
(* X_CORE_INFO = "axis_splitter,Vivado 2018.3" *) 
(* NotValidForBitStream *)
module design_1_axis_splitter_0_0
   (in_axis_aclk,
    in_axis_aresetn,
    in_axis_tready,
    in_axis_tdata,
    in_axis_tlast,
    in_axis_tvalid,
    out1_axis_aclk,
    out1_axis_aresetn,
    out1_axis_tready,
    out1_axis_tdata,
    out1_axis_tlast,
    out1_axis_tvalid,
    out2_axis_aclk,
    out2_axis_aresetn,
    out2_axis_tready,
    out2_axis_tdata,
    out2_axis_tlast,
    out2_axis_tvalid);
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 in_axis_aclk CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME in_axis_aclk, ASSOCIATED_BUSIF in_axis, ASSOCIATED_RESET in_axis_aresetn, FREQ_HZ 100000000, PHASE 0.0, CLK_DOMAIN /clk_wiz_0_clk_out1, INSERT_VIP 0" *) input in_axis_aclk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 in_axis_aresetn RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME in_axis_aresetn, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) input in_axis_aresetn;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 in_axis TREADY" *) output in_axis_tready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 in_axis TDATA" *) input [31:0]in_axis_tdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 in_axis TLAST" *) input in_axis_tlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 in_axis TVALID" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME in_axis, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 1, FREQ_HZ 100000000, PHASE 0.0, CLK_DOMAIN /clk_wiz_0_clk_out1, LAYERED_METADATA undef, INSERT_VIP 0" *) input in_axis_tvalid;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 out1_axis_aclk CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME out1_axis_aclk, ASSOCIATED_BUSIF out1_axis, ASSOCIATED_RESET out1_axis_aresetn, FREQ_HZ 100000000, PHASE 0.0, CLK_DOMAIN /clk_wiz_0_clk_out1, INSERT_VIP 0" *) input out1_axis_aclk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 out1_axis_aresetn RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME out1_axis_aresetn, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) input out1_axis_aresetn;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 out1_axis TREADY" *) input out1_axis_tready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 out1_axis TDATA" *) output [31:0]out1_axis_tdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 out1_axis TLAST" *) output out1_axis_tlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 out1_axis TVALID" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME out1_axis, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 1, FREQ_HZ 100000000, PHASE 0.0, CLK_DOMAIN /clk_wiz_0_clk_out1, LAYERED_METADATA undef, INSERT_VIP 0" *) output out1_axis_tvalid;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 out2_axis_aclk CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME out2_axis_aclk, ASSOCIATED_BUSIF out2_axis, ASSOCIATED_RESET out2_axis_aresetn, FREQ_HZ 100000000, PHASE 0.0, CLK_DOMAIN /clk_wiz_0_clk_out1, INSERT_VIP 0" *) input out2_axis_aclk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 out2_axis_aresetn RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME out2_axis_aresetn, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) input out2_axis_aresetn;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 out2_axis TREADY" *) input out2_axis_tready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 out2_axis TDATA" *) output [31:0]out2_axis_tdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 out2_axis TLAST" *) output out2_axis_tlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 out2_axis TVALID" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME out2_axis, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 1, FREQ_HZ 100000000, PHASE 0.0, CLK_DOMAIN /clk_wiz_0_clk_out1, LAYERED_METADATA undef, INSERT_VIP 0" *) output out2_axis_tvalid;

  wire in_axis_aclk;
  wire in_axis_aresetn;
  wire [31:0]in_axis_tdata;
  wire in_axis_tlast;
  wire in_axis_tready;
  wire in_axis_tvalid;
  wire out1_axis_tready;
  wire out1_axis_tvalid;
  wire [31:0]out2_axis_tdata;
  wire out2_axis_tready;
  wire out2_axis_tvalid;

  assign out1_axis_tdata[31:0] = out2_axis_tdata;
  assign out1_axis_tlast = in_axis_tlast;
  assign out2_axis_tlast = in_axis_tlast;
  design_1_axis_splitter_0_0_axis_splitter inst
       (.in_axis_aclk(in_axis_aclk),
        .in_axis_aresetn(in_axis_aresetn),
        .in_axis_tdata(in_axis_tdata),
        .in_axis_tready_reg_0(in_axis_tready),
        .in_axis_tvalid(in_axis_tvalid),
        .out1_axis_tready(out1_axis_tready),
        .out1_axis_tvalid_reg_0(out1_axis_tvalid),
        .out2_axis_tdata(out2_axis_tdata),
        .out2_axis_tready(out2_axis_tready),
        .out2_axis_tvalid_reg_0(out2_axis_tvalid));
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
