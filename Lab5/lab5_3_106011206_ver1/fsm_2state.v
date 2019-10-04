`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/03/24 16:38:55
// Design Name: 
// Module Name: fsm_2state
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


module fsm_2state(
  mode_enable,  // if counter is enabled 
  in, //input control
  clk, // global clock signal
  rst_n  // low active reset
);

// outputs
output reg mode_enable;  // if counter is enabled 

// inputs
input clk; // global clock signal
input rst_n; // low active reset
input in; //input control

reg state; // state of FSM
reg next_state; // next state of FSM

// ***************************
// FSM
// ***************************
// FSM state decision
always @*
  case (state)
    1'b0:
      if (in)
      begin
        next_state = 1'b1;
        mode_enable = 1'b1;
      end
      else
      begin
        next_state = 1'b0;
        mode_enable = 1'b0;
      end
    1'b1:
      if (in)
      begin
        next_state = 1'b0;
        mode_enable = 1'b0;
      end
      else
      begin
        next_state = 1'b1;
        mode_enable = 1'b1;
      end
    default:
      begin
        next_state = 1'b0;	 
        mode_enable = 1'b0;
    end
  endcase

// FSM state transition
always @(posedge clk or negedge rst_n)
begin
  if (~rst_n)
    state <= 1'b0;
  else
    state <= next_state;
end

endmodule
