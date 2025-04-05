`timescale 1ns / 1ps

// Selects between the multiple graphical modules.

module multiplexer(
	// AXI stream interface: Provides pitch data.
	input wire   pitch_axis_aclk,
	input wire   pitch_axis_aresetn,
	output reg   pitch_axis_tready,
	input wire   [31 : 0] pitch_axis_tdata,
	//input wire   [31 : 0] pitch_axis_tstrb,
	//input wire   pitch_axis_tlast,
	input wire   pitch_axis_tvalid,
	
	// AXI stream interface: Provides sample data
	input wire   smpl_axis_aclk,
	input wire   smpl_axis_aresetn,
	output       smpl_axis_tready,
	input wire   [31 : 0] smpl_axis_tdata,
	//input wire   [31 : 0] smpl_axis_tstrb,
	//input wire   smpl_axis_tlast,
	input wire   smpl_axis_tvalid,

    // Other ports
    input clk,    // 100MHz
    input pixclk, // 25MHz
    input [9:0] x,
    input [9:0] y,
    output reg [7:0] r,
    output reg [7:0] g,
    output reg [7:0] b,
    
    input[1:0] output_select, // 0: waveform, 1: pitch graph
    input pitch_graph_reset,
    input pitch_graph_draw_record_cursor,
    input[9:0] pitch_graph_playback_cursor_index,
    output pitch_graph_finished
    );
    
    wire [7:0] wave_r, wave_g, wave_b;
    wire [7:0] pitch_r, pitch_g, pitch_b;
    
    draw_waveform #(
    ) waveform (
        .clk(clk), .pixclk(pixclk),
        .r(wave_r), .g(wave_g), .b(wave_b),
        .x(x), .y(y),
        
        .s00_axis_aclk(smpl_axis_aclk),
        .s00_axis_aresetn(smpl_axis_aresetn),
        .s00_axis_tready(smpl_axis_tready),
        .s00_axis_tdata(smpl_axis_tdata),
        .s00_axis_tvalid(smpl_axis_tvalid)
    );
    
    draw_pitch_graph #(
    ) pitch_graph (
        .clk(clk), .pixclk(pixclk),
        .r(pitch_r), .g(pitch_g), .b(pitch_b),
        .x(x), .y(y),
        .reset(pitch_graph_reset),
        .draw_record_cursor(pitch_graph_draw_record_cursor),
        .playback_cursor_index(pitch_graph_playback_cursor_index),
        .finished(pitch_graph_finished),
        
        .s00_axis_aclk(pitch_axis_aclk),
        .s00_axis_aresetn(pitch_axis_aresetn),
        .s00_axis_tready(pitch_axis_tready),
        .s00_axis_tdata(pitch_axis_tdata),
        .s00_axis_tvalid(pitch_axis_tvalid)
    );
    
    always_comb begin
        case (output_select)
            0: begin
                r = wave_r;
                g = wave_g;
                b = wave_b;
            end
            1: begin
                r = pitch_r;
                g = pitch_g;
                b = pitch_b;
            end
            default: begin
                r = wave_r;
                g = wave_g;
                b = wave_b;
            end
        endcase
    end
endmodule