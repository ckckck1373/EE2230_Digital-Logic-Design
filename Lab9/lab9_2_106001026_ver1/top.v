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
    output [2:0] state
    );
    
    
    wire [1:0] clk_ctl;
    wire [511:0] key_down;
    wire key_valid;
    wire [8:0] last_change;
    wire [3:0] BCD;
    wire [3:0] addend,augend;
    wire [3:0] ssd_in;
    wire [3:0] digit1_sum,digit0_sum;
    wire [3:0] digit3,digit2;
    
  
    
   
    
Frequency_Divider U0(
      .clk_ctl(clk_ctl), 
      .clk_100Hz(clk_100Hz),
      .clk(clk), 
      .rst_n(~rst) 
    );   
    
    
KeyboardDecoder U1(
        .key_down(key_down),
        .last_change(last_change),
        .key_valid(key_valid),
        .PS2_DATA(PS2_DATA),
        .PS2_CLK(PS2_CLK),
        .rst(rst),
        .clk(clk)
        );
        
Hexa_deci U3(
           .last_change(last_change),
           .BCD(BCD)
            );
 

            
Adder  U6(
            .addend(digit3),
            .augend(digit2),
            .digit1_sum(digit1_sum),
            .digit0_sum(digit0_sum),
            .state(state)
            );          
                  
FSM U7(
            .next_state(state), 
            .BCD(BCD), 
            .in(key_valid),
            .digit3(digit3),
            .digit2(digit2),
            .clk(clk), 
            .rst_n(~rst)  
          );                          
                  
scan_ctl U8(
           .scan_ctl(scan_ctl), 
           .ssd_in(ssd_in),
           .in0(digit3), 
           .in1(digit2), 
           .in2(digit1_sum), 
           .in3(digit0_sum),  
           .ssd_ctl_en(clk_ctl) 
            );

Display_for_keyboard U9(
           .ssd_in(ssd_in),
           .ssd_ctl(segs)
    );
                         
endmodule
