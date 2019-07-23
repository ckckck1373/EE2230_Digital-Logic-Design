`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/02/24 16:03:59
// Design Name: 
// Module Name: Full_Adder
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





module Full_Adder(s,cout,x,y,cin);
    input x,y,cin;
    output s,cout;
    
    assign s=x^y^cin;
    assign cout= x&y|y&cin|cin&x;
    
    
endmodule

