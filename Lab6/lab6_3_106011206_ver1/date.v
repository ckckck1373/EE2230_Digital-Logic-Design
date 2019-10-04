`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/04/14 07:53:51
// Design Name: 
// Module Name: date
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


module date(
    output [3:0] digit3_month,
    output [3:0] digit2_month,
    output [3:0] digit1_day,
    output [3:0] digit0_day,
    output carry_day,
    output carry_out,
    input carry_in,
    input leapyear,
    input clk,
    input rst_n
    );
    
    reg [3:0]initial1,initial0;
    reg [3:0]limit2,limit1,limit0;
    
UpCounter_2d Uday(
    .digit1(digit1_day),
    .digit0(digit0_day),
    .carry_out(carry_day),
    .carry_in(carry_in),
    .initial1(4'd0),
    .initial0(initial0),
    .limit1(limit1),
    .limit0(limit0),
    .clk(clk),
    .rst_n(rst_n)
    );
    
UpCounter_2d Umonth(
    .digit1(digit3_month),
    .digit0(digit2_month),
    .carry_out(carry_out),
    .carry_in(carry_day),
    .initial1(4'd0),
    .initial0(initial1),
    .limit1(4'd1),
    .limit0(limit2),
    .clk(clk),
    .rst_n(rst_n)
    );
  
 always @*
   begin
      if(digit2_month == 4'd9)
          initial1 = 4'd0;
      else
          initial1 = 4'd1;
            
      if(digit0_day == 4'd9 && (leapyear != 4'd1 || digit3_month != 4'd0 || digit2_month != 4'd2 || digit1_day != 4'd2))
          initial0 = 4'd0;
      else
          initial0 = 4'd1;
            
      if(digit3_month == 4'd1)
      begin
          limit2 = 4'd2;
      end
      else
      begin
          limit2 = 4'd9;
      end  
      
      
case(digit3_month*4'd10+digit2_month)
      4'd1, 4'd3, 4'd5, 4'd7, 4'd8, 4'd10, 4'd12:
      begin
          limit1 = 4'd3;
          if(digit1_day == 4'd3)
              limit0 = 4'd1;
          else
              limit0 = 4'd9;
      end
      4'd2:
      begin
          limit1 = 4'd2;
          if(digit1_day == 4'd2 && leapyear == 1'd0)
              limit0 = 4'd8;
          else
              limit0 = 4'd9;
      end
      default:
      begin
          limit1 = 4'd3;
          if(digit1_day == 4'd3)
              limit0 = 4'd0;
          else
              limit0 = 4'd9;
      end
endcase
          end      
endmodule
