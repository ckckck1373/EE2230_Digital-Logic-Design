`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/04/22 14:25:24
// Design Name: 
// Module Name: fsm_4state
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


module fsm_4state(
  output reg [1:0]mode_enable,  
  input in,
  input clk, 
  input rst_n  
);

reg [1:0]state; 
reg [1:0]next_state; 

always @*
  case (state)
    2'b00:
      if (in)
      begin
        next_state = 2'b01;
        mode_enable = 2'b01;
      end
      else
      begin
        next_state = 2'b00;
        mode_enable = 2'b00;
      end
    2'b01:
      if (in)
      begin
        next_state = 2'b10;
        mode_enable = 2'b10;
      end
      else
      begin
        next_state = 2'b01;
        mode_enable = 2'b01;
      end
    2'b10:
      if (in)
      begin
         next_state = 2'b00;
         mode_enable = 2'b00;
      end
      else
      begin
         next_state = 2'b10;
         mode_enable = 2'b10;
       end
    default:
      begin
          next_state = 2'b00;
          mode_enable = 2'b00;
    end
  endcase

always @(posedge clk or negedge rst_n)
begin
  if (~rst_n)
    state <= 2'b00;
  else
    state <= next_state;
end

endmodule
