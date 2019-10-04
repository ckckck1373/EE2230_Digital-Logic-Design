`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/03/15 18:06:17
// Design Name: 
// Module Name: BCD_UP_COUNTER
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


module Bcd_Up_Counter(
    input clk,
    input rst_n,
    output  [7:0]d,
    output [3:0] ssd_ctl
    );
    reg [3:0] b_tmp;
    wire clk_1hz;
    reg [3:0] b = 4'b0000 ;
    assign ssd_ctl = 4'b1110;
always@*
b_tmp = b + 1'b1;

always@(posedge clk_1hz or negedge rst_n)
begin
if(~rst_n)
b <= 4'b0;
else if(b_tmp == 4'b1010)
b <= 4'b0000;
else
b <= b_tmp;
end

Frequency_Divider_1Hz U0(
        .clk_out(clk_1hz),//divided clock output
        .clk(clk),// global clock input
        .rst_n(rst_n)//active low reset
        ); 
Display U1(
        .b(b),
        .d(d)
        );     
endmodule
