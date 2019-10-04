`timescale 1ns / 1ps

module Bcd_Up_Counter(
  output reg [3:0]value,  
  output reg carry,  
  input clk,
  input rst_n, 
  input increase,  
  input [3:0]init_value,  
  input [3:0]restart_value,  
  input [3:0]limit,  
  input pb_rst_debounced, //長按功能
  input restart, //24時制使用到
  input mode
);

reg [3:0] value_tmp; 

always @*
  if ((value == limit) && (increase == 1))  
  begin
    value_tmp = 4'd0;
    carry = 1'b1;
  end
  else if (increase) 
  begin
    value_tmp = value + 1'b1;
    carry = 1'b0;
  end
  else 
  begin
    value_tmp = value;
    carry = 1'b0;
  end

always @(posedge clk or negedge rst_n)
  if (~rst_n) value <= init_value;
  else if (pb_rst_debounced) value <= init_value;
  else if (restart==1)  value <= restart_value;
  else value <= value_tmp;

endmodule