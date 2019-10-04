`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/04/22 11:54:44
// Design Name: 
// Module Name: Downcounter_6d
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


module Downcounter_6d(
    output [3:0] digit5,
    output [3:0] digit4,
    output [3:0] digit3,
    output [3:0] digit2,
    output [3:0] digit1,  
    output [3:0] digit0,  
    input clk,  
    input rst_n, 
    input restart,
    input borrow_in, 
    input [3:0] initial_5,
    input [3:0] initial_4,
    input [3:0] initial_3,
    input [3:0] initial_2,
    input [3:0] initial_1,
    input [3:0] initial_0
    );
    
    wire borrow0,borrow1,borrow2,borrow3,borrow4,borrow5; 
    reg zero;
    wire borrow_in_zero;
    
    assign borrow_in_zero = borrow_in & ~zero;   
    
    always@*
        begin
          if(digit5==1'b0&&digit4==1'b0&&digit3==1'b0&&digit2==1'b0&&digit1==1'b0&&digit0==1'b0)
            begin
              zero=1'b1;
            end
          else
            begin
              zero=1'b0;
            end
        end
        
    //hour
    Bcd_Down_Counter U5(
          .value(digit5),  
          .borrow(borrow5),  
          .clk(clk),
          .rst_n(rst_n), 
          .decrease(borrow4),  
          .init_value(initial_5),  
          .start_value(4'd2),
          .limit(4'd0),  
          .restart(restart)
        );
        
        
    Bcd_Down_Counter U4(
          .value(digit4),  
          .borrow(borrow4),  
          .clk(clk),
          .rst_n(rst_n), 
          .decrease(borrow3),  
          .init_value(initial_4),  
          .start_value(4'd9),
          .limit(4'd0),  
          .restart(restart)
        );
    
    
    //mins
    Bcd_Down_Counter U3(
      .value(digit3),  
      .borrow(borrow3),  
      .clk(clk),
      .rst_n(rst_n), 
      .decrease(borrow2),  
      .init_value(initial_3),  
      .start_value(4'd5),
      .limit(4'd0),  
      .restart(restart)
    );
    
    Bcd_Down_Counter U2(
      .value(digit2),  
      .borrow(borrow2),  
      .clk(clk),
      .rst_n(rst_n), 
      .decrease(borrow1),  
      .init_value(initial_2),  
      .start_value(4'd9),
      .limit(4'd0),  
      .restart(restart)
    );
    
    //seconds
    Bcd_Down_Counter U1(
      .value(digit1),  
      .borrow(borrow1),  
      .clk(clk),
      .rst_n(rst_n), 
      .decrease(borrow0),  
      .init_value(initial_1), 
      .start_value(4'd5), 
      .limit(4'd0),  
      .restart(restart)
    );
    
    Bcd_Down_Counter U0(
      .value(digit0),  
      .borrow(borrow0),  
      .clk(clk),
      .rst_n(rst_n), 
      .decrease(borrow_in_zero),  
      .init_value(initial_0),
      .start_value(4'd9),  
      .limit(4'd0),  
      .restart(restart)
    );
endmodule
