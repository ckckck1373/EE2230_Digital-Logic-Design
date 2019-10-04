`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/04/13 22:03:47
// Design Name: 
// Module Name: UpCounter_2d
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


module UpCounter_2d(
  output [3:0] digit1,  
  output [3:0] digit0,  
  output carry_out,
  input carry_in,
  input clk,  
  input rst_n, 
  input en, 
  input pb_rst_debounced,
  input mode_enable,
  input [3:0]limit1,
  input [3:0]limit0,
  input [3:0] initial1,
  input [3:0] initial0
);

wire carry0,carry1; 
//wire increase_enable;

//assign increase_enable =  ~((digit0==4'd9)&&(digit1==4'd5));

/*always@(posedge clk or negedge rst_n)
   if(~rst_n)
   begin
       digit1 <= 4'b0;
       digit0 <= 4'b0;
   end
   else if(digit1 == 4'd5 && digit0 == 4'd9)
   begin
       digit1 <= 4'b0;
       digit0 <= 4'b0;
   end
   else 
       digit1 <= */
       
Bcd_Up_Counter Udc0(
  .clk(clk),
  .value(digit0),   
  .carry(carry0),  
  .rst_n(rst_n),  
  .increase(carry_in), 
  .init_value(initial0),  
  .limit(limit0)
);


Bcd_Up_Counter Udc1(
  .clk(clk),
  .value(digit1),   
  .carry(carry_out),  
  .rst_n(rst_n),  
  .increase(carry0), 
  .init_value(initial1),  
  .limit(limit1)
);

endmodule
