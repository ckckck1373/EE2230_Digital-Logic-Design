`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/04/15 21:33:00
// Design Name: 
// Module Name: long reg
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

module load_reg(
    output reg [3:0] out,
    input [3:0] in,
    input load_n,
    input clk,
    input rst_n
    );
    
    reg [3:0] next_out;
    
    always @(posedge clk or negedge rst_n)
    begin
        if(rst_n ==0)
            out <= 4'd0;
        else
            out <= next_out;
    end
    
    always @*
    begin
        if(load_n == 0)
            next_out = in;
        else
            next_out = out;
    end
    
endmodule
