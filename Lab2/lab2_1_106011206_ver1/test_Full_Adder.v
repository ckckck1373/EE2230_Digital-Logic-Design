`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/02/24 16:08:17
// Design Name: 
// Module Name: test_Full_Adder
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


/*module test_Full_Adder;
    reg X,Y,CIN;
    wire S,COUT;
    Full_adder U1(.s(S),.cout(COUT),.x(X),.y(Y),.cin(CIN));
    initial
    begin
    X=0;Y=0;CIN=0;
#10 X=0;Y=0;CIN=1;
#10 X=0;Y=1;CIN=0;
#10 X=0;Y=1;CIN=1;
#10 X=1;Y=0;CIN=0;
#10 X=1;Y=0;CIN=1;
#10 X=1;Y=1;CIN=0;
#10 X=1;Y=1;CIN=1;
    end
    endmodule*/


module test_Full_Adder;
wire S,COUT;
reg X,Y,CIN;
Full_Adder U0(.s(S),.cout(COUT),.x(X),.y(Y),.cin(CIN));
initial

begin
X=0;Y=0;CIN=0;
#10 X=0;Y=0;CIN=1;
#10 X=0;Y=1;CIN=0;
#10 X=0;Y=1;CIN=1;
#10 X=1;Y=0;CIN=0;
#10 X=1;Y=0;CIN=1;
#10 X=1;Y=1;CIN=0;
#10 X=1;Y=1;CIN=1;
end

endmodule
