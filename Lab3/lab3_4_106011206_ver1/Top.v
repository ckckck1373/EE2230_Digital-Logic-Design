`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/03/14 21:12:25
// Design Name: 
// Module Name: Top
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


module Top(
    input clk,
    input rst_n,
    output [3:0] ssd_ctl,
    output [7:0]display
    );
    
   wire clk_1hz;
   wire [1:0]clk_ctl;
   wire [2:0]q0,q1,q2,q3,q4,q5;
   wire [2:0]i;
   
   reg rst_n_freq;
   initial
       begin
           rst_n_freq = 1;
           #10 rst_n_freq = 0;
           #10 rst_n_freq = 1;
     end
    freqdiv U0(
      .clk_out(clk_1hz),  // divided clock output
      .clk_ctl(clk_ctl),
      .clk(clk),  // global clock input
      .rst_n(rst_n)  // active low reset
      );
   
    Shifter U1(
       .q0(q0),// output
       .q1(q1),
       .q2(q2),
       .q3(q3),
       .clk(clk_1hz),//global clock
       .rst_n(rst_n)//active low reset
       );
       
    scan_ctl U2(
          .ssd(i),
          .ssd_ctl(ssd_ctl),
          .in0(q0),
          .in1(q1),
          .in2(q2),
          .in3(q3),
          .clk_ctl(clk_ctl)
           );
        
    display U3(
       .segs(display),
       .i(i)
        );  
   
endmodule
