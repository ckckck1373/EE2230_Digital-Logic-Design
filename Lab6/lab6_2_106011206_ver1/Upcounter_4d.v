`timescale 1ns / 1ps

module Upocounter_4d(
  output [3:0] digit3,
  output [3:0] digit2,
  output [3:0] digit1,  
  output [3:0] digit0,  
  output reg carry_month,
  output carry_day_test,
  input clk,  
  input rst_n, 
  input [3:0] initial_3,
  input [3:0] initial_2,
  input [3:0] initial_1,
  input [3:0] initial_0,
  input [3:0] limit1,
  input [3:0] limit0
);

wire carry0,carry2,carry3; 
wire increase_enable;
reg restart_day;
reg restart_month;
reg carry_day;
assign carry_day_test = carry_day;
//assign restart_day = ((digit0 == limit0)&&(digit1 == limit1)&&(carry0==1)==1'b1)? 1:0;
//assign restart_month = ((digit2 == 4'd2)&&(digit3 == 4'd1)&&(carry2==1)==1'b1)? 1:0;
always@*
  begin
      if((digit1== limit1)&&(digit0== limit0 ))
      begin
         restart_day= 1'b1;
         carry_day = 1'b1;
      end
      else 
      begin
         restart_day = 1'b0;
         carry_day = 1'b0;
      end
   end
   
always@*
   begin
      if((digit2 == 4'd2)&&(digit3 == 4'd1 )&&(carry_day == 1'b1 ))
      begin
         restart_month= 1'b1;
         carry_month =  1'b1;
      end
      else
      begin
         restart_month = 1'b0;
         carry_month = 1'b0;
      end
    end
                      
Bcd_Up_Counter Udc0(
  .clk(clk),
  .value(digit0),   
  .carry(carry0),  
  .rst_n(rst_n),  
  .increase(4'd1), 
  .init_value(initial_0),  
  .limit(4'd9),  
  .restart(restart_day)
);


Bcd_Up_Counter Udc1(
  .clk(clk),
  .value(digit1),   
  .carry(carry1),  
  .rst_n(rst_n),  
  .increase(carry0), 
  .init_value(initial_1),  
  .limit(4'd3),
  .restart(restart_day)
);


Bcd_Up_Counter Udc2(
  .clk(clk),
  .value(digit2),   
  .carry(carry2),  
  .rst_n(rst_n),  
  .increase(carry_day), 
  .init_value(initial_2),  
  .limit(4'd9),
  .restart(restart_month)
);


Bcd_Up_Counter Udc3(
  .clk(clk),
  .value(digit3),   
  .carry(carry3),  
  .rst_n(rst_n),  
  .increase(carry2), 
  .init_value(initial_3),  
  .limit(4'd2),
  .restart(restart_month)  
);


endmodule