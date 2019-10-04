`timescale 1ns / 1ps
`define BCD_ZERO 4'b0000
`define ENABLED 1'b1
`define DISABLED 1'b0
`define INCREMENT 1'b1

module Downcounter(
    output reg [3:0]value,
    output reg borrow,
    input clk,
    input rst_n,
    input decrease,
    input [3:0]limit
    );
    
    reg [3:0]value_tmp;
    
always @*
    if(value == `BCD_ZERO && decrease)
    begin
        value_tmp = 4'd9;
        borrow = `ENABLED;
    end
    else if(value!=`BCD_ZERO && decrease)
    begin
        value_tmp = value - `INCREMENT;
        borrow = `DISABLED;
    end
    else
    begin
        value_tmp = value;
        borrow = `DISABLED;
    end
    
always @(posedge clk or negedge rst_n)
    if(~rst_n) value <= limit;
    else value <= value_tmp;
    
endmodule