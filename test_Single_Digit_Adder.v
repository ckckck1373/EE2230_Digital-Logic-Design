`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/02/24 16:59:23
// Design Name: 
// Module Name: test_Single_Digit_Adder
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


module test_Single_Digit_Decimal_Adder;
reg [3:0]A;
reg [3:0]B;
reg CIN;

wire [3:0]S;
wire COUT;
Single_Digit_Decimal_Adder U0(.a(A),.b(B),.cin(CIN),.s(S),.cout(COUT));

initial
begin

A=4'd1;B=4'd3;CIN=0; 
#10 A=4'd7;B=4'd8;CIN=0; 
#10 A=4'd4;B=4'd8;CIN=1; 
#10 A=4'd2;B=4'd8;CIN=0; 
#10 A=4'd5;B=4'd4;CIN=1; 
#10 A=4'd1;B=4'd1;CIN=1; 
#10 A=4'd3;B=4'd5;CIN=1; 
#10 A=4'd6;B=4'd2;CIN=1; 
#10 A=4'd4;B=4'd6;CIN=0; 
#10 A=4'd2;B=4'd1;CIN=0; 
#10 A=4'd9;B=4'd9;CIN=0; 
#10 A=4'd0;B=4'd0;CIN=0; 
#10 A=4'd1;B=4'd2;CIN=0; 
#10 A=4'd8;B=4'd3;CIN=0; 
#10 A=4'd4;B=4'd1;CIN=0; 

end
endmodule
