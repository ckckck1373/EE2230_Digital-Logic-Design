`timescale 1ns / 1ps

module fsm_2state(
  output reg mode_enable,  
  input in,
  input clk, 
  input rst_n  
);

reg state; 
reg next_state; 

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

always @(posedge clk or negedge rst_n)
begin
  if (~rst_n)
    state <= 1'b0;
  else
    state <= next_state;
end

endmodule