`timescale 1ns / 1ps


module hdmi_top #(
    C_SMPL_AXIS_TDATA_WIDTH = 32,
    C_PITCH_AXIS_TDATA_WIDTH = 32
) (
    input clk,  // 100MHz
    //input reset,

    // Ports of Axi stream interface. Provides sample data.
	input wire   smpl_axis_aclk,
	input wire   smpl_axis_aresetn,
	output wire  smpl_axis_tready,
	input wire   [C_SMPL_AXIS_TDATA_WIDTH-1 : 0] smpl_axis_tdata,
	//input wire   [(C_SMPL_AXIS_TDATA_WIDTH/8)-1 : 0] smpl_axis_tstrb,
	//input wire   smpl_axis_tlast,
	input wire   smpl_axis_tvalid,
	
    // Ports of Axi stream interface. Provides pitch data.
	input wire   pitch_axis_aclk,
	input wire   pitch_axis_aresetn,
	output wire  pitch_axis_tready,
	input wire   [C_PITCH_AXIS_TDATA_WIDTH-1 : 0] pitch_axis_tdata,
	//input wire   [(C_PITCH_AXIS_TDATA_WIDTH/8)-1 : 0] pitch_axis_tstrb,
	//input wire   pitch_axis_tlast,
	input wire   pitch_axis_tvalid,
	
	// AXI-Lite slave interface (control)
	input         S_AXI_ACLK,
	input         S_AXI_ARESETN,
	
    input [31:0]  S_AXI_AWADDR,
    input         S_AXI_AWVALID,
    output        S_AXI_AWREADY,
    
    input [31:0]  S_AXI_WDATA,
    input [3:0]   S_AXI_WSTRB,
    input         S_AXI_WVALID,
    output        S_AXI_WREADY,
    
    output [1:0]  S_AXI_BRESP,
    output        S_AXI_BVALID,
    input         S_AXI_BREADY,
    
    input [31:0]  S_AXI_ARADDR,
    input         S_AXI_ARVALID,
    output        S_AXI_ARREADY,
    
    output [31:0] S_AXI_RDATA,
    output [1:0]  S_AXI_RRESP,
    output        S_AXI_RVALID,
    input         S_AXI_RREADY,

	
    // HDMI output pins
	output [2:0] TMDSp, TMDSn,
	output TMDSp_clock, TMDSn_clock
    );
    
    // signals
    wire [9:0] w_x, w_y;
    wire w_video_on, w_p_tick, w_hsync, w_vsync, w_clk_TMDS;
    reg [7:0] red_next, green_next, blue_next;
    wire [7:0] r, g, b;
    
    wire[1:0] video_mode;
    wire[31:0] ctrl_register;
    wire ctrl_register_written;
    wire[9:0] pitch_graph_playback_cursor_index;
    wire[15:0] sample_multiplier;
    wire[7:0] spectrogram_multiplier;
    
    reg pitch_graph_reset = 0;
    wire pitch_graph_finished;
    reg [31:0] status = 0; // Register 8 of slave AXI module
    
    // HDMI controller
    HDMI_controller HDMI(
        .clk(clk),
        //.reset(reset),
        .x(w_x),
        .y(w_y),
        .video_on(w_video_on),
        .hsync(w_hsync),
        .vsync(w_vsync),
        .pixclk(w_p_tick),
        .clk_TMDS(w_clk_TMDS)
    );
    
    // TMDS transmistter
    TMDS_transmitter TMDS(
        .hsync(w_hsync),
        .vsync(w_vsync),
        .DrawArea(w_video_on),
        .pixclk(w_p_tick),
        .clk_TMDS(w_clk_TMDS),
        .red(r),
        .green(g),
        .blue(b),
        .TMDSp(TMDSp),
        .TMDSn(TMDSn),
        .TMDSp_clock(TMDSp_clock),
        .TMDSn_clock(TMDSn_clock)
    );
    
    // Extract left channel (should be upper 16 bits but audio module has a bug I guess)
    // Also apply a multiplier (configurable via AXI)
    wire[15:0] left_sample_value = ((smpl_axis_tdata >> 15) & 'hfffe) * sample_multiplier;
    
    // Video multiplexer (selects between video output modes)
    multiplexer multiplexer(
        .clk(clk), .pixclk(w_p_tick),
        .r(r), .g(g), .b(b),
        .x(w_x), .y(w_y),
        
        .output_select(video_mode),
        .pitch_graph_reset(pitch_graph_reset),
        .pitch_graph_draw_record_cursor((ctrl_register & 2) ? 1 : 0),
        .pitch_graph_playback_cursor_index(pitch_graph_playback_cursor_index),
        .pitch_graph_finished(pitch_graph_finished),
        
        .spectrogram_reset(pitch_graph_reset),
        .spectrogram_multiplier(spectrogram_multiplier),
        
        .smpl_axis_aclk(smpl_axis_aclk),
        .smpl_axis_aresetn(smpl_axis_aresetn),
        .smpl_axis_tready(smpl_axis_tready),
        .smpl_axis_tdata(left_sample_value), // Value based on smpl_axis_tdata
        .smpl_axis_tvalid(smpl_axis_tvalid),
        
        .pitch_axis_aclk(pitch_axis_aclk),
        .pitch_axis_aresetn(pitch_axis_aresetn),
        .pitch_axis_tready(pitch_axis_tready),
        .pitch_axis_tdata(pitch_axis_tdata),
        .pitch_axis_tvalid(pitch_axis_tvalid)
    );
    
    // AXI slave module (receives control signals)
    slave_module sub(
        // AXI slave signals
        .S_AXI_ACLK(S_AXI_ACLK),
        .S_AXI_ARESETN(S_AXI_ARESETN),
        .S_AXI_AWADDR(S_AXI_AWADDR),
        //.S_AXI_AWPROT(S_AXI_AWPROT),
        .S_AXI_AWVALID(S_AXI_AWVALID),
        .S_AXI_AWREADY(S_AXI_AWREADY),
        .S_AXI_WDATA(S_AXI_WDATA),
        .S_AXI_WSTRB(S_AXI_WSTRB),
        .S_AXI_WVALID(S_AXI_WVALID),
        .S_AXI_WREADY(S_AXI_WREADY),
        .S_AXI_BRESP(S_AXI_BRESP),
        .S_AXI_BVALID(S_AXI_BVALID),
        .S_AXI_BREADY(S_AXI_BREADY),
        .S_AXI_ARADDR(S_AXI_ARADDR),
        //.S_AXI_ARPROT
        .S_AXI_ARVALID(S_AXI_ARVALID),
        .S_AXI_ARREADY(S_AXI_ARREADY),
        .S_AXI_RDATA(S_AXI_RDATA),
        .S_AXI_RRESP(S_AXI_RRESP),
        .S_AXI_RVALID(S_AXI_RVALID),
        .S_AXI_RREADY(S_AXI_RREADY),
    
        // Other signals
        .video_mode(video_mode),
        .ctrl_register(ctrl_register),
        .ctrl_register_written(ctrl_register_written),
        .status(status),
        .pitch_graph_playback_cursor_index(pitch_graph_playback_cursor_index),
        .sample_multiplier(sample_multiplier),
        .spectrogram_multiplier(spectrogram_multiplier)
    );
    
    always @(posedge clk) begin
        pitch_graph_reset <= 0;
        
        if (ctrl_register_written) begin
            if (ctrl_register & 1) begin
                pitch_graph_reset <= 1;
            end
        end
        
        red_next = r;
        green_next = g;
        blue_next = b;
        
        // Status register
        status[0] <= pitch_graph_finished;
    end
      
endmodule
