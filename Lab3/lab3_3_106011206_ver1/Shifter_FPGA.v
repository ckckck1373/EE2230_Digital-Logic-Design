`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/03/10 14:52:44
// Design Name: 
// Module Name: Shifter_FPGA
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


`define BIT_WIDTH 8

module Shifter_FPGA( 
    q,// output
    clk,//global clock
    rst_n//active low reset
    );
    output [`BIT_WIDTH-1:0] q;// output
    input clk;//global clock
    input rst_n;//active low reset  
    wire clk_d; //divided clock
    wire [`BIT_WIDTH-1:0]q; // LED output
    
    //Insert frequency divider (Frequency_Divider_1Hz.v)
Frequency_Divider_1Hz U0(
        .clk_out(clk_d),
        .clk(clk),
        .rst_n(rst_n)
        );
    //Insert shifter (Shifter.v)
Shifter U1(
        .q(q), // output
        .clk(clk_d),//global clock
        .rst_n(rst_n)//active low reset
        );


endmodule
