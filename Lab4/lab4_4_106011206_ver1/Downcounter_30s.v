`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/03/16 14:40:15
// Design Name: 
// Module Name: Downcounter_30s
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
`define BCD_THREE 4'b0011
`define BCD_ZERO 4'b0000

module Downcounter_30s(
    output [7:0]d,
    output [3:0]ssd_ctl,
    input clk,
    input rst_n
    );
    
    wire clk_1hz;
    wire br0;
    wire br1=1'b0;
    wire [3:0]digit0;
    wire [3:0]digit1;
    wire [3:0]i;
    wire [1:0] clk_ctl;
    reg decrease_enable;
    reg end_00;
    
Frequency_Divider_1Hz U0(
        .clk_out(clk_1hz),//divided clock output
        .clk_ctl(clk_ctl),
        .clk(clk),// global clock input
        .rst_n(rst_n)//active low reset
        );    
    
    
Downcounter U1(
        .value(digit0),
        .borrow(br0),
        .clk(clk_1hz),
        .rst_n(rst_n),
        .decrease(decrease_enable),
        .limit(`BCD_ZERO)
        );
        
Downcounter U2(
         .value(digit1),
         .borrow(br1),
         .clk(clk_1hz),
         .rst_n(rst_n),
         .decrease(br0),
         .limit(`BCD_THREE)
          );
          
scan_ctl U3(
          .ssd(i),
          .ssd_ctl(ssd_ctl),
          .in0(digit0),
          .in1(digit1),
          .clk_ctl(clk_ctl)
           );        
              
Display U4(
         .b(i),
         .d(d)
          );
          
always@*
begin
if(digit0==4'b0&digit1==4'b0)
begin
decrease_enable=1'b0;
end
else
begin
decrease_enable= 1'b1;
end
end


 
                

endmodule
