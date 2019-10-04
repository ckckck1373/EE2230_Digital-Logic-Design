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
  input clk,  
  input rst_n, 
  input carry_in, 
  input pb_rst_debounced,
  input mode_enable,
  input [3:0]initial_1,
  input [3:0]initial_0,
  input [3:0] limit1_individual,
  input [3:0] limit0_individual,
  input [3:0] limit1_whole,
  input [3:0] limit0_whole
);

wire carry0,carry1; 
reg restart;

always@*
    begin
    if(digit1==limit1_whole && digit0==limit0_whole)
      begin
        restart= 1'b1;
      end
    else
      begin
        restart = 1'b0;
      end
    end
    
Bcd_Up_Counter Udc0(
  .clk(clk),
  .value(digit0),   
  .carry(carry0),  
  .rst_n(rst_n),  
  .increase(carry_in), 
  .init_value(initial_0),  
  .limit(limit0_individual),  
  .restart(restart),
  .pb_rst_debounced(pb_rst_debounced)
);


Bcd_Up_Counter Udc1(
  .clk(clk),
  .value(digit1),   
  .carry(carry_out),  
  .rst_n(rst_n),  
  .increase(carry0), 
  .init_value(initial_1),  
  .limit(limit1_individual),
  .restart(restart),
  .pb_rst_debounced(pb_rst_debounced)
);

endmodule
