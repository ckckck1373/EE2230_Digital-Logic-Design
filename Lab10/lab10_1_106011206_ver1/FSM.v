`timescale 1ns / 1ps
`define S0 4'b0001
`define S1 4'b0010
`define S2 4'b0011
`define S3 4'b0100
`define S4 4'b0101
`define S5 4'b0110
`define S6 4'b0111
`define S7 4'b1000
`define S8 4'b1001
`define S9 4'b1010
`define S10 4'b1011
`define S11 4'b1100
`define S12 4'b1101
`define S13 4'b1110

`define c 4'b0001
`define d 4'b0010
`define e 4'b0011
`define f 4'b0100
`define g 4'b0101
`define a 4'b0110
`define b 4'b0111
`define C 4'b1000
`define D 4'b1001
`define E 4'b1010
`define F 4'b1011
`define G 4'b1100
`define A 4'b1101
`define B 4'b1110


module FSM(
  output reg [3:0] state,  
  output reg [3:0] digit0,
  input clk, 
  input rst_n  
);

reg [3:0] next_state;



always @*
begin
if(state == `S13)
 next_state = 4'd0001;
else
 next_state = state + 4'd1;
end

always@*
begin
  case (state)      
    `S0://c
      begin
        digit0 =  `c;
      end
    `S1://d
      begin
        digit0 =  `d;
      end
    `S2://e
      begin
        digit0 =  `e;
      end
    `S3://f
      begin
        digit0 =  `f;
      end 
    `S4://g
      begin
        digit0 =  `g;
      end
    `S5://a
       begin
          digit0 =  `a;
       end 
     `S6://b
       begin
          digit0 =  `b;
       end 
     `S7://C
       begin
          digit0 =  `C;
        end 
      `S8://D
         begin
           digit0 =  `D;
         end 
      `S9://E
         begin
            digit0 =  `E;
         end  
      `S10://F
         begin
            digit0 =  `F;
         end 
      `S11://G
         begin
            digit0 =  `G;
         end  
       `S12://A
         begin
            digit0 =  `A;
         end
      `S13://B
         begin
             digit0 =  `B;
          end      
       default:
       begin	 
             digit0 =  `c;
       end
endcase
end

always @(posedge clk or negedge rst_n)
begin
  if (~rst_n)
    state <= 4'b0001;
  else
    state <= next_state;
end

endmodule