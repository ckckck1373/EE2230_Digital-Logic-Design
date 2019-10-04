`timescale 1ns / 1ps

module Upocounter_4d(
  output [3:0] digit3,
  output [3:0] digit2,
  output [3:0] digit1,  
  output [3:0] digit0,  
  output reg carry_out,
  input carry_in,
  input clk,  
  input rst_n, 
  input [3:0] initial_3,
  input [3:0] initial_2,
  input [3:0] initial_1,
  input [3:0] initial_0,
  input [3:0] restart_value3,
  input [3:0] restart_value2,
  input [3:0] restart_value1,
  input [3:0] restart_value0,
  input [3:0] limit3,
  input [3:0] limit2,
  input [3:0] limit1,
  input [3:0] limit0
);

wire carry0,carry2,carry3; 
wire increase_enable;
reg restart;




always@*
      if((digit3== limit3)&&(digit2== limit2 )&&(digit1 == limit1 )&&(digit0 == limit0 )&&(carry0==1'b1))
      begin
         restart= 1'b1;
         carry_out =1'b1;
      end
      else
      begin
         restart = 1'b0;
         carry_out =1'b0;
      end
                
Bcd_Up_Counter Udc0(
  .clk(clk),
  .value(digit0),   
  .carry(carry0),  
  .rst_n(rst_n),  
  .increase(carry_in), 
  .init_value(initial_0),  
  .restart_value(restart_value0),
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
  .restart_value(restart_value1), 
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
  .restart_value(restart_value2),
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
  .restart_value(restart_value3), 
  .limit(4'd2),
  .restart(restart)  
);


endmodule