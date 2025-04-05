
`timescale 1 ns / 1 ps

// This file was NOT primarily written by us for ECE532, it was sourced from a tutorial:
//
//   https://web.archive.org/web/20241205135347/http://www.harald-rosenfeldt.de/2017/12/30/zynq-create-an-i2s-transmitter-to-send-audio-signals/
//
// However, the original only did audio output; we updated it to support audio input as well.


// s00_axis_aclk = 100 MHz
// MCLK = 10 cycles => 10 MHz
// BCLK = 40 cycles => 2.5MHz
// => 32 bit = 1280 cycles => f_sample = 1/(1280*2*10e-9) = 39.0625 kHz
// A single transfer is 32 bit wide:
//     The left channel is in the upper 16 bits, the right channel is in the lower 16 bits.
	module myI2STx_v1_0 #
	(
		// Users to add parameters here

		// User parameters ends
		// Do not modify the parameters beyond this line


		// Parameters of Axi Slave Bus Interface S00_AXIS
		parameter integer C_S00_AXIS_TDATA_WIDTH	= 32,
		
		// Parameters of Axi Master Bus Interface M00_AXIS
		parameter integer C_M00_AXIS_TDATA_WIDTH	= 32,
		parameter integer C_M00_AXIS_START_COUNT	= 32
	)
	(
        // I2S Interface
        input mclk,
        input sdata_in,
        output reg bclk = 1,
        output reg lrclk = 1,
        output reg sdata = 0,

		// User ports ends
		// Do not modify the ports beyond this line


		// Ports of Axi Slave Bus Interface S00_AXIS
		input wire  s00_axis_aclk,
		input wire  s00_axis_aresetn,
		output reg  s00_axis_tready = 0,
		input wire [C_S00_AXIS_TDATA_WIDTH-1 : 0] s00_axis_tdata,
		input wire [(C_S00_AXIS_TDATA_WIDTH/8)-1 : 0] s00_axis_tstrb,
		input wire  s00_axis_tlast,
		input wire  s00_axis_tvalid,
		
		// Ports of Axi Master Bus Interface M00_AXIS
		input wire  m00_axis_aclk,
		input wire  m00_axis_aresetn,
		output reg  m00_axis_tvalid,
		output reg [C_M00_AXIS_TDATA_WIDTH-1 : 0] m00_axis_tdata,
		//output wire [(C_M00_AXIS_TDATA_WIDTH/8)-1 : 0] m00_axis_tstrb,
		output wire  m00_axis_tlast,
		input wire  m00_axis_tready
	);

    reg mclkdelay = 0;
    reg halfclk = 0;
    reg [0:0]counter = 0;
    
    reg [15:0]ramp = 16'hFFFF;
    reg [15:0]shiftreg_out = 0;
    reg [4:0]bitcounter = 0;
    reg [2:0] state = 0;
    
    reg [31:0]shiftreg_in = 0;
    reg [15:0] left_in_buffer;
	
    reg [31:0] buffer = 0;
	reg bufvalid = 0;
    
    localparam S0 = 0;
    localparam S1 = 1;
    localparam S2 = 2;
    localparam S3 = 3;
    localparam S4 = 4;
    
    
    // AXI master stuff
    // NOTE: We assume master clock is the same as slave clock
    //assign m00_axis_tstrb = 'b1111;
    assign m00_axis_tlast = 1;

    always @(posedge s00_axis_aclk) begin
		if (bufvalid==0 && s00_axis_tready==0) begin
			s00_axis_tready <= 1;
		end else if (bufvalid==0 && s00_axis_tready==1 && s00_axis_tvalid==1) begin
			s00_axis_tready <= 0;
			buffer <= s00_axis_tdata;
			bufvalid <= 1;
		end
			
			
        if (mclk==1 && !mclkdelay) begin
            counter <= counter+1;
            if (counter == 0) begin
                halfclk <= 1;
            end
            mclkdelay <= mclk;
        end else begin
            halfclk <= 0;
            mclkdelay <= mclk;
        end
        
        //if (halfclk==1) begin
        //    bclk = !bclk;
        //end
        
        if (m00_axis_tvalid && m00_axis_tready) begin
            m00_axis_tvalid <= 0;
        end

        if (halfclk==1) begin
            case(state)
                S0:     begin
                            bufvalid <= 0;
                            bitcounter <= 0;
                            lrclk <= 0;
                            bclk <= 0;
                            sdata <= 0;
                            state <= S1;
                            shiftreg_out <= buffer[31:16];
                        end
                S1:     begin
                            bclk <= 1;
							state <= S2;
	                    end
                S2:     begin
                            bclk <= 0;
                            sdata <= shiftreg_out[15];
                            bitcounter <= bitcounter+1;
                            state <= S3;
                        end
                S3:     begin
                            bclk <= 1;
                            shiftreg_out <= shiftreg_out<<1;
                            shiftreg_in <= (shiftreg_in << 1) | sdata_in;
                            if (bitcounter==31) begin
                                if (lrclk==0) begin
                                    left_in_buffer <= shiftreg_in[30:15];
                                    state <= S4;
                                end else begin
                                    state <= S0;
                            
                                    // Write to stream
                                    m00_axis_tvalid <= 1;
                                    m00_axis_tdata <= {left_in_buffer, shiftreg_in[30:15]};
                                end
                            end else begin
                                state <= S2;
                            end
                        end
                S4:     begin
                            bitcounter <= 0;
                            lrclk <= 1;
                            bclk <= 0;
                            sdata <= 0;
                            state <= S1;
                            shiftreg_out <= buffer[15:0];
                        end
                default:begin
                            state <= S0;
                        end
            endcase
        end
    end

	endmodule
