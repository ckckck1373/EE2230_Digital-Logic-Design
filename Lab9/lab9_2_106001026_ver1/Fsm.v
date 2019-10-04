`timescale 1ns / 1ps

module FSM(
  output reg [2:0]next_state,  
  output reg [3:0]digit3,
  output reg [3:0]digit2,
  input [3:0] BCD,
  input in,
  input clk, 
  input rst_n  
);

reg [2:0]state; 

always @*
  case (state)
    3'b000:
      if (in)
      begin
        next_state = 3'b001;   
        digit3 = BCD;
      end
      else
      begin
        next_state = 3'b000;
      end
    3'b001:
      if (in)
      begin
        next_state = 3'b010;       
      end
      else
      begin
        next_state = 3'b001;
      end
      3'b010:
      if (in)
      begin
         next_state = 3'b011;
         digit2 = BCD;
      end
      else
      begin
        next_state = 3'b010;
      end
      3'b011:
      if (in)
      begin
         next_state = 3'b000;
      end
      else
      begin
          next_state = 3'b011;
      end 
            
    default:
      begin
        next_state = 3'b000;	 
    end
  endcase

always @(posedge clk or negedge rst_n)
begin
  if (~rst_n)
    state <= 3'b000;
  else
    state <= next_state;
end

endmodule