`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/05/13 21:55:08
// Design Name: 
// Module Name: Sum
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


module Sum(
    input clk,
    input rst_n,
    input [3:0] digit3,
    input [3:0] digit2,
    input [3:0] digit1,
    input [3:0] digit0,
    output reg [3:0] digit3_sum,
    output reg [3:0] digit2_sum,
    output reg [3:0] digit1_sum,
    output reg [3:0] digit0_sum
    );
    
    wire [10:0] sum_tmp1,sum_tmp0;
    wire [10:0] sum_total;
    wire [3:0] next_digit3_sum,next_digit2_sum,next_digit1_sum,next_digit0_sum;

     assign sum_tmp1 = digit3 * (4'd10) + digit2;
     assign sum_tmp0 = digit1 * (4'd10) + digit0;
     assign sum_total = sum_tmp1 + sum_tmp0; 
     
     assign next_digit3_sum = sum_total/1000;
     assign next_digit2_sum = (sum_total%1000)/100;
     assign next_digit1_sum = (sum_total%100)/10;
     assign next_digit0_sum = (sum_total%10)/1;


always @(posedge clk or negedge rst_n)
begin
  if (~rst_n)
  begin
    digit3_sum <= 4'b0000;
    digit2_sum <= 4'b0000;
    digit1_sum <= 4'b0000;
    digit0_sum <= 4'b0000;
    end
  else
  begin
    digit3_sum <= next_digit3_sum;
    digit2_sum <= next_digit2_sum;
    digit1_sum <= next_digit1_sum;
    digit0_sum <= next_digit0_sum;
  end
end
    
    
endmodule
