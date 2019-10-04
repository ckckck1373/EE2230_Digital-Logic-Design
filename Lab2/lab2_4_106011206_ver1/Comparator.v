`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/03/01 13:19:17
// Design Name: 
// Module Name: Comparator
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


module Comparator(A,B,X,M,N);
    input [3:0]A;
    input [3:0]B;
    output [3:0]M;
    output [3:0]N;       
    output X;
    reg X;
    assign M=A;
    assign N=B;
    
    always @*
    if(A>B)
    X=1;
    else
    X=0;
endmodule
