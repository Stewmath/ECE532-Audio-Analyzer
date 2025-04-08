`timescale 1ns / 1ps

// This is a standalone testbench that simulates a VGA/HDMI controller which accepts rgb inputs,
// renders a frame, and writes it to a file (by default to "/tmp/gfx-00.rgb").
//
// This is a cleaned up version of "frame_to_file.sv" in our main project, made into a
// standalone testbench as an example. 
//
// To convert the output (gfx-00.rgb) to a PNG file, use "convert" (imagemagick):
//   convert -size 640x480 -depth 8 gfx-00.rgb gfx.png
//
// A bash 2-liner to convert a batch of outputs to a .gif:
//   for f in *.rgb; do convert -depth 8 -size 640x480 $f ${f%.rgb}.png; done
//   convert -delay 2 *.png out.gif
//
// It may be necessary to update the characteristics of the CounterX and CounterY registers - they
// should match your actual HDMI or VGA code as closely as possible. They should go beyond the
// normal screen boundaries to create hsync and vsync periods.

module frame_to_file
    #(
    SCREEN_WIDTH = 640,
    SCREEN_HEIGHT = 480
    )
    ();
    
    // In our original code, clk=100MHz, pixclk=25MHz for a 640x480 HDMI display.
    // ("clk" doesn't really matter for this example, but any logic not directly related
    // to graphical output should probably run on "clk" instead of "pixclk".
    reg clk=0, pixclk=0;
    
    // Position being drawn right now
    reg[9:0] CounterX = 0, CounterY = 0;
    
    // DrawArea = 1 if in screen bounds
    reg DrawArea;
    reg hSync, vSync;
    
    // RGB values to display at CounterX,CounterY
    wire[7:0] r, g, b;
    
    // Main clock
    always begin
        #5 clk = ~clk;
    end
    
    // Pixel clock (on high edge, proceed to next pixel)
    always begin
        #20 pixclk = ~pixclk;
    end
    
    // Code copied from HDMI controller, to keep characteristics of CounterX/CounterY identical.
    // CounterX, CounterY represent the position of the current pixel being drawn.
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
    
    // Generate one frame, output to file in /tmp directory
    task capture_frame();
        string filename;
        
        wait(record_state == RECORD_OFF);
        @(posedge pixclk);
        
        $display("Begin frame capture");
        
        // Generate filename (for numbers < 10 have a leading zero)
        if (frame_number < 10)
            $sformat(filename, "%s/gfx-0%0d.rgb", "/tmp", frame_number);
        else
            $sformat(filename, "%s/gfx-%0d.rgb", "/tmp", frame_number);
            
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
    
    
    // Graphics drawing logic goes here! This just draws a few lines and captures one frame.
    
    assign r = CounterX == CounterY ? 255 : 0;
    assign g = (SCREEN_WIDTH - 1 - CounterX) == CounterY ? 255 : 0;
    assign b = CounterX == SCREEN_WIDTH / 2 ? 255 : 0;
    
    initial begin
        capture_frame();
    end
    
endmodule
