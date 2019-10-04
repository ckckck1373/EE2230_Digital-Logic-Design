`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/05/13 12:47:54
// Design Name: 
// Module Name: Hexa_deci
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


module Hexa_deci(
    input [8:0] last_change,
    output reg [3:0] BCD
    );
    
    
     always@*
       begin
           case(last_change)
               8'H15 : BCD = 4'd1;
               8'H1D : BCD = 4'd2;
               8'H24 : BCD = 4'd3;
               8'H2D : BCD = 4'd4;
               8'H2C : BCD = 4'd5;
               8'H35 : BCD = 4'd6;
               8'H3C : BCD = 4'd7;
               8'H1C : BCD = 4'd8;
               8'H1B : BCD = 4'd9;
               8'H23 : BCD = 4'd10;
                8'H2B : BCD = 4'd11;
                8'H34 : BCD = 4'd12;
               8'H33 : BCD = 4'd13;
               8'H3B : BCD = 4'd14;
               default
               BCD = 4'd0;
            endcase
        end
endmodule
