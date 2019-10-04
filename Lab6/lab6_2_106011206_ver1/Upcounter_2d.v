`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/04/01 21:14:50
// Design Name: 
// Module Name: Upcounter_2d
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


module Upocounter_2d(
  output [3:0] digit1,  
  output [3:0] digit0,  
  output carry_out,
  input carry_in,
  input clk,  
  input rst_n,  
  input pb_rst_debounced,
  input [3:0] initial_1,
  input [3:0] initial_0
);

wire carry0; 
wire increase_enable;

assign increase_enable =  ~((digit0==4'd9)&&(digit1==4'd9));
 
Bcd_Up_Counter Udc0(
  .clk(clk),
  .value(digit0),   
  .carry(carry0),  
  .rst_n(rst_n),  
  .increase(carry_in), 
  .init_value(4'd0),  
  .limit(4'd9),  
  .pb_rst_debounced(pb_rst_debounced)
);


Bcd_Up_Counter Udc1(
  .clk(clk),
  .value(digit1),   
  .carry(carry_year),  
  .rst_n(rst_n),  
  .increase(carry0), 
  .init_value(4'd0),  
  .limit(4'd9),  
  .pb_rst_debounced(pb_rst_debounced)
);

endmodule
