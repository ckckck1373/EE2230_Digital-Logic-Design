`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/03/22 23:41:39
// Design Name: 
// Module Name: test_stopwatch
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

module test_stopwatch;

 reg clk;
 reg rst_n;
 reg in;
 reg pb_rst;
 wire [14:0] light;
 wire count_enable;
 wire [3:0] dig1;
 wire [3:0] dig0;

stopwatch U0(
  .clk_d(clk), // clock
  .rst_n(rst_n), // low active reset
  .in(in), // input control for FSM
  .pb_rst(pb_rst),
  .light(light),
  .count_enable(count_enable),
  .dig1(dig1),
  .dig0(dig0)
 );

initial
begin
    clk =0;
    forever #5 clk = ~clk;
end

initial
begin
    pb_rst=0;in=0;rst_n=0;
    #5 rst_n = 1;
    #5 in = 1;
    #5 in = 0;
    #25 pb_rst = 1;
    #25 pb_rst = 0;
    #5 in = 1;
    #5 in = 0;
    #5 in = 1;
    #5 in = 0;
end
endmodule