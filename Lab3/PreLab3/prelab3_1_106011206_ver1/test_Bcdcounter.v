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

module test_Bcdcounter();
reg clk;
reg rst_n;
wire [`BCD_BIT_WIDTH-1:0]q;

Bcdcounter U0(
    .q(q), //output
    .clk(clk),//global clock
    .rst_n(rst_n)//active low reset
    );

initial 
begin
clk=1'b0;
forever #5 clk=~clk;
end
initial
begin
rst_n=0;
#20;
rst_n=1;
end
endmodule