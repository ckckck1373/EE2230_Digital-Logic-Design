`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/03/08 08:22:23
// Design Name: 
// Module Name: Shifter
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

`define BIT_WIDTH 6

module Shifter(
    q0,// output
    q1,
    q2,
    q3,
    q4,
    q5,
    clk,//global clock
    rst_n//active low reset
    );
output [2:0] q0;// output
output [2:0] q1;// output
output [2:0] q2;// output
output [2:0] q3;// output
output [2:0] q4;// output
output [2:0] q5;// output
input clk;//global clock
input rst_n;//active low reset  
reg[2:0]q0; //output
reg[2:0]q1;
reg[2:0]q2;
reg[2:0]q3;
reg[2:0]q4;
reg[2:0]q5;
  //Sequential logics: Flip flops
  always @(posedge clk or negedge rst_n)
  if(~rst_n)
  begin
  q0<=3'd0;
  q1<=3'd1;
  q2<=3'd2;              
  q3<=3'd3;   
  q4<=3'd4;
  q5<=3'd4;  
  end
  else
  begin
  q0<=q1;
  q1<=q2;
  q2<=q3;
  q3<=q4;
  q4<=q5;
  q5<=q0;
 
  end
endmodule

