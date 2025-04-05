`timescale 1ns / 1ps

// Takes audio samples as input through an AXI Stream interface,
// produces a spectrogram image.

module draw_spectrogram #(
    SCREEN_WIDTH = 640,
    SCREEN_HEIGHT = 480,
    
    // Num inputs per FFT run, must be power of 2
    NUM_SAMPLES = 1024,
    OUTPUT_BUFFER_SIZE = 512*SCREEN_WIDTH,
    
    C_S00_AXIS_TDATA_WIDTH = 32
) (
	// Ports of Axi stream interface S00_AXIS
	// Provides waveform data. Samples are 16-bit signed integers.
	input wire   s00_axis_aclk,
	input wire   s00_axis_aresetn,
	output logic s00_axis_tready,
	input wire   [C_S00_AXIS_TDATA_WIDTH-1 : 0] s00_axis_tdata,
	//input wire   [(C_S00_AXIS_TDATA_WIDTH/8)-1 : 0] s00_axis_tstrb,
	//input wire   s00_axis_tlast,
	input wire   s00_axis_tvalid,

    // Other ports
    input clk,    // 100MHz
    input pixclk, // 25MHz
    input [9:0] x,
    input [9:0] y,
    output reg [7:0] r,
    output reg [7:0] g,
    output reg [7:0] b,
    
    input reset,
    input[7:0] multiplier
    );
    
    
    reg[2:0] reset_counter;
    enum {STATE_CLEAR_MEMORY, STATE_CONFIG, STATE_WAITING_FOR_INPUT, STATE_MAIN, STATE_TESTBENCH_EXPORT_DATA, STATE_STUB} state;
    
    // For initial config   
    reg[7:0] config_data = 0;
    reg config_valid;
    wire config_ready;
    
    // FFT wires
    wire fft_clk = state > STATE_CLEAR_MEMORY ? s00_axis_aclk : 0; // Clock gating speeds up simulation
    logic [31:0] fft1_in_data;
    logic fft1_in_valid, fft1_in_ready, fft1_in_last;
    logic fft1_out_valid, fft1_out_ready, fft1_out_last;
    wire[31:0] fft1_out_data;
    reg[31:0] fft1_counter;
    reg[9:0] fft_out_counter;
    
    // FIFO wires (we have a FIFO because the FFT can't continually process inputs)
    logic[15:0] fifo_din;
    logic fifo_wr_en, fifo_rd_en;
    wire[15:0] fifo_dout;
    wire fifo_full, fifo_empty;
    
    // Memory
    reg mem_we;
    wire[3:0] mem_r_data;
    wire[18:0] mem_r_addr;
    reg[18:0] mem_w_addr;
    reg[3:0] mem_w_data;
    
    reg[31:0] output_record_index;  // Index of next byte in memory to write FFT output to
    
    // Palette for heatmap
    reg[31:0] viridis_palette[255:0];
    
    
    // Load color palette
    initial begin
        $readmemh("viridis_palette.mem", viridis_palette);
    end
    
    // Calculating "strength" of pixel from FFT output
    wire[15:0] fft_abs_value = fft1_out_data[15] ? (~fft1_out_data[14:0] & 'h7fff) + 1 : fft1_out_data[14:0];
    wire[31:0] buffer_value_multiplied = (fft_abs_value * multiplier) >> 12;
    wire[3:0] buffer_value_adjusted = (buffer_value_multiplied > 15 ? 15 : buffer_value_multiplied);
    
    // Sequential logic
    always_ff @(posedge s00_axis_aclk) begin
        config_valid <= 0;
        mem_we <= 0;
        
        if (!s00_axis_aresetn || reset) begin
            reset_counter <= 3;
            state <= STATE_CLEAR_MEMORY;
            fft1_counter <= 0;
            output_record_index <= 0;
            fft_out_counter <= 0;
        end else begin
            if (state == STATE_CLEAR_MEMORY) begin
                mem_we <= 1;
                mem_w_data <= 0;
                mem_w_addr <= output_record_index;
                if (output_record_index == OUTPUT_BUFFER_SIZE-1) begin
                    output_record_index <= 0;
                    state <= STATE_CONFIG;
                end else
                    output_record_index <= output_record_index + 1;
            end else if (state == STATE_CONFIG) begin
                if (reset_counter == 0) begin
                    config_data <= 1;  // Set up FFT for forward mode (not inverse)
                    config_valid <= 1;
                    if (config_ready)
                        state <= STATE_WAITING_FOR_INPUT;
                end else
                    reset_counter <= reset_counter - 1;
                    
            // Waiting for FFT to receive data from FIFO 
            end else if (state == STATE_WAITING_FOR_INPUT) begin
                if (fft1_in_valid && fft1_in_ready) begin
                    if (fft1_counter == NUM_SAMPLES-1) begin
                        // Last sample received
                        state <= STATE_MAIN;
                        fft1_counter <= 0;
                    end else begin
                        fft1_counter <= fft1_counter + 1;
                    end
                end
                
            // Processing FFT output
            end else if (state == STATE_MAIN) begin
                if (fft1_out_valid && fft1_out_ready) begin
                    if (fft_out_counter < 512) begin // Not displaying all 1024 outputs, only first 512
                        mem_we <= 1;
                        mem_w_addr <= output_record_index;
                        mem_w_data <= buffer_value_adjusted;
                        output_record_index <= output_record_index + 1;
                    end
                    if (fft1_out_last) begin
                        if ((output_record_index / 512) == SCREEN_WIDTH-1) begin
                            state <= STATE_STUB;
                        end else begin
                            state <= STATE_WAITING_FOR_INPUT;
                        end
                        fft_out_counter <= 0;
                    end else
                        fft_out_counter <= fft_out_counter + 1;
                end
            end
            /*
            // For testbench only: Export data to file (testing FFT)
            else if (state == STATE_TESTBENCH_EXPORT_DATA) begin
                integer output_file;
                output_file = $fopen("/home/matthew/tb_output.txt", "w");
                for (int i=0; i<NUM_SAMPLES; i=i+1) begin
                    $fwrite(output_file, "%0d\n", output_buffer[i]);
                end
                $fclose(output_file);
                state <= STATE_STUB;
            end
            */
        end
    end
    
    assign fft1_out_ready = 1;
    
    // Hook up FIFO and FFT I/O ports
    always_comb begin
        s00_axis_tready = reset_counter == 0; // Tempting to add "!fifo_full" but this can happen when in STATE_STUB, in which case we can't allow sample stream to get held up.
        fifo_din = s00_axis_tdata[15:0];
        fifo_wr_en = s00_axis_tvalid && s00_axis_tready;
        
        if (state == STATE_WAITING_FOR_INPUT) begin
            fft1_in_data[31:16] = 16'd0;    // Imaginary data
            fft1_in_data[15:0] = fifo_dout; // Real data from input stream
            fft1_in_valid = !fifo_empty;
            fft1_in_last = fft1_counter == NUM_SAMPLES-1;
            fifo_rd_en = fft1_in_ready;
        end else begin
            fft1_in_data[31:0] = 0;
            fft1_in_valid = 0;
            fft1_in_last = 0;
            fifo_rd_en = 0;
        end
    end
    
    // Get the pixel value to display at the current position
    assign mem_r_addr = ((x + 2) % 800) * 512 + (SCREEN_HEIGHT - 1 - y);
    wire[7:0] palette_index = mem_r_data << 4;
    wire[31:0] viridis_palette_value = viridis_palette[palette_index];
    
    always_ff @(posedge pixclk) begin
        if (x < SCREEN_WIDTH && y < SCREEN_HEIGHT) begin
            r <= viridis_palette_value[31:24];
            g <= viridis_palette_value[23:16];
            b <= viridis_palette_value[15:8];
        end
    end
    
    // Memory for keeping track of FFT history
    blk_mem_gen_0 your_instance_name (
      .clka(s00_axis_aclk),    // input wire clka
      .wea(mem_we),      // input wire [0 : 0] wea
      .addra(mem_w_addr),  // input wire [18 : 0] addra
      .dina(mem_w_data),    // input wire [3 : 0] dina
      .clkb(s00_axis_aclk),    // input wire clkb
      .addrb(mem_r_addr),  // input wire [18 : 0] addrb
      .doutb(mem_r_data)  // output wire [3 : 0] doutb
    );
    
    // FFT IP
    xfft_0 fft1 
    (
      .aclk(fft_clk),                                                // input wire aclk
      .aresetn(reset_counter == 0 ? 1 : 0),                                          // input wire aresetn
      
      .s_axis_config_tdata(config_data),                  // input wire [7 : 0] s_axis_config_tdata
      .s_axis_config_tvalid(config_valid),                // input wire s_axis_config_tvalid
      .s_axis_config_tready(config_ready),                // output wire s_axis_config_tready
      
      .s_axis_data_tdata(fft1_in_data),                      // input wire [63 : 0] s_axis_data_tdata
      .s_axis_data_tvalid(fft1_in_valid),                    // input wire s_axis_data_tvalid
      .s_axis_data_tready(fft1_in_ready),                    // output wire s_axis_data_tready
      .s_axis_data_tlast(fft1_in_last),                      // input wire s_axis_data_tlast
      
      .m_axis_data_tdata(fft1_out_data),                      // output wire [63 : 0] m_axis_data_tdata
      .m_axis_data_tvalid(fft1_out_valid),                    // output wire m_axis_data_tvalid
      .m_axis_data_tready(fft1_out_ready),                    // input wire m_axis_data_tready
      .m_axis_data_tlast(fft1_out_last),                      // output wire m_axis_data_tlast
      
      .m_axis_status_tready(1)
      
      //.event_frame_started(event_frame_started),                  // output wire event_frame_started
      //.event_tlast_unexpected(event_tlast_unexpected),            // output wire event_tlast_unexpected
      //.event_tlast_missing(event_tlast_missing),                  // output wire event_tlast_missing
      //.event_status_channel_halt(event_status_channel_halt),      // output wire event_status_channel_halt
      //.event_data_in_channel_halt(event_data_in_channel_halt),    // output wire event_data_in_channel_halt
      //.event_data_out_channel_halt(event_data_out_channel_halt)  // output wire event_data_out_channel_halt
    );
    
    // FIFO to receive sample values while FFT is busy
    fifo_generator_0 fifo_insn (
      .clk(s00_axis_aclk),      // input wire clk
      .srst(reset_counter == 0 ? 0 : 1),    // input wire srst
      .din(fifo_din),      // input wire [15 : 0] din
      .wr_en(fifo_wr_en),  // input wire wr_en
      .rd_en(fifo_rd_en),  // input wire rd_en
      .dout(fifo_dout),    // output wire [15 : 0] dout
      .full(fifo_full),    // output wire full
      .empty(fifo_empty)  // output wire empty
    );
    
endmodule