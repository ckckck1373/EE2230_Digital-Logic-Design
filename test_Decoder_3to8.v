`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/02/24 15:09:27
// Design Name: 
// Module Name: test_Decoder_3to8
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


module test_Decoder_3to8;
    reg IN2,IN1,IN0;
    reg EN;
    wire D7,D6,D5,D4,D3,D2,D1,D0;
    Decoder_3to8 U0(.d7(D7),.d6(D6),.d5(D5),.d4(D4),.d3(D3),.d2(D2),.d1(D1),.d0(D0),.in2(IN2),.in1(IN1),.in0(IN0),.en(EN));
    
    initial
    begin
   
      EN=1;IN2=0;IN1=0;IN0=0;
#10   EN=1;IN2=0;IN1=0;IN0=1;
#10   EN=1;IN2=0;IN1=1;IN0=0;
#10   EN=1;IN2=0;IN1=1;IN0=1;
#10   EN=1;IN2=1;IN1=0;IN0=0;
#10   EN=1;IN2=1;IN1=0;IN0=1;
#10   EN=1;IN2=1;IN1=1;IN0=0;
#10   EN=1;IN2=1;IN1=1;IN0=1;
#10   EN=0;IN2=0;IN1=0;IN0=0;
#10   EN=0;IN2=0;IN1=0;IN0=1;
#10   EN=0;IN2=0;IN1=1;IN0=0;
#10   EN=0;IN2=0;IN1=1;IN0=1;
#10   EN=0;IN2=1;IN1=0;IN0=0;
#10   EN=0;IN2=1;IN1=0;IN0=1;
#10   EN=0;IN2=1;IN1=1;IN0=0;
#10   EN=0;IN2=1;IN1=1;IN0=1;
    end
    endmodule
