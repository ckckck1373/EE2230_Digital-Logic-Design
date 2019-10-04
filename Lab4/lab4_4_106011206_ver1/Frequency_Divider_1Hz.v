`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/03/10 11:42:27
// Design Name: 
// Module Name: Frequency_Divider_1Hz
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


`define FREQ_DIV_BIT 27
module Frequency_Divider_1Hz(
    clk_out,//divided clock output
    clk_ctl,
    clk,// global clock input
    rst_n//active low reset
    );
    output  clk_out;//divided output
    output [1:0] clk_ctl;
    input clk;//global clock input
    input rst_n;// active low reset
    
    reg clk_out;//clk output(in always block)
    reg [`FREQ_DIV_BIT-2:0]cnt;
    reg[`FREQ_DIV_BIT-1:0]cnt_tmp;//input to dff(in always block)
    
    assign clk_ctl = {cnt_tmp[16],cnt_tmp[15]};
    //Combinational logics increment, neglecting overflow
    always @*
    begin
        cnt_tmp= {clk_out,cnt}+ 1'b1;
    end
   always @(posedge clk or negedge rst_n)
   begin
        if(~rst_n){clk_out,cnt}<=`FREQ_DIV_BIT'd0;
               else if(cnt == 26'd50000000) 
                begin
                cnt <= 26'd0;
                clk_out <= ~clk_out;
                end
                    else
                    cnt <= cnt_tmp;
   end                               
   

endmodule
