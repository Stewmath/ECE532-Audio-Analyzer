`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Digilent Inc 
// Engineer: Arthur Brown
// 
// Create Date: 07/27/2016 02:04:01 PM
// Design Name: Basys3 Keyboard Demo
// Module Name: top
// Project Name: Keyboard
// Target Devices: Basys3
// Tool Versions: 2016.X
// Description: 
//     Receives input from USB-HID in the form of a PS/2, displays keyboard key presses and releases over USB-UART.
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
//     Known issue, when multiple buttons are pressed and one is released, the scan code of the one still held down is ometimes re-sent.
//////////////////////////////////////////////////////////////////////////////////


module top(
    input         clk,
    input         PS2Data,
    input         PS2Clk,
    //output        tx,
    
    input wire   s00_axis_aclk,
    input wire   s00_axis_aresetn,
    input        s00_axis_tready,
    output       s00_axis_tlast,
    output reg   [31 : 0] s00_axis_tdata,
    output reg   s00_axis_tvalid
);
    //wire        tready;
    //wire        ready;
    //wire        tstart;
    reg         start=0;
    reg         CLK50MHZ=0;
    //wire [31:0] tbuf;
    reg  [15:0] keycodev=0;
    wire [15:0] keycode;
    //wire [ 7:0] tbus;
    reg  [ 2:0] bcount=0;
    wire        flag;
    reg         cn=0;
    
    assign s00_axis_tlast = 1;
    
    always @(posedge(clk))begin
        CLK50MHZ<=~CLK50MHZ;
    end
    
    PS2Receiver uut (
        .clk(CLK50MHZ),
        .kclk(PS2Clk),
        .kdata(PS2Data),
        .keycode(keycode),
        .oflag(flag)
    );
    
    
    // this block seems to check when keycode changes
    always@(keycode, keycodev)
        if (keycode[7:0] == 8'hf0) begin
            cn <= 1'b0;
            bcount <= 3'd0;
        end else if (keycode[15:8] == 8'hf0) begin
            cn <= keycode != keycodev;
            bcount <= 3'd5;
        end else begin
            cn <= keycode[7:0] != keycodev[7:0] || keycodev[15:8] == 8'hf0;
            bcount <= 3'd2;
        end
    
    // declare as valid scan code
    always@(posedge clk)
        if (flag == 1'b1 && cn == 1'b1) begin
            start <= 1'b1;
            keycodev <= keycode;
        end else
            start <= 1'b0;
       
    /*
    // binary to ascii converter for uart     
    bin2ascii #(
        .NBYTES(2)
    ) conv (
        .I(keycodev),
        .O(tbuf)
    );
    
    // uart buffer
    uart_buf_con tx_con (
        .clk    (clk   ),
        .bcount (bcount),
        .tbuf   (tbuf  ),  
        .start  (start ), 
        .ready  (ready ), 
        .tstart (tstart),
        .tready (tready),
        .tbus   (tbus  )
    );
    
    //uart tx
    uart_tx get_tx (
        .clk    (clk),
        .start  (tstart),
        .tbus   (tbus),
        .tx     (tx),
        .ready  (tready)
    );
    */
    
    always @(posedge s00_axis_aclk) begin
        if(!s00_axis_aresetn) begin
            s00_axis_tdata  <= 0;  
            s00_axis_tvalid <= 0;
        end
        else begin
            if (start) begin
                s00_axis_tdata  <= keycodev;  
                s00_axis_tvalid <= 1'b1;
            end else if (s00_axis_tvalid && s00_axis_tready) begin // AXI Transmission happens
                s00_axis_tvalid <= 0;
            end
        end
    end
    
endmodule
