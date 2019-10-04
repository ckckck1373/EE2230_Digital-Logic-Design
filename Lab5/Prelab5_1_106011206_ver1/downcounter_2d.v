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
module downcounter_2d(
  digit1,  // 2nd digit of the down counter
  digit0,  // 1st digit of the down counter
  clk,  // global clock
  rst_n,  // low active reset
  en, // enable/disable for the stopwatch
  pb_rst,
  light
);

output [`BCD_BIT_WIDTH-1:0] digit1; // 2nd digit of the down counter
output [`BCD_BIT_WIDTH-1:0] digit0; // 1st digit of the down counter

input clk;  // global clock
input rst_n;  // low active reset
input en; // enable/disable for the stopwatch
input pb_rst;
output reg [14:0]light;
wire br0,br1; // borrow indicator 
wire decrease_enable;

assign decrease_enable = en && (~((digit0==`BCD_ZERO)&&(digit1==`BCD_ZERO)));
  
// 30 sec down counter
downcounter Udc0(
  .value(digit0),  // counter value 
  .borrow(br0),  // borrow indicator for counter to next stage
  .clk(clk), // global clock signal
  .rst_n(rst_n),  // low active reset
  .decrease(decrease_enable),  // decrease input from previous stage of counter
  .init_value(`BCD_ZERO),  // initial value for the counter
  .limit(`BCD_NINE),  // limit for the counter
  .pb_rst(pb_rst)
);

downcounter Udc1(
  .value(digit1),  // counter value 
  .borrow(br1),  // borrow indicator for counter to next stage
  .clk(clk), // global clock signal
  .rst_n(rst_n),  // low active reset
  .decrease(br0),  // decrease input from previous stage of counter
  .init_value(`BCD_THREE),  // initial value for the counter
  .limit(`BCD_FIVE),  // limit for the counter
  .pb_rst(pb_rst)
);
always@*
begin
if(~rst_n)
light=15'b0;
else if (digit0==0&&digit1==0)
light=15'b111111111111111;
else
light=15'b0;
end


endmodule
