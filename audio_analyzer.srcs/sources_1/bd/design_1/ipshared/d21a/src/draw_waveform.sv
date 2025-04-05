`timescale 1ns / 1ps

// Takes audio samples as input through an AXI Stream interface,
// produces a graphical output of the waveform.

module draw_waveform #(
    SCREEN_WIDTH = 640,
    SCREEN_HEIGHT = 480,
    
    NUM_SAMPLES = 1024, // Must be power of 2
    SAMPLE_INDEX_BITS = 10, // Make this log2(NUM_SAMPLES)
    SAMPLE_DEPTH = 16,
    
    C_S00_AXIS_TDATA_WIDTH = 32
) (
	// Ports of Axi stream interface S00_AXIS
	// Provides waveform data. Samples are 16-bit signed integers.
	input wire   s00_axis_aclk,
	input wire   s00_axis_aresetn,
	output       s00_axis_tready,
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
    output reg [7:0] b
    );
    
    // Two sample buffers to implement something like double-buffering
    (* ram_style = "block" *) reg signed[9:0] samples_0[NUM_SAMPLES-1:0];
    (* ram_style = "block" *) reg signed[9:0] samples_1[NUM_SAMPLES-1:0];
    
    // 0: record to samples_0, 1: record to samples_1
    reg record_buffer;
    
    // Index in display buffer of first sample to display on x-axis
    reg[SAMPLE_INDEX_BITS-1:0] samples_head_display;
    
    // Index in record buffer of next sample to write
    reg[SAMPLE_INDEX_BITS-1:0] samples_tail;
    
    // Logic to detect pixclk high edge within faster clock
    reg swapped_buffer;
    
    // Convert sample value to a y-coordinate on the screen
    wire signed[SAMPLE_DEPTH-1:0] input_sample = s00_axis_tdata[SAMPLE_DEPTH-1:0];
    wire[9:0] input_sample_y = (input_sample / -137) + SCREEN_HEIGHT / 2;
    
    //typedef enum {STAGE_WAITING, STAGE_1, STAGE_2} e_state;
    localparam STAGE_WAITING = 0;
    localparam STAGE_1 = 1;
    localparam STAGE_2 = 2;
    reg[1:0] sample_calc_stage;    
    reg[1:0] next_sample_calc_stage;
    
    reg [SAMPLE_DEPTH-1:0] sample_calc_1;
    reg [9:0]              sample_calc_2;
    
    logic reset_buf1;
    logic reset_buf2;
    
    assign reset_buf1 = ~s00_axis_aresetn;
    assign reset_buf2 = ~reset_buf1;
    
    // Handle waveform inputs
    assign s00_axis_tready = sample_calc_stage == STAGE_WAITING;
    always_ff @(posedge s00_axis_aclk) begin
        if (!reset_buf2) begin
            samples_head_display <= 0;
            samples_tail <= 0;
            record_buffer <= 0;
            sample_calc_stage <= STAGE_WAITING;
            swapped_buffer <= 0;
        end else begin
            case (sample_calc_stage)
                STAGE_WAITING: begin
                    if (s00_axis_tvalid && s00_axis_tready) begin
                        sample_calc_1 <= input_sample / -128; // Should really be divide by -137, but divison is expensive
                    end
                end
                STAGE_1: begin
                    sample_calc_2 <= sample_calc_1 + SCREEN_HEIGHT / 2;
                end
                STAGE_2: begin
                    if (record_buffer == 0)
                        samples_0[samples_tail] <= sample_calc_2;
                    else
                        samples_1[samples_tail] <= sample_calc_2;
                    samples_tail <= samples_tail + 1;
                end
            endcase
            
            sample_calc_stage <= next_sample_calc_stage;
            
            // Swap buffers
            if (x == 0 && y == 524) begin
                if (!swapped_buffer) begin
                    samples_head_display <= samples_tail - SCREEN_WIDTH;
                    samples_tail <= 0;
                    record_buffer <= ~record_buffer;
                    swapped_buffer <= 1;
                    $display("Swap");
                end
            end else begin
                swapped_buffer <= 0;
            end
        end
    end
    
    always_comb begin
        case (sample_calc_stage)
            STAGE_WAITING:
                if (s00_axis_tvalid && s00_axis_tready)
                    next_sample_calc_stage = STAGE_1;
                else
                    next_sample_calc_stage = STAGE_WAITING;
            STAGE_1:
                next_sample_calc_stage = STAGE_2;
            STAGE_2:
                next_sample_calc_stage = STAGE_WAITING;
            default:
                next_sample_calc_stage = STAGE_WAITING;
        endcase
    end
    
    // Get the y-coordinate for the sample on this x-position
    wire[SAMPLE_INDEX_BITS-1:0] sample_index = samples_head_display + x + 1; // Wraparound is automatic
    reg[9:0] sample_y;
    reg[9:0] last_sample_y;
    
    always_ff @(posedge pixclk) begin
        if (x < SCREEN_WIDTH && y < SCREEN_HEIGHT) begin
            // Decide whether to draw the sample here or not
            if (y == sample_y || (last_sample_y < y && y < sample_y) || (sample_y < y && y < last_sample_y)) begin
                r <= 0;
                g <= 255;
                b <= 0;
            end else begin
                r <= 0;
                g <= 0;
                b <= 0;
            end
            
            sample_y      <= record_buffer ? samples_0[sample_index] : samples_1[sample_index];
            last_sample_y <= sample_y;
        end else begin
            sample_y      <= record_buffer ? samples_0[samples_head_display] : samples_1[samples_head_display];
            last_sample_y <= record_buffer ? samples_0[samples_head_display] : samples_1[samples_head_display];
        end
    end
    
endmodule
