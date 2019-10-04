`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/05/18 14:52:52
// Design Name: 
// Module Name: top
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


module top(
    input clk,
    input rst_n,
    output mclk,
    output lrclk,
    output sclk,
    output sdin,
    output [3:0]scan_ctl,
    output [7:0] segs,
    output [3:0] state
    );
    
    wire clk_1Hz;
    wire [1:0] clk_ctl;
    wire [3:0]digit0;
    wire [15:0] audio_l,audio_r;
    
    assign scan_ctl = 4'b1110;
    
    
 Frequency_Divider U0(
      .clk_1Hz(clk_1Hz),
      .clk_ctl(clk_ctl), 
      .clk(clk), 
      .rst_n(rst_n) 
    );    
    
 FSM U1(
      .state(state),  
      .digit0(digit0),
      .clk(clk_1Hz), 
      .rst_n(rst_n)  
    );    
    
 note U2(
         .audio_l(audio_l),
         .audio_r(audio_r),
         .note(digit0),
         .level(4'd4),
         .clk(clk),
         .rst_n(rst_n)
        );    
        
 speaker U3(
            .mclk (mclk), //
            .lrclk(lrclk), // right_left clk
            .sclk(sclk),//serial clk
            .sdin(sdin), 
            .audio_l(audio_l),
            .audio_r(audio_r), 
            .clk(clk),
            .rst_n(rst_n)
            );        

Display U4(
    .ssd_in(digit0),
    .segs(segs)
    );
                
endmodule
