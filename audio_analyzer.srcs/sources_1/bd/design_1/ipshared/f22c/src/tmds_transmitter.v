`timescale 1ns / 1ps

// (c) fpga4fun.com & KNJN LLC 2013
// edited/updated for vivado 2020.1 by Dominic Meads 10/2020

////////////////////////////////////////////////////////////////////////
module TMDS_transmitter(
	input hsync, vsync, DrawArea, pixclk, clk_TMDS,
	input [7:0] red, green, blue,
	output [2:0] TMDSp, TMDSn,
	output TMDSp_clock, TMDSn_clock
);

////////////////////////////////////////////////////////////////////////
// 8b/10b encoding for transmission
wire [9:0] TMDS_red, TMDS_green, TMDS_blue;

// instantiate TMDS encoders (TMDS_encoder.vhd file from github)
TMDS_encoder encode_R(.clk(pixclk), .VD(red), .CD(2'b00)        , .VDE(DrawArea), .TMDS(TMDS_red));
TMDS_encoder encode_G(.clk(pixclk), .VD(green), .CD(2'b00)        , .VDE(DrawArea), .TMDS(TMDS_green));
TMDS_encoder encode_B(.clk(pixclk), .VD(blue), .CD({vsync,hsync}), .VDE(DrawArea), .TMDS(TMDS_blue));   // I think HDMI standard says both "sync" signals are sent over the "blue" line control inputs
// end 8b/10b encoding

////////////////////////////////////////////////////////////////////////
// Serializer and output buffers
reg [3:0] TMDS_mod10=0;  // modulus 10 counter
reg [9:0] TMDS_shift_red=0, TMDS_shift_green=0, TMDS_shift_blue=0;
reg TMDS_shift_load=0;

always @(posedge clk_TMDS) 
    TMDS_shift_load <= (TMDS_mod10==4'd9);  // shift load is high only if mod ten counter is done

always @(posedge clk_TMDS)
    begin
        TMDS_shift_red   <= TMDS_shift_load ? TMDS_red   : TMDS_shift_red  [9:1];  // only if all the old data has been serialized, then start shifting new data
        TMDS_shift_green <= TMDS_shift_load ? TMDS_green : TMDS_shift_green[9:1];  // kind of a wierd way of shifting but it works. replacing the last shift data with the MSB:LSB+1
        TMDS_shift_blue  <= TMDS_shift_load ? TMDS_blue  : TMDS_shift_blue [9:1];	
        TMDS_mod10 <= (TMDS_mod10==4'd9) ? 4'd0 : TMDS_mod10+4'd1;                 // increase counter or reset after 10 counts
    end

// instantiate differential output buffers
   // OBUFDS: Differential Output Buffer
   //         Artix-7
   // Xilinx HDL Language Template, version 2020.1
   
   OBUFDS #(
      .IOSTANDARD("DEFAULT"), // Specify the output I/O standard
      .SLEW("SLOW")           // Specify the output slew rate
   ) OBUFDS_red (
      .O(TMDSp[2]),     // Diff_p output (connect directly to top-level port)
      .OB(TMDSn[2]),   // Diff_n output (connect directly to top-level port)
      .I(TMDS_shift_red[0])      // Buffer input
   );

   // End of OBUFDS_inst instantiation
   
   // OBUFDS: Differential Output Buffer
   //         Artix-7
   // Xilinx HDL Language Template, version 2020.1
   
   OBUFDS #(
      .IOSTANDARD("DEFAULT"), // Specify the output I/O standard
      .SLEW("SLOW")           // Specify the output slew rate
   ) OBUFDS_green (
      .O(TMDSp[1]),     // Diff_p output (connect directly to top-level port)
      .OB(TMDSn[1]),   // Diff_n output (connect directly to top-level port)
      .I(TMDS_shift_green[0])      // Buffer input
   );

   // End of OBUFDS_inst instantiation

   // OBUFDS: Differential Output Buffer
   //         Artix-7
   // Xilinx HDL Language Template, version 2020.1

   OBUFDS #(
      .IOSTANDARD("DEFAULT"), // Specify the output I/O standard
      .SLEW("SLOW")           // Specify the output slew rate
   ) OBUFDS_blue (
      .O(TMDSp[0]),     // Diff_p output (connect directly to top-level port)
      .OB(TMDSn[0]),   // Diff_n output (connect directly to top-level port)
      .I(TMDS_shift_blue[0])      // Buffer input
   );

   // End of OBUFDS_inst instantiation
   // OBUFDS: Differential Output Buffer
   //         Artix-7
   // Xilinx HDL Language Template, version 2020.1

   OBUFDS #(
      .IOSTANDARD("DEFAULT"), // Specify the output I/O standard
      .SLEW("SLOW")           // Specify the output slew rate
   ) OBUFDS_clock (
      .O(TMDSp_clock),     // Diff_p output (connect directly to top-level port)
      .OB(TMDSn_clock),   // Diff_n output (connect directly to top-level port)
      .I(pixclk)      // Buffer input
   );

   // End of OBUFDS_inst instantiation
// end serializer and output buffers

endmodule  // HDMI_test