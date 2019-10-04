//************************************************************************
// Filename      : stopwatch.v
// Author        : hp
// Function      : Basic up counter module for digital watch
// Last Modified : Date: 2009-03-10
// Revision      : Revision: 1
// Copyright (c), Laboratory for Reliable Computing (LaRC), EE, NTHU
// All rights reserved
//************************************************************************
`include "global.v"
module downcounter_3d(
  digit2,
  digit1,  // 2nd digit of the down counter
  digit0,  // 1st digit of the down counter
  clk,  // global clock
  rst_n,  // low active reset
  en, // enable/disable for the stopwatch
  pb_rst_debounced,
  light,
  mode_enable,
  initial_0,
  initial_1,
  initial_2
);

output [`BCD_BIT_WIDTH-1:0] digit2; 
output [`BCD_BIT_WIDTH-1:0] digit1; 
output [`BCD_BIT_WIDTH-1:0] digit0;


input clk;  
input rst_n;  
input en; 
input pb_rst_debounced;
input mode_enable;
input [3:0]initial_0;
input [3:0]initial_1;
input [3:0]initial_2;

output reg [14:0]light;
wire br0,br1; // borrow indicator 
wire decrease_enable;

assign decrease_enable = en && (~((digit0==`BCD_ZERO)&&(digit1==`BCD_ZERO)&&((digit2==`BCD_ZERO))));
 


downcounter Udc0(
  .value(digit0),   
  .borrow(br0),  
  .clk(clk), 
  .rst_n(rst_n),  
  .decrease(decrease_enable), 
  .init_value(initial_0),  
  .limit(4'd9),  
  .pb_rst_debounced(pb_rst_debounced)
);

downcounter Udc1(
  .value(digit1),  
  .borrow(br1),  
  .clk(clk), 
  .rst_n(rst_n),  
  .decrease(br0),  
  .init_value(initial_1), 
  .limit(4'd5),  
  .pb_rst_debounced(pb_rst_debounced)
);

downcounter Udc2(
  .value(digit2),  
  .borrow(1'b0),  
  .clk(clk), 
  .rst_n(rst_n),  
  .decrease(br1),  
  .init_value(initial_2),  
  .limit(4'd9), 
  .pb_rst_debounced(pb_rst_debounced)
);

always@*
begin
if(~rst_n)
light=15'b0;
else if (digit0==0&&digit1==0&&digit2==00)
light=15'b111111111111111;
else
light=15'b0;
end


endmodule
