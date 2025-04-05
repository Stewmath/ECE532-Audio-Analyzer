`timescale 1ns / 1ps

// Draws a graph showing pitch over time on a logarithmic scale.

module draw_pitch_graph #(
    SCREEN_WIDTH = 640,
    SCREEN_HEIGHT = 480,
    
    PITCH_COUNT = 1024, // Must be power of 2
    PITCH_COUNT_BITS = 10, // Make this log2(PITCH_COUNT)
    PITCH_DEPTH = 16, // Depth of pitch values from AXI Stream
    
    MIN_FREQUENCY = 100,
    MAX_FREQUENCY = 1024, // Keep a power of 2 for the sake of the ln array
    MIN_FREQ_LN = int'($ln(MIN_FREQUENCY) * 256), // ln of above in 24.8 fixed-point
    MAX_FREQ_LN = int'($ln(MAX_FREQUENCY) * 256),
    
    CHART_START_X = 25,
    CHART_END_X = SCREEN_WIDTH - 10,
    CHART_START_Y = 0,
    CHART_END_Y = SCREEN_HEIGHT - 1,
    
    NO_VALUE = 1023, // For pitch_y_values array
    
    // Fixed point structures for taking ln
    FIXED_POINT_SIZE = 32,   // 32 bits in total
    FIXED_POINT_DECIMAL = 8, // 8 decimal points (24 integer parts)
    
    C_S00_AXIS_TDATA_WIDTH = 32
) (
	// Ports of Axi stream interface S00_AXIS
	// Provides pitch data.
	input wire   s00_axis_aclk,
	input wire   s00_axis_aresetn,
	output reg   s00_axis_tready,
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
    
    input reset, // Active high
    input wire draw_record_cursor, // Whether to draw the record cursor
    input wire[9:0] playback_cursor_index, // Position of playback cursor (fully software controlled
    output reg finished // Set to 1 if out of space on the screen for more pitch values
    );
    
    // ln_table[i] = ln(i) in 24.8 fixed-point format
    (* rom_style = "block" *) reg[FIXED_POINT_SIZE-1:0] ln_table[MAX_FREQUENCY-1 : 0];
    
    // Background image, each 32-bit entry has format: RRGGBB00
    (* rom_style = "block" *) reg[31:0] pitch_graph_background[SCREEN_WIDTH*SCREEN_HEIGHT-1 : 0];
    
    // Load ln_table
    initial begin
        $readmemh("ln_table.mem", ln_table);
        $readmemh("pitch_graph_background.mem", pitch_graph_background);
    end
    
    // Index with screen x-position to get the y-position to draw the pitch at. All 1's mean draw nowhere.
    (* ram_style = "block" *) reg[9:0] pitch_y_values[1023:0];
    reg[9:0] pitch_record_x; // Next position in array to record a pitch at
    
    // TODO: Handle less than, greater than minimum frequency
    reg[FIXED_POINT_SIZE-1:0] pitch_y_calc_1, pitch_y_calc_2, pitch_y_calc_3;
    reg pitch_y_calc_1_ready, pitch_y_calc_2_ready, pitch_y_calc_3_ready;
    
    assign s00_axis_tready = pitch_record_x < SCREEN_WIDTH && !pitch_y_calc_1_ready;
    
    always_ff @(posedge s00_axis_aclk) begin
        if (!s00_axis_aresetn || reset) begin
            pitch_record_x <= CHART_START_X;
            pitch_y_calc_1_ready <= 0;
            pitch_y_calc_2_ready <= 0;
            finished <= 0;
            for (int i=0; i<1024; i++)
                pitch_y_values[i] <= NO_VALUE;
        end else begin
            if (s00_axis_tvalid && s00_axis_tready) begin
                pitch_y_calc_1_ready <= 1;
                pitch_y_calc_1 <= ln_table[s00_axis_tdata[PITCH_DEPTH-1:0]];
            end
            
            // Split y-position calculation into multiple cycles
            if (pitch_y_calc_1_ready) begin
                pitch_y_calc_2 <= (pitch_y_calc_1 - MIN_FREQ_LN);
                pitch_y_calc_1_ready <= 0;
                pitch_y_calc_2_ready <= 1;
            end
            if (pitch_y_calc_2_ready) begin
                // Complicated equation is complicated because it's all integer math, no decimals here.
                // In particular, CHART_END_Y - CHART_START_Y is shifted left 8 to increase precision of multiplier.
                // This is undone at the end.
                pitch_y_calc_3 <= ((pitch_y_calc_2) * (((CHART_END_Y - CHART_START_Y) << 8) / (MAX_FREQ_LN - MIN_FREQ_LN))) >> 8;
                pitch_y_calc_2_ready <= 0;
                pitch_y_calc_3_ready <= 1;
            end
            
            if (pitch_y_calc_3_ready) begin
                pitch_y_values[pitch_record_x] <= (pitch_y_calc_3) * -1 + CHART_END_Y;
                pitch_y_calc_3_ready <= 0;
                
                pitch_record_x <= pitch_record_x + 1;
                if (pitch_record_x == CHART_END_X - 1)
                    finished <= 1;
            end
        end
    end
    
    // Should have the pitch_y value for the current pixel
    reg[9:0] pitch_y = pitch_y_values[x];
    reg[9:0] last_pitch_y;
    
    wire[31:0] bg_pixel = pitch_graph_background[x + y * SCREEN_WIDTH];
    
    always_ff @(posedge pixclk) begin
        if (x < SCREEN_WIDTH && y < SCREEN_HEIGHT) begin
            if ((draw_record_cursor && x == pitch_record_x) || x == playback_cursor_index + CHART_START_X) begin
                r <= 255;
                g <= 0;
                b <= 0;
            // Decide whether to draw the sample here or not
            end else if (pitch_y < SCREEN_HEIGHT && (y == pitch_y || (last_pitch_y < y && y < pitch_y) || (pitch_y < y && y < last_pitch_y))) begin
                r <= 88;
                g <= 23;
                b <= 163;
            end else begin
                r <= bg_pixel[31:24];
                g <= bg_pixel[23:16];
                b <= bg_pixel[15:8];
            end
            
            // Calculate pitch y values for next cycle
            pitch_y <= pitch_y_values[x+1];
            last_pitch_y <= (pitch_y >= SCREEN_HEIGHT ? pitch_y_values[x+1] : pitch_y);
        end else if (x == 799) begin
            pitch_y <= pitch_y_values[0];
            last_pitch_y <= NO_VALUE;
        end
    end
endmodule