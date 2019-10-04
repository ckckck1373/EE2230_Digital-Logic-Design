`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/05/13 14:11:11
// Design Name: 
// Module Name: Adder
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


module Adder(
    input [3:0] addend,
    input [3:0] augend,
    input [2:0] state,
    output reg [3:0] digit1_sum,
    output reg [3:0] digit0_sum
    );
    
    
    always@*
    begin
        if((state==3'b000)&&(addend + augend > 4 'd9))
        begin
            digit1_sum = 4'd1;
            digit0_sum = addend + augend + 4'd6;
        end
        else if((state==3'b000)&&(addend + augend <= 4 'd9))
        begin
            digit1_sum = 4'd0;
            digit0_sum = addend + augend; 
        end
        else 
        begin
            digit1_sum = 4'd0;
            digit0_sum = 4'd0; 
        end
    end
    
endmodule
