`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/03/04 20:24:16
// Design Name: 
// Module Name: test_Bcdcounter
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
`define BCD_BIT_WIDTH 4
`define BCE_ZERO 4'd0
`define BCD_ONE 4'd1
`define BCD_NINE 4'd9

module Bcdcounter(
    q, //output
    clk,//global clock
    rst_n//active low reset
    );

output [`BCD_BIT_WIDTH-1:0]q; //output
input clk;//global clock
input rst_n; //active low reset

reg [`BCD_BIT_WIDTH-1:0]q; //output (in always block)
reg [`BCD_BIT_WIDTH-1:0]q_tmp; //input to dff (in always block)

//Combinational logics
always @*
q_tmp=q+`BCD_ONE;

//Sequential logics:Flip flops
always @(posedge clk or negedge rst_n)
    if (~rst_n) q<=`BCD_BIT_WIDTH'd0;
    else q<=q_tmp;
    
endmodule