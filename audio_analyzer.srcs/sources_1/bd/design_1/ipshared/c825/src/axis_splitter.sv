`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/28/2025 05:29:07 PM
// Design Name: 
// Module Name: axis_splitter
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


// Splits AXI stream input across two outputs. Assumes that all share a common clock.
module axis_splitter(
	// AXI stream input
	input wire   in_axis_aclk,
	input wire   in_axis_aresetn,
	output wire  in_axis_tready,
	input wire   [31 : 0] in_axis_tdata,
	//input wire   [31 : 0] in_axis_tstrb,
	input wire   in_axis_tlast,
	input wire   in_axis_tvalid,
	
	// AXI stream output 1
	input wire   out1_axis_aclk,
	input wire   out1_axis_aresetn,
	input reg   out1_axis_tready,
	output wire   [31 : 0] out1_axis_tdata,
	//output wire   [31 : 0] out1_axis_tstrb,
	output wire   out1_axis_tlast,
	output wire   out1_axis_tvalid,
	
	// AXI stream output 2
	input wire   out2_axis_aclk,
	input wire   out2_axis_aresetn,
	input reg   out2_axis_tready,
	output wire   [31 : 0] out2_axis_tdata,
	//output wire   [31 : 0] out2_axis_tstrb,
	output wire   out2_axis_tlast,
	output wire   out2_axis_tvalid
    );
    
    assign in_axis_tready = out1_axis_tready && out2_axis_tready;
    
    assign out1_axis_tdata = in_axis_tdata;
    assign out2_axis_tdata = in_axis_tdata;
    
    wire out_valid = in_axis_tready && in_axis_tvalid;
    
    assign out1_axis_tvalid = out_valid;
    assign out2_axis_tvalid = out_valid;
    
    assign out1_axis_tlast = in_axis_tlast;
    assign out2_axis_tlast = in_axis_tlast;
endmodule
