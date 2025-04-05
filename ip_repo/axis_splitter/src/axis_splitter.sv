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
	output reg   in_axis_tready,
	input wire   [31 : 0] in_axis_tdata,
	//input wire   [31 : 0] in_axis_tstrb,
	input wire   in_axis_tlast,
	input wire   in_axis_tvalid,
	
	// AXI stream output 1
	input wire   out1_axis_aclk,
	input wire   out1_axis_aresetn,
	input reg   out1_axis_tready,
	output reg   [31 : 0] out1_axis_tdata,
	//output wire   [31 : 0] out1_axis_tstrb,
	output wire   out1_axis_tlast,
	output reg    out1_axis_tvalid,
	
	// AXI stream output 2
	input wire   out2_axis_aclk,
	input wire   out2_axis_aresetn,
	input reg   out2_axis_tready,
	output reg   [31 : 0] out2_axis_tdata,
	//output wire   [31 : 0] out2_axis_tstrb,
	output wire   out2_axis_tlast,
	output reg   out2_axis_tvalid
    );
    
    reg stored_data_valid;
    
    assign out1_axis_tlast = in_axis_tlast;
    assign out2_axis_tlast = in_axis_tlast;
    
    always_ff @(posedge in_axis_aclk) begin
        if (!in_axis_aresetn) begin
            in_axis_tready <= 1;
            stored_data_valid <= 0;
            out1_axis_tvalid <= 0;
            out2_axis_tvalid <= 0;
        end else begin
            if (in_axis_tvalid && in_axis_tready) begin
                in_axis_tready <= 0;
                stored_data_valid <= 1;
                out1_axis_tvalid <= 1;
                out2_axis_tvalid <= 1;
                out1_axis_tdata <= in_axis_tdata;
                out2_axis_tdata <= in_axis_tdata;
            end
            if (out1_axis_tvalid && out1_axis_tready) begin
                out1_axis_tvalid <= 0;
            end
            if (out2_axis_tvalid && out2_axis_tready) begin
                out2_axis_tvalid <= 0;
            end
            
            if (stored_data_valid && !out1_axis_tvalid && !out2_axis_tvalid) begin
                stored_data_valid <= 0;
                in_axis_tready <= 1;
            end
        end
    end
endmodule