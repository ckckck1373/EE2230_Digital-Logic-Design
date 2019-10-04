`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/03/15 17:12:28
// Design Name: 
// Module Name: Top
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


module Top(
   input clk,
   input rst_n,
   output reg [3:0]b
    );
    
wire clk_1hz;    
reg rst_n_freq;
reg [3:0]b_tmp;
initial
begin
 rst_n_freq= 1 ;
 #10 rst_n_freq=0;
 #10 rst_n_freq=1;
end

always@*
b_tmp <= b + 1'b1;


always@(posedge clk_1hz or negedge rst_n)
if(~rst_n)
b=4'b0;
else
b<=b_tmp;


    
Frequency_Divider_1Hz U0(
        .clk_out(clk_1hz),//divided clock output
        .clk(clk),// global clock input
        .rst_n(rst_n)//active low reset
        );    
        
        
endmodule
