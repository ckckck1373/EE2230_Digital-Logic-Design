`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/04/28 18:02:07
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
    input pb_up,
    input pb_down,
    input pb_Do,
    input pb_Re,
    input pb_Mi,
    output mclk,
    output lrclk,
    output sclk,
    output sdin,
    output [7:0] segs,
    output [3:0] scan_ctl
    
    );
    
    
    wire clk_100Hz;
    wire [1:0]clk_ctl;
    wire pb_up_debounced;
    wire pb_up_onepulse;
    wire pb_down_debounced;
    wire pb_down_onepulse;
    wire [3:0]level;
    wire [15:0]audio_l,audio_r;
    reg [3:0]note;
    wire [3:0] value1,value0;
    wire [3:0] BCD;
    
    always @*
    begin
        if(pb_Do==1'b1)
            note = 4'd1;
        else if(pb_Re == 1'b1)
            note = 4'd2;
        else if(pb_Mi == 1'b1)
            note = 4'd3;
        else 
            note = 4'd0;            
    end   
    
           
Frequency_Divider U0(
      .clk_100Hz(clk_100Hz),
      .clk_ctl(clk_ctl), 
      .clk(clk), 
      .rst_n(rst_n) 
    );
//volume up
debounce_circuit U1(
      .clk(clk_100Hz), 
      .rst_n(rst_n), 
      .pb_in(pb_up), 
      .pb_debounced(pb_up_debounced)
    );  
    
one_pulse U2(
      .clk(clk_100Hz), 
      .rst_n(rst_n),
      .in_trig(pb_up_debounced), 
      .out_pulse(pb_up_onepulse) 
    );
    
    
    
// volume down   
debounce_circuit U3(
          .clk(clk_100Hz), 
          .rst_n(rst_n), 
          .pb_in(pb_down), 
          .pb_debounced(pb_down_debounced)
        );  
        
one_pulse U4(
          .clk(clk_100Hz), 
          .rst_n(rst_n),
          .in_trig(pb_down_debounced), 
          .out_pulse(pb_down_onepulse) 
        );

//controll volume level
level U5(
        .level(level),
        .up(pb_up_onepulse),
        .down(pb_down_onepulse),
        .clk(clk_100Hz),
        .rst_n(rst_n)
        ); 
            
// controll note
note U6 (
        .audio_l(audio_l),
        .audio_r(audio_r),
        .note(note),
        .level(level),
        .clk(clk),
        .rst_n(rst_n)   
        );            
        
// create clks for speaker  and turn  parallel to serial
speaker U7(
        .mclk(mclk),//master clk  
        .lrclk(lrclk), // right_left clk
        .sclk(sclk),//serial clk
        .sdin(sdin), 
        .audio_l(audio_l),
        .audio_r(audio_r), 
        .clk(clk),
        .rst_n(rst_n)
         );
                 
BCD_binary U8(
        .BCD1(value1),
        .BCD0(value0),
        .binary(level)
        );
        
scan_ctl U9(
        .scan_ctl(scan_ctl), 
        .ssd_in(BCD),
        .in0(4'd0), 
        .in1(4'd0), 
        .in2(value1), 
        .in3(value0),  
        .ssd_ctl_en(clk_ctl) 
        );  

Display U10(
    .ssd_in(BCD),
    .ssd_ctl(segs)
    ); 
         
endmodule
