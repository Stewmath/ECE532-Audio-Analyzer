`timescale 1ns / 1ps

// Simulates a module that draws something, writes a frame to a file.
//
// To convert output (gfx-00.rgb) to a PNG file:
//   convert -size 640x480 -depth 8 gfx-00.rgb gfx.png
//
// To convert a batch of outputs to a .gif:
//   for f in *.rgb; do convert -depth 8 -size 640x480 $f ${f%.rgb}.png; done
//   convert -delay 2 *.png out.gif
//
// Before running the simulation within an IP repo, you may need to execute:
//   set_property library xil_defaultlib [get_files]
//
// When the FFT in the spectrogram module is finished working, turn it off by finding the
// "fft_clk" signal in the simulation and using "force constant" to set it to 0.
// Otherwise it takes eons to render a frame (during which time the FFT is doing nothing,
// at least in this testbench).

module frame_to_file
    #(
    SCREEN_WIDTH = 640,
    SCREEN_HEIGHT = 480,
    
    SAMPLE_RATE = 44100
    )
    ();
    
    reg clk=0, pixclk=0;
    reg[9:0] CounterX = 0, CounterY = 0;
    reg DrawArea;
    reg hSync, vSync;
    
    // Signals for multiplexer
    wire[7:0] r, g, b;
    reg pitch_graph_reset = 0;
    reg[1:0] output_select = 0;
    
    // AXI stream interface for sending samples
	wire smpl_axis_tready;
	reg [31:0] smpl_axis_tdata;
	reg smpl_axis_tvalid;
	
    // AXI stream interface for sending pitch data
	reg resetn;
	wire pitch_axis_tready;
	reg [31:0] pitch_axis_tdata;
	reg pitch_axis_tvalid;
    
    /*
    draw_waveform #(
        .SCREEN_WIDTH(SCREEN_WIDTH),
        .SCREEN_HEIGHT(SCREEN_HEIGHT)
    ) dut (
        .clk(clk), .pixclk(pixclk),
        .r(r), .g(g), .b(b),
        .x(CounterX), .y(CounterY),
        
        .s00_axis_aresetn(resetn),
        .s00_axis_aclk(clk),
        .s00_axis_tready(smpl_axis_tready),
        .s00_axis_tdata(smpl_axis_tdata),
        .s00_axis_tvalid(smpl_axis_tvalid)
    );
    */
    
    multiplexer multiplexer (
        .clk(clk), .pixclk(pixclk),
        .r(r), .g(g), .b(b),
        .x(CounterX), .y(CounterY),
        
        .pitch_graph_reset(pitch_graph_reset),
        .pitch_graph_draw_record_cursor(1),
        .pitch_graph_playback_cursor_index(-1),
        
        .spectrogram_reset(0),
        .spectrogram_multiplier(5),
        
        .smpl_axis_aresetn(resetn),
        .smpl_axis_aclk(clk),
        .smpl_axis_tready(smpl_axis_tready),
        .smpl_axis_tdata(smpl_axis_tdata),
        .smpl_axis_tvalid(smpl_axis_tvalid),
        
        .pitch_axis_aresetn(resetn),
        .pitch_axis_aclk(clk),
        .pitch_axis_tready(pitch_axis_tready),
        .pitch_axis_tdata(pitch_axis_tdata),
        .pitch_axis_tvalid(pitch_axis_tvalid),
        
        .output_select(output_select)
    );
    
    always begin
        #5 clk = ~clk;
    end
    always begin
        #20 pixclk = ~pixclk;
    end
    
    // Code copied from HDMI controller, to keep characteristics of CounterX/CounterY identical
    always @(posedge pixclk)
    begin  
        DrawArea <= (CounterX<640) && (CounterY<480);           // define picture dimensions for 640x480 (off-screen data 800x525)
        CounterX <= (CounterX==799) ? 0 : CounterX+1;           // horizontal counter (including off-screen horizontal 160 pixels) total of 800 pixels 
        if(CounterX==799) 
            CounterY <= (CounterY==524) ? 0 : CounterY+1;       /* vertical counter (including off-screen vertical 45 pixels) total of 525 pixels
                                                                   only counts up 1 count after horizontal finishes. */                                                          
        hSync <= (CounterX>=656) && (CounterX<752);         // hsync high for 96 counts                                                 
        vSync <= (CounterY>=490) && (CounterY<492);         // vsync high for 2 counts
    end
    
    
    integer out_file;
    integer frame_number = 0;
    
    enum {RECORD_OFF, RECORD_WAITING, RECORD_IN_PROGRESS} record_state = RECORD_OFF;
    
    // Generate one frame, output to file
    task capture_frame();
        string filename;
        
        wait(record_state == RECORD_OFF);
        @(posedge pixclk);
        
        $display("Begin frame capture");
        
        // Generate filename (for numbers < 10 have a leading zero)
        if (frame_number < 10)
            $sformat(filename, "%s/gfx-0%0d.rgb", "/home/matthew/tmp", frame_number);
        else
            $sformat(filename, "%s/gfx-%0d.rgb", "/home/matthew/tmp", frame_number);
            
        $display("Filename: %s", filename);
        out_file = $fopen(filename, "wb");
        
        record_state = RECORD_WAITING;
        frame_number = frame_number + 1;
    endtask
    
    // Logic for recording a frame
    always_ff @(posedge pixclk) begin
        if (record_state == RECORD_WAITING) begin
            if (CounterY == 524) begin
                record_state <= RECORD_IN_PROGRESS;
            end
        end else if (record_state == RECORD_IN_PROGRESS) begin
            if (CounterX < SCREEN_WIDTH && CounterY < SCREEN_HEIGHT) begin
                $fwrite(out_file, "%c", r);
                $fwrite(out_file, "%c", g);
                $fwrite(out_file, "%c", b);
            end
            
            if (CounterX == SCREEN_WIDTH-1 && CounterY == SCREEN_HEIGHT-1) begin
                $fclose(out_file);
                $display("Closed output gfx file\n");
                record_state <= RECORD_OFF;
            end
        end
    end
    
    // 5 seconds worth of sample data loaded from .mem file
    reg signed[15:0] sample_data[SAMPLE_RATE * 5 : 0];
    
    initial begin
        int samples_read;
        $readmemh("pachelbel_canon_fragment.mem", sample_data); // Raw sample data
        
        output_select = 0;
        resetn = 0;
        smpl_axis_tvalid = 0;
        @(posedge clk);
        @(posedge clk);
        
        resetn <= 1;
        @(posedge clk);
        
        // Send audio samples to waveform, capture frames periodically
        samples_read = 0;
        for (int frames=0; frames<1; frames=frames+1) begin
            for (int i=0; i<1024 * 100; i++) begin
                smpl_axis_tvalid <= 1;
                smpl_axis_tdata <= sample_data[samples_read];
                samples_read <= samples_read+1;
                @(posedge clk);
                while (!(smpl_axis_tready)) begin
                    @(posedge clk);
                end
            end
            smpl_axis_tvalid <= 0;
            capture_frame();
            wait(record_state == RECORD_OFF);
        end
        
        output_select = 2;
        @(posedge clk);
        capture_frame();
        wait(record_state == RECORD_OFF);
    end
    
    /*
    initial begin
        output_select = 1;
        resetn = 0;
        smpl_axis_tvalid = 0;
        @(posedge clk);
        @(posedge clk);
        
        resetn <= 1;
        @(posedge clk);
        
        // Send pitch values to pitch graph (should scale logarithmically)
        for (int frames=0; frames<1; frames=frames+1) begin
            for (int i=1024; i>=0; i-=2) begin
                pitch_axis_tvalid <= 1;
                pitch_axis_tdata <= i;
                @(posedge clk);
                while (!(pitch_axis_tready)) begin
                    @(posedge clk);
                end
            end
            pitch_axis_tvalid <= 0;
            capture_frame();
        end
    end
    */
    
endmodule
