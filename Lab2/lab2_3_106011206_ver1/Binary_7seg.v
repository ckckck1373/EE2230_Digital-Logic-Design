`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/03/01 10:07:49
// Design Name: 
// Module Name: Binary_7seg
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


module Binary_7seg(i,D_ssd,d,a);
input [3:0] i;
output [7:0] D_ssd;
output [3:0] d;
output [3:0] a;

display U0(.bin(i),.segs(D_ssd));

assign d=4'b0000;
assign a=i;
endmodule
