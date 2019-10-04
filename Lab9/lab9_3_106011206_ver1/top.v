`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/05/13 12:35:25
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
    inout PS2_CLK,
    inout PS2_DATA,
    input clk, 
    input rst,
    output [7:0] segs,
    output [3:0] scan_ctl,   
    output [3:0] state 
   );
    
    
    wire [1:0] clk_ctl;
    wire [511:0] key_down;
    wire [8:0] last_change;
    wire [3:0] BCD;
    reg [3:0] digit3_dis,digit2_dis,digit1_dis,digit0_dis;
    wire [3:0] ssd_in;
    wire [3:0] digit3_sum,digit2_sum,digit1_sum,digit0_sum;
    wire [3:0] digit3_multi,digit2_multi,digit1_multi,digit0_multi;
    wire [3:0] digit3_sub,digit2_sub,digit1_sub,digit0_sub;
    wire [3:0] digit3,digit2,digit1,digit0;
    wire [3:0] symbol;
    reg [3:0] digit3_tmp,digit2_tmp,digit1_tmp,digit0_tmp;
    reg [3:0] symbol_tmp;
   
 always@*
       begin
           /*if(state == 4'b0010)
           begin
               digit3_dis = digit3;
               digit3_tmp = digit3;
           end
           else if(state == 4'b0100)
           begin
               digit2_dis = digit2;
               digit2_tmp = digit2;
           end
           else if(state == 4'b0110 )
           begin
               digit1_dis = digit1;
               digit1_tmp = digit1;
           end
           else if (state == 4'b1000)
           begin
               digit0_dis = digit0;
               digit0_tmp = digit0;
           end*/
           if (state == 4'b1010)
           begin 
               digit3_dis = symbol;
               digit2_dis = symbol;
               digit1_dis = symbol;
               digit0_dis = symbol; 
               symbol_tmp = symbol;
           end
           else if(state == 4'b1100 && symbol_tmp == 4'd10)
           begin
               digit3_dis = digit3_sum;
               digit2_dis = digit2_sum;
               digit1_dis = digit1_sum;
               digit0_dis = digit0_sum;
           end
           else if(state == 4'b1100 && symbol_tmp == 4'd11)
           begin
               digit3_dis = digit3_multi;
               digit2_dis = digit2_multi;
               digit1_dis = digit1_multi;
               digit0_dis = digit0_multi;
           end
           else if(state == 4'b1100 && symbol_tmp == 4'd12)
           begin
                digit3_dis = digit3_sub;
                digit2_dis = digit2_sub;
                digit1_dis = digit1_sub;
                digit0_dis = digit0_sub;
           end
           else 
           begin
                digit3_dis = digit3;
                digit2_dis = digit2;
                digit1_dis = digit1;
                digit0_dis = digit0;
           end
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
        
FSM U3(
           .next_state(state), 
           .BCD(BCD), 
           .in(key_valid),
           .digit3(digit3),
           .digit2(digit2),
           .digit1(digit1),
           .digit0(digit0),
           .symbol(symbol),
           .clk(clk), 
           .rst_n(~rst)  
            );         
        
Sum U4( 
            .clk(clk),
            .rst_n(~rst),
            .digit3(digit3),
            .digit2(digit2),
            .digit1(digit1),
            .digit0(digit0),
            .digit3_sum(digit3_sum),
            .digit2_sum(digit2_sum),
            .digit1_sum(digit1_sum),
            .digit0_sum(digit0_sum)
        );

Multi U5(
            .clk(clk),
            .rst_n(~rst),
            .digit3(digit3),
            .digit2(digit2),
            .digit1(digit1),
            .digit0(digit0),
            .digit3_multi(digit3_multi),
            .digit2_multi(digit2_multi),
            .digit1_multi(digit1_multi),
            .digit0_multi(digit0_multi)
            );

Sub U6(
            .clk(clk),
            .rst_n(~rst),
            .digit3(digit3),
            .digit2(digit2),
            .digit1(digit1),
            .digit0(digit0),
            .digit3_sub(digit3_sub),
            .digit2_sub(digit2_sub),
            .digit1_sub(digit1_sub),
            .digit0_sub(digit0_sub)
            );
               
scan_ctl U8(
            .scan_ctl(scan_ctl), 
            .ssd_in(ssd_in),
            .in0(digit3_dis), 
            .in1(digit2_dis), 
            .in2(digit1_dis), 
            .in3(digit0_dis),  
            .ssd_ctl_en(clk_ctl) 
            );
        
Display_for_keyboard U9(
           .ssd_in(ssd_in),
           .ssd_ctl(segs)
            );        
                  
 endmodule  