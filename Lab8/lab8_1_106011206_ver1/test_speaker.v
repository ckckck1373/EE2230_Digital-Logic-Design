`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/04/28 15:34:50
// Design Name: 
// Module Name: test_speaker
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


module test_speaker;

    wire mclk;
    wire lrclk;
    wire sclk;
    wire sdin;
    reg [15:0] audio_l;
    reg [15:0] audio_r;
    reg clk;
    reg rst_n;
    
    speaker U0 (mclk, lrclk, sclk, sdin, audio_l, audio_r, clk, rst_n);
    
    always
        #1 clk = ~clk;
        
    initial
    begin
        clk = 0; rst_n = 1; audio_l = 16'hB000;  audio_r = 16'h5FFF;
        #1 rst_n = 0;
        #1 rst_n = 1;
    end

endmodule

