`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/02/24 14:52:19
// Design Name: 
// Module Name: Decoder_3to8
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


module Decoder_3to8(d7,d6,d5,d4,d3,d2,d1,d0,in2,in1,in0,en);
    input in2,in1,in0,en;
    output d7,d6,d5,d4,d3,d2,d1,d0;
    
    assign {d7,d6,d5,d4,d3,d2,d1,d0} = ( {en,in2,in1,in0} == 4'b 1000) ? 8'b0000_0001:
                                       ( {en,in2,in1,in0} == 4'b 1001) ? 8'b0000_0010:  
                                       ( {en,in2,in1,in0} == 4'b 1010) ? 8'b0000_0100:
                                       ( {en,in2,in1,in0} == 4'b 1011) ? 8'b0000_1000:
                                       ( {en,in2,in1,in0} == 4'b 1100) ? 8'b0001_0000:
                                       ( {en,in2,in1,in0} == 4'b 1101) ? 8'b0010_0000:
                                       ( {en,in2,in1,in0} == 4'b 1110) ? 8'b0100_0000:
                                       ( {en,in2,in1,in0} == 4'b 1111) ? 8'b1000_0000:
                                                                         8'b0000_0000;
    
endmodule
