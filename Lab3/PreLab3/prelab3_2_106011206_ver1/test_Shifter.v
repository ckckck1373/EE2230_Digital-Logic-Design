`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/03/08 08:32:54
// Design Name: 
// Module Name: test_Shifter
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

`define BIT_WIDTH 8
module test_Shifter();
reg clk,rst_n;
wire [`BIT_WIDTH-1:0] q;
Shifter U0(
    .q(q),// output
    .clk(clk),//global clock
    .rst_n(rst_n)//active low reset
    );
initial
begin
clk=0;
forever #5 clk=~clk;
end
initial
begin
rst_n=0;
#20 rst_n=1;
end
endmodule
