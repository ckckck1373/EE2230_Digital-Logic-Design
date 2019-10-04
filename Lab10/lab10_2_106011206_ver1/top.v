`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/05/18 19:10:10
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
	inout  PS2_DATA,
    inout  PS2_CLK,
    output mclk,
    output lrclk,
    output sclk,
    output sdin,
    output [7:0] segs,
    output [3:0] scan_ctl,
    input clk,
    input rst
    );
    
     
     wire [1:0] clk_ctl;
     wire [511:0] key_down;
     wire [8:0] last_change;
     wire key_valid;
     wire [15:0] audio_l,audio_r;
     wire [3:0] ssd_in;
     reg [3:0]note; 
     wire [3:0]BCD;
     /*reg press_next;
        reg press;*/
     
   /*always@(posedge clk or posedge rst)
    begin
        if(rst == 1'b1)
            press <= 1'b0;
        else 
            press <= press_next;
     end
   
   
    always@*
    begin
        case(press)
        1'b0: 
            if(key_valid == 1'b1)
                 press_next = 1'b1;
             else 
                 press_next = 1'b0;
        1'b1:
             if(key_valid == 1'b1)
                 press_next = 1'b0;
             else 
                 press_next = 1'b1; 
        default: press_next = 1'b0;
        endcase   
    end*/
     
     
always@*
begin
    if(key_down[21]== 1'd1)
        note = 4'd1;
    else if (key_down[29]== 1'd1)
        note = 4'd2;
    else if (key_down[36]== 1'd1)
         note = 4'd3;
    else if (key_down[45]== 1'd1)
         note = 4'd4;
    else if (key_down[44]== 1'd1)
          note = 4'd5;
    else if (key_down[53]== 1'd1)
          note = 4'd6;
    else if (key_down[60]== 1'd1)
           note = 4'd7;
    else if (key_down[28]== 1'd1)
           note = 4'd8;
    else if (key_down[27]== 1'd1)
           note = 4'd9;
    else if (key_down[35]== 1'd1)
           note = 4'd10;
    else if (key_down[43]== 1'd1)
           note = 4'd11;       
    else if (key_down[52]== 1'd1)
           note = 4'd12;   
    else if (key_down[51]== 1'd1)
           note = 4'd13;      
    else if (key_down[59]== 1'd1)
           note = 4'd14;     
    else 
           note = 4'd0;
end
     
     
KeyboardDecoder U0(
            .key_down(key_down),
            .last_change(last_change),
            .key_valid(key_valid),
            .PS2_DATA(PS2_DATA),
            .PS2_CLK(PS2_CLK),
            .rst(rst),
            .clk(clk)
            );
            
Frequency_Divider U1(
            .clk_ctl(clk_ctl), 
            .clk(clk), 
            .rst_n(~rst) 
            );                 
            
            
Hexa_deci U2(
           .last_change(last_change),
           .BCD(BCD)
            );           
    
    
    
    
    
note U3(
          .audio_l(audio_l),
          .audio_r(audio_r),
          .note(note),
          .level(4'd5),
          .clk(clk),
          .rst_n(~rst)
          );    
                       
speaker U4(
          .mclk (mclk), 
          .lrclk(lrclk), // right_left clk
          .sclk(sclk),//serial clk
          .sdin(sdin), 
          .audio_l(audio_l),
          .audio_r(audio_r), 
          .clk(clk),
          .rst_n(~rst)
           );        
    
    
scan_ctl U5(
          .scan_ctl(scan_ctl), 
          .ssd_in(ssd_in),
          .in0(4'd0), 
          .in1(4'd0), 
          .in2(4'd0), 
          .in3(BCD),  
          .ssd_ctl_en(clk_ctl) 
           );    
           
           
Display U6(
          .ssd_in(ssd_in),
          .segs(segs)
           );             
endmodule
