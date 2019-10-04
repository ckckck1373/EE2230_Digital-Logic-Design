`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/05/13 21:54:28
// Design Name: 
// Module Name: Multi
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


module Multi(
    input clk,
    input rst_n,
    input [3:0] digit3,
    input [3:0] digit2,
    input [3:0] digit1,
    input [3:0] digit0,
    output reg [3:0] digit3_multi,
    output reg [3:0] digit2_multi,
    output reg [3:0] digit1_multi,
    output reg [3:0] digit0_multi
    );
    
     wire [10:0] multi_tmp1,multi_tmp0;
     wire [20:0] multi_total;
     wire [3:0] next_digit3_multi,next_digit2_multi,next_digit1_multi,next_digit0_multi;
    
      assign multi_tmp1 = digit3 * (4'd10) + digit2;
      assign multi_tmp0 = digit1 * (4'd10) + digit0;
      assign multi_total = multi_tmp1 * multi_tmp0; 
      
      assign next_digit3_multi = multi_total/1000;
      assign next_digit2_multi = (multi_total%1000)/100;
      assign next_digit1_multi = (multi_total%100)/10;
      assign next_digit0_multi = (multi_total%10)/1;
      
      
always @(posedge clk or negedge rst_n)
      begin
        if (~rst_n)
        begin
          digit3_multi <= 4'b0000;
          digit2_multi <= 4'b0000;
          digit1_multi <= 4'b0000;
          digit0_multi <= 4'b0000;
          end
        else
        begin
          digit3_multi <= next_digit3_multi;
          digit2_multi <= next_digit2_multi;
          digit1_multi <= next_digit1_multi;
          digit0_multi <= next_digit0_multi;
        end
      end     
endmodule
