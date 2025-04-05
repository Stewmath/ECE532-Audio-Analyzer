`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/20/2025 04:57:42 PM
// Design Name: 
// Module Name: cepstrum_ptich_detector
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


module cepstrum_pitch_detector #(
		// Parameters of Axi Slave Bus Interface S00_AXIS
		parameter integer C_S00_AXIS_TDATA_WIDTH	= 32,
		
		// Parameters of Axi Master Bus Interface M00_AXIS
		parameter integer C_M00_AXIS_TDATA_WIDTH	= 32,
		parameter integer C_M00_AXIS_START_COUNT	= 32

)
(
		// Ports of Axi Slave Bus Interface S00_AXIS (sample input)
		input wire  s00_axis_aclk,
		input wire  s00_axis_aresetn,
		output logic  s00_axis_tready,
		input wire [C_S00_AXIS_TDATA_WIDTH-1 : 0] s00_axis_tdata,
		input wire [(C_S00_AXIS_TDATA_WIDTH/8)-1 : 0] s00_axis_tstrb,
		input wire  s00_axis_tlast, // Important signal, don't ignore
		input wire  s00_axis_tvalid,
		
		// Ports of Axi Master Bus Interface M00_AXIS (debug output)
		input wire  m00_axis_aclk, // Assumed to be same clock as slave bus
		input wire  m00_axis_aresetn,
		output reg  m00_axis_tvalid,
		output reg [C_M00_AXIS_TDATA_WIDTH-1 : 0] m00_axis_tdata,
		output wire [(C_M00_AXIS_TDATA_WIDTH/8)-1 : 0] m00_axis_tstrb,
		output m00_axis_tlast,
		input wire  m00_axis_tready,
		
		// AXI-Lite slave interface (control)
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
        
        // Other outputs (non-AXI)
        output reg interrupt // Set to HIGH when calculation finished, reset by write to CTRL register (see slave_module.sv)
    );
    
    enum {
        STAGE_HARD_RESET,
        STAGE_CONFIG_1,
        STAGE_CONFIG_2,
        STAGE_SOFT_RESET,
        STAGE_PROCESSING,
        STAGE_FIND_PEAK,
        STAGE_SEND_OUTPUT
    } cepstrum_stages;
        
    
    localparam NUM_SAMPLES = 1024;
    
    // Skip first N samples when finding peak, to avoid the initial "false peak".
    // Max detectable frequency = SAMPLE_RATE / SKIP_SAMPLES =~ 1950Hz
    localparam SKIP_SAMPLES = 20;
    
    wire aclk = s00_axis_aclk;
    assign m00_axis_tstrb = 'b1111;
    assign m00_axis_tlast = 1;
    
    // FFT wires
    wire afftreset;
    logic [63:0] fft1_data;               //FFT IP takes 64 bit data
    logic fft1_in_valid, fft1_in_ready, fft1_in_last;
    logic fft1_out_valid, fft1_out_ready, fft1_out_last;
    wire[63:0] fft1_out;

    logic [63:0] fft2_data;
    reg [31:0]   fft2_real_data;
    reg fft2_in_valid, fft2_in_ready, fft2_in_last;
    logic fft2_out_valid, fft2_out_ready, fft2_out_last;
    wire[63:0] fft2_out;
    
    // Float absolute value wires
    reg[31:0] float_abs_in_data = 0;
    wire float_abs_in_ready; // Input
    reg float_abs_in_valid;// Output
    wire[31:0] float_abs_out_data;
    wire float_abs_out_ready; // Output
    wire float_abs_out_valid; // Input
    
    reg[31:0] float_abs2_in_data = 0;
    wire float_abs2_in_ready; // Input
    reg float_abs2_in_valid;// Output
    wire[31:0] float_abs2_out_data;
    wire float_abs2_out_ready; // Output
    wire float_abs2_out_valid; // Input

    // Float log wires
    reg[31:0] float_log_in_data = 0;
    wire float_log_in_ready; // Input
    reg float_log_in_valid;// Output
    wire[31:0] float_log_out_data;
    wire float_log_out_ready; // Output
    wire float_log_out_valid; // Input
    
    // Float GT comparison wires
    reg[31:0] float_gt_in1_data, float_gt_in2_data;
    reg float_gt_in_valid;
    wire float_gt_in1_ready, float_gt_in2_ready;
    wire float_gt_out_result;
    wire float_gt_out_valid;
    
    // Other
    reg[2:0] reset_timer = 0;
    reg[2:0] cepstrum_stage = 0;
    reg[31:0] abs_out_buffer[NUM_SAMPLES-1:0];
    reg[31:0] abs_out_counter;
    reg[31:0] fft1_counter; // # samples sent to FFT1
    reg [31:0] log_counter; // # samples received from log output
    reg[31:0] output_data_counter; // # samples sent over master AXI port
    
    // For finding the peak
    reg[31:0] peak_finding_counter;
    reg[31:0] peak_index, peak_index_final;
    reg[31:0] peak_value;
    reg peak_finder_waiting;
    reg peak_found;
 
    // For initial config   
    reg[15:0] config_data = 0;
    reg config_valid_1, config_valid_2;
    wire config_ready_1, config_ready_2;
    reg[1:0] config_counter;
    
    // Communication with slave module
    wire module_status = peak_found;
    wire ctrl_write_occurred;
    wire[31:0] ctrl_value;
    
   always_ff @ (posedge aclk) begin
        fft2_in_valid <= 0;
        fft2_in_last <= 0;
        float_abs_in_valid <= 0;
        float_abs2_in_valid <= 0;
        float_log_in_valid <= 0;
        float_gt_in_valid <= 0;
        m00_axis_tvalid <= 0;

        if (!s00_axis_aresetn) begin
            reset_timer <= 'b111;
            cepstrum_stage <= STAGE_HARD_RESET;
            config_valid_1 <= 0;
            config_valid_2 <= 0;
            interrupt <= 0;
        end else begin
            // Waiting for reset to finish
            if (cepstrum_stage == STAGE_HARD_RESET) begin
                if (reset_timer == 0) begin
                    // Reset finished, to next stage
                    cepstrum_stage <= STAGE_CONFIG_1;
                    config_data <= 1;  // Set up FFT for forward mode (not inverse)
                    config_valid_1 <= 1;
                end
            // Setting up config
            end else if (cepstrum_stage == STAGE_CONFIG_1) begin
                if (config_ready_1) begin
                    config_valid_1 <= 0;
                    config_valid_2 <= 1;
                    cepstrum_stage <= STAGE_CONFIG_2;
                end
            end else if (cepstrum_stage == STAGE_CONFIG_2) begin
                if (config_ready_2) begin
                    config_valid_2 <= 0;
                    cepstrum_stage <= STAGE_SOFT_RESET;
                end
            end else if (cepstrum_stage == STAGE_SOFT_RESET) begin
                // Reset stuff here
                abs_out_counter <= 0;
                fft1_counter <= 0;
                log_counter <= 0;
                output_data_counter <= 0;
                peak_finder_waiting <= 0;
                //peak_found <= 0; // TODO
                cepstrum_stage <= STAGE_PROCESSING;
            end else if (cepstrum_stage == STAGE_PROCESSING) begin
                // Count # of samples sent to FFT1
                if (fft1_in_valid && fft1_in_ready) begin
                    fft1_counter <= fft1_counter + 1;
                end
                
                // Pass FFT output to Float abs input
                if (fft1_out_valid && fft1_out_ready) begin
                    assert (float_abs_in_ready) else $error("float_abs_in_ready = 0");
                    float_abs_in_data <= fft1_out[31:0];
                    float_abs_in_valid <= 1;
                end

                // Pass abs output to log input
                if (float_abs_out_valid && float_abs_out_ready) begin
                    assert (float_log_in_ready) else $error("float_log_in_ready = 0");
                    float_log_in_data <= float_abs_out_data;
                    float_log_in_valid <= 1;
                end
                
                // Pass log output to FFT input
                if (float_log_out_valid && float_log_out_ready) begin
                    assert (fft2_in_ready) else $error("fft2_in_ready = 0");

                    // We can't compute the FFT if there are any -infinity values, so convert these to 0
                    if (float_log_out_data == 'hff800000) begin
                        fft2_real_data <= 0;
                    end else begin
                        fft2_real_data <= float_log_out_data;
                    end
                    fft2_in_valid <= 1;
                    log_counter <= log_counter + 1;
                    if (log_counter == NUM_SAMPLES - 1) begin
                        fft2_in_last <= 1;
                    end
                end

                // Pass FFT output to abs2
                if (fft2_out_valid && fft2_out_ready) begin
                    float_abs2_in_valid <= 1;
                    float_abs2_in_data <= fft2_out[31:0];
                end
                
                // Copy abs2 output to buffer
                if (float_abs2_out_valid && float_abs2_out_ready) begin
                    abs_out_buffer[abs_out_counter] <= float_abs2_out_data;
                    abs_out_counter <= abs_out_counter + 1;
                    
                    // Is this the last output?
                    if (abs_out_counter == NUM_SAMPLES - 1) begin
                        abs_out_counter <= 0;
                        cepstrum_stage <= STAGE_FIND_PEAK;
                        
                        peak_finding_counter <= SKIP_SAMPLES;
                        peak_value <= 0;
                    end
                end
            end else if (cepstrum_stage == STAGE_FIND_PEAK) begin
                // Find maximum
                if (peak_finding_counter >= NUM_SAMPLES / 2) begin
                    // NOTE: STAGE_SEND_OUTPUT is currently DISABLED. It's a bit buggy and only for debugging anyway.
                    //cepstrum_stage <= STAGE_SEND_OUTPUT;
                    cepstrum_stage <= STAGE_SOFT_RESET;
                    peak_index_final <= peak_index;
                    peak_found <= 1;
                    interrupt <= 1;
                    // TODO: transmit somewhere?
                end else begin
                    // TODO: This can be optimized, currently not taking advantage of pipelining.
                    if (!peak_finder_waiting && float_gt_in1_ready && float_gt_in2_ready) begin
                        float_gt_in1_data <= abs_out_buffer[peak_finding_counter];
                        float_gt_in2_data <= peak_value;
                        float_gt_in_valid <= 1;
                        peak_finder_waiting <= 1;
                    end
                    if (float_gt_out_valid) begin
                        peak_finder_waiting <= 0;
                        if (float_gt_out_result) begin
                            peak_value <= abs_out_buffer[peak_finding_counter];
                            peak_index <= peak_finding_counter;
                        end
                        peak_finding_counter <= peak_finding_counter + 1;
                    end
                end
            end else if (cepstrum_stage == STAGE_SEND_OUTPUT) begin
                // Send buffer contents to output (for testing)
                if (m00_axis_tready && m00_axis_tvalid) begin // Sending data this cycle?
                    output_data_counter <= output_data_counter + 1;
                    if (output_data_counter+1 < NUM_SAMPLES) begin
                        m00_axis_tdata <= abs_out_buffer[output_data_counter + 1];
                        m00_axis_tvalid <= 1;
                    end else begin
                        m00_axis_tvalid <= 0;
                        cepstrum_stage <= STAGE_SOFT_RESET; // Reset
                    end
                end else begin // Not sending data this cycle, but setup for next cycle
                    m00_axis_tdata <= abs_out_buffer[output_data_counter];
                    m00_axis_tvalid <= 1;
                end
            end
            
            if (reset_timer != 0) begin
                reset_timer <= reset_timer - 1;
            end
        
            if (ctrl_write_occurred) begin
                if (ctrl_value & 1) begin // Clear interrupt
                    interrupt <= 0;
                end
            end
        end
    end
    
    always_comb begin
        if (cepstrum_stage == 4 && reset_timer == 0) begin
            fft1_data[63:32] = 32'd0;     // Imaginary data(?)
            fft1_data[31:0] = s00_axis_tdata;    // Real data from input stream
            fft1_in_valid = s00_axis_tvalid;
            fft1_in_last = fft1_counter == NUM_SAMPLES-1;
            s00_axis_tready = fft1_in_ready;

            fft2_data[63:32] = 32'd0;     // Imaginary data(?)
            fft2_data[31:0] = fft2_real_data;    // Real data from input stream
        end else begin
            fft1_data[63:0] = 0;
            fft1_in_valid = 0;
            fft1_in_last = 0;
            s00_axis_tready = 0;
        end
    end
    
    assign afftreset = reset_timer == 0;
    assign fft1_out_ready = float_abs_in_ready;
    assign float_abs_out_ready = float_log_in_ready;
    assign float_log_out_ready = fft2_in_ready;
    assign fft2_out_ready = float_abs2_in_ready;
    assign float_abs2_out_ready = 1;

    xfft_0 fft1 
    (
      .aclk(aclk),                                                // input wire aclk
      .aresetn(afftreset),                                          // input wire aresetn
      
      .s_axis_config_tdata(config_data),                  // input wire [7 : 0] s_axis_config_tdata
      .s_axis_config_tvalid(config_valid_1),                // input wire s_axis_config_tvalid
      .s_axis_config_tready(config_ready_1),                // output wire s_axis_config_tready
      
      .s_axis_data_tdata(fft1_data),                      // input wire [63 : 0] s_axis_data_tdata
      .s_axis_data_tvalid(fft1_in_valid),                    // input wire s_axis_data_tvalid
      .s_axis_data_tready(fft1_in_ready),                    // output wire s_axis_data_tready
      .s_axis_data_tlast(fft1_in_last),                      // input wire s_axis_data_tlast
      
      .m_axis_data_tdata(fft1_out),                      // output wire [63 : 0] m_axis_data_tdata
      .m_axis_data_tvalid(fft1_out_valid),                    // output wire m_axis_data_tvalid
      .m_axis_data_tready(fft1_out_ready),                    // input wire m_axis_data_tready
      .m_axis_data_tlast(fft1_out_last)                       // output wire m_axis_data_tlast
      
      //.event_frame_started(event_frame_started),                  // output wire event_frame_started
      //.event_tlast_unexpected(event_tlast_unexpected),            // output wire event_tlast_unexpected
      //.event_tlast_missing(event_tlast_missing),                  // output wire event_tlast_missing
      //.event_status_channel_halt(event_status_channel_halt),      // output wire event_status_channel_halt
      //.event_data_in_channel_halt(event_data_in_channel_halt),    // output wire event_data_in_channel_halt
      //.event_data_out_channel_halt(event_data_out_channel_halt)  // output wire event_data_out_channel_halt
    );

    xfft_0 fft2 (
      .aclk(aclk),                                                // input wire aclk
      .aresetn(afftreset),                                          // input wire aresetn

      .s_axis_config_tdata(config_data),                  // input wire [7 : 0] s_axis_config_tdata
      .s_axis_config_tvalid(config_valid_2),                // input wire s_axis_config_tvalid
      .s_axis_config_tready(config_ready_2),                // output wire s_axis_config_tready

      .s_axis_data_tdata(fft2_data),                      // input wire [63 : 0] s_axis_data_tdata
      .s_axis_data_tvalid(fft2_in_valid),                    // input wire s_axis_data_tvalid
      .s_axis_data_tready(fft2_in_ready),                    // output wire s_axis_data_tready
      .s_axis_data_tlast(fft2_in_last),                      // input wire s_axis_data_tlast

      .m_axis_data_tdata(fft2_out),                      // output wire [63 : 0] m_axis_data_tdata
      .m_axis_data_tvalid(fft2_out_valid),                    // output wire m_axis_data_tvalid
      .m_axis_data_tready(fft2_out_ready),                    // input wire m_axis_data_tready
      .m_axis_data_tlast(fft2_out_last)                       // output wire m_axis_data_tlast
    );

    floating_point_abs float_abs (
        .s_axis_a_tdata(float_abs_in_data),
        .s_axis_a_tready(float_abs_in_ready),
        .s_axis_a_tvalid(float_abs_in_valid),
        .m_axis_result_tdata(float_abs_out_data),
        .m_axis_result_tready(float_abs_out_ready),
        .m_axis_result_tvalid(float_abs_out_valid)
    );
    
    floating_point_log float_log
      (
       .s_axis_a_tdata(float_log_in_data),
       .s_axis_a_tready(float_log_in_ready),
       .s_axis_a_tvalid(float_log_in_valid),
       .m_axis_result_tdata(float_log_out_data),
       .m_axis_result_tready(float_log_out_ready),
       .m_axis_result_tvalid(float_log_out_valid),
       .aclk(aclk),
       .aresetn(afftreset)
       );
       
    floating_point_abs float_abs_2 (
        .s_axis_a_tdata(float_abs2_in_data),
        .s_axis_a_tready(float_abs2_in_ready),
        .s_axis_a_tvalid(float_abs2_in_valid),
        .m_axis_result_tdata(float_abs2_out_data),
        .m_axis_result_tready(float_abs2_out_ready),
        .m_axis_result_tvalid(float_abs2_out_valid)
    );
    
    floating_point_gt float_gt (
        .s_axis_a_tdata(float_gt_in1_data),
        .s_axis_a_tready(float_gt_in1_ready),
        .s_axis_a_tvalid(float_gt_in_valid),
        .s_axis_b_tdata(float_gt_in2_data),
        .s_axis_b_tready(float_gt_in2_ready),
        .s_axis_b_tvalid(float_gt_in_valid),
        .m_axis_result_tdata(float_gt_out_result),
        .m_axis_result_tvalid(float_gt_out_valid),
        
       .aclk(aclk),
       .aresetn(afftreset)
    );
    
    slave_module sub(
    // AXI slave signals
    .S_AXI_ACLK(aclk),
    .S_AXI_ARESETN(afftreset),
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
    .freq_value(peak_index_final),
    .module_status(module_status),
    .ctrl_write_occurred(ctrl_write_occurred),
    .ctrl_value(ctrl_value)
);

    
endmodule