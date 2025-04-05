`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/20/2025 06:23:41 PM
// Design Name: 
// Module Name: cepstrum_tb
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

module cepstrum_tb();
    localparam NUM_SAMPLES = 1024;

    reg aclk;
    reg aresetn;
    
    reg [31:0] data_in;       // Input data stream
    reg in_valid;
    reg in_last;
    wire in_ready;
    
    wire [31:0] out_data;     // Output data stream
    wire out_valid;
    wire out_last;
    reg out_ready;

    reg [31:0] input_data [NUM_SAMPLES-1:0];   // input data for IP

    integer i;
         
    cepstrum_pitch_detector tb_in(
        .s00_axis_aclk(aclk),
        .s00_axis_aresetn(aresetn),
    
        .s00_axis_tdata(data_in),       // Input data stream
        .s00_axis_tvalid(in_valid),
        .s00_axis_tlast(in_last),
        .s00_axis_tready(in_ready),
    
        .m00_axis_tdata(out_data),     // Output data stream
        .m00_axis_tvalid(out_valid),
        .m00_axis_tlast(out_last),
        .m00_axis_tready(out_ready)
    );
    
    always
    begin
        #5 aclk = ~aclk;    // unit 10 period
    end
    
    integer input_file;
    integer output_file;
    integer scanRet;
    
    initial begin
        aclk = 0;
        aresetn = 0;        // active low
        
        in_valid = 1'b0;
        data_in = 32'd0;
        in_last = 1'b0;
        
        out_ready = 1'b1;
        
        // Read input data
        input_file = $fopen("/home/matthew/tb_input.txt", "r");
        for (i=0; i<NUM_SAMPLES; i = i+1) begin
            scanRet = $fscanf(input_file, "%d\n", input_data[i]);
            //$assert(scanRet > 0);
            //$display("READ: %d\n", input_data[i]); 
        end
        $fclose(input_file);
        
        output_file = $fopen("/home/matthew/tb_output.txt", "w");
    end
    
    initial begin
        #70
        aresetn = 1;
        
        //input_data[0] = 32'b0;
        //input_data[1] = 32'b10111111001101110011100100111101;
        //input_data[2] = 32'b10111111011111111110110001010011;
        //input_data[3] = 32'b10111111001011100011111010110010;
        //input_data[4] = 32'b00111101010010001010100011101110;
        //input_data[5] = 32'b00111111001111111100001100100100;
        //input_data[6] = 32'b00111111011111110100111011111111;
        //input_data[7] = 32'b00111111001001001101100100001001;
        //input_data[8] = 32'b10111101110010000110101101000000;
        //input_data[9] = 32'b10111111010001111101011100101000;
        //input_data[10] = 32'b10111111011111100001010010110110;
        //input_data[11] = 32'b10111111000110110000111000001001;
        //input_data[12] = 32'b00111110000101100000001101101010;
        //input_data[13] = 32'b00111111010011110111000001010010;
        //input_data[14] = 32'b00111111011111000011111000111100;
        //input_data[15] = 32'b00111111000100001110001110110111;
    
    end
    
    
    initial begin           // input port init block
        #100
        for(i = NUM_SAMPLES-1; i >= 0; i = i-1) begin
            #10
            if(i == 0) begin
                in_last = 1'b1;
            end
            
            data_in = input_data[i];
            in_valid = 1'b1;
            
            while(in_ready == 0) begin      // waiting for axi handshake
                #10 in_valid = 1'b1;
            end
        end
        
        #10
        in_valid = 1'b0;
        in_last = 1'b0;
        
    end
    
    initial begin       // output port init block
        #100
        
        // Wait for output to begin
        wait(out_valid == 1);
        // Wait for output to end
        wait(out_valid == 0);
        
        out_ready = 1'b0;
        
        $fclose(output_file);
        $display("Closed output file");
    end
    
    // Record outputs
    always @(posedge aclk) begin
        if (out_valid && out_ready) begin
            $fwrite(output_file, "%0d\n", out_data);
        end
    end


endmodule

