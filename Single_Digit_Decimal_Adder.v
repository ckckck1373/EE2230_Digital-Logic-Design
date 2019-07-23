`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/02/24 11:23:24
// Design Name: 
// Module Name: Single_Digit_Decimal_Adder
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


module Single_Digit_Decimal_Adder(a,b,cin,s,cout);

    input [3:0]a,b;
    input cin; 
    output [3:0]s;
    output cout;
    
    reg [4:0] temp;
    reg [3:0] s;
    reg cout;
 
    always @(a,b,cin)
begin
     temp = a+b+cin;
     if(temp>9) 
        begin
            temp=temp+6;
            cout=1;
            s=temp[3:0];
        end    
     else
        begin
           cout=0;
           s=temp[3:0];
        end
end

endmodule
       
    

        

