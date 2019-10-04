`timescale 1ns / 1ps

module Upocounter_4d(
  output [3:0] digit3,
  output [3:0] digit2,
  output [3:0] digit1,  
  output [3:0] digit0,  
  output reg am_pm,
  input clk,  
  input rst_n, 
  input carry_in, 
  input [3:0] initial_3,
  input [3:0] initial_2,
  input [3:0] initial_1,
  input [3:0] initial_0,
  input [3:0] limit3_individual,
  input [3:0] limit2_individual,
  input [3:0] limit1_individual,
  input [3:0] limit0_individual,
  input [3:0] limit3_whole,
  input [3:0] limit2_whole,
  input [3:0] limit1_whole,
  input [3:0] limit0_whole
);

wire carry0,carry1,carry2,carry3; 
wire increase_enable;
reg restart;

always@*
    begin
    if(digit3==limit3_whole && digit2==limit2_whole&&digit1==limit1_whole && digit0==limit0_whole)
      begin
        restart= 1'b1;
      end
    else
      begin
        restart = 1'b0;
      end
    end


always@(posedge clk or negedge rst_n)
    if(~rst_n)
        am_pm <= 1'b0;
    else
        am_pm <= restart;


Bcd_Up_Counter Udc0(
  .clk(clk),
  .value(digit0),   
  .carry(carry0),  
  .rst_n(rst_n),  
  .increase(carry_in), 
  .init_value(initial_0),  
  .limit(4'd9),  
  .restart(restart)
);


Bcd_Up_Counter Udc1(
  .clk(clk),
  .value(digit1),   
  .carry(carry1),  
  .rst_n(rst_n),  
  .increase(carry0), 
  .init_value(initial_1),  
  .limit(4'd5),
  .restart(restart)
);


Bcd_Up_Counter Udc2(
  .clk(clk),
  .value(digit2),   
  .carry(carry2),  
  .rst_n(rst_n),  
  .increase(carry1), 
  .init_value(initial_2),  
  .limit(4'd9),
  .restart(restart)
);


Bcd_Up_Counter Udc3(
  .clk(clk),
  .value(digit3),   
  .carry(carry3),  
  .rst_n(rst_n),  
  .increase(carry2), 
  .init_value(initial_3),  
  .limit(4'd2),
  .restart(restart)  
);


endmodule