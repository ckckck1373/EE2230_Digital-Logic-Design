`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/05/13 21:54:47
// Design Name: 
// Module Name: Sub
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


module Sub(
    input clk,
    input rst_n,
    input [3:0] digit3,
    input [3:0] digit2,
    input [3:0] digit1,
    input [3:0] digit0,
    output reg [3:0] digit3_sub,
    output reg [3:0] digit2_sub,
    output reg [3:0] digit1_sub,
    output reg [3:0] digit0_sub

    );
    
      wire [10:0] sub_tmp1,sub_tmp0;
      reg [10:0] sub_total;
      wire [3:0] next_digit3_sub,next_digit2_sub,next_digit1_sub,next_digit0_sub;
      
      
      assign sub_tmp1 = digit3 * (4'd10) + digit2;
      assign sub_tmp0 = digit1 * (4'd10) + digit0;
      
      always@*
      begin
      if(sub_tmp1>=sub_tmp0)
          sub_total = sub_tmp1 - sub_tmp0;
      else 
          sub_total = sub_tmp0 - sub_tmp1;
      end 
       
      assign next_digit3_sub = sub_total/1000;
      assign next_digit2_sub = (sub_tmp1 < sub_tmp0)? 4'd15:4'd0;
      assign next_digit1_sub = (sub_total%100)/10;
      assign next_digit0_sub = (sub_total%10)/1;
      
      
      
always @(posedge clk or negedge rst_n)
      begin
      if (~rst_n)
      begin
          digit3_sub <= 4'b0000;
          digit2_sub <= 4'b0000;
          digit1_sub <= 4'b0000;
          digit0_sub <= 4'b0000;
      end
      else
      begin
          digit3_sub <= next_digit3_sub;
          digit2_sub <= next_digit2_sub;
          digit1_sub <= next_digit1_sub;
          digit0_sub <= next_digit0_sub;
       end
   end           
endmodule
