`timescale 1ns / 1ps
`define S0 4'b0000
`define S1 4'b0001
`define S2 4'b0010
`define S3 4'b0011
`define S4 4'b0100
`define S5 4'b0101
`define S6 4'b0110
`define S7 4'b0111
`define S8 4'b1000
`define S9 4'b1001
`define S10 4'b1010
`define S11 4'b1011
`define S12 4'b1100
`define S13 4'b1101

module FSM(
  output reg [3:0] next_state,  
  output reg [3:0] digit3,
  output reg [3:0] digit2,
  output reg [3:0] digit1,
  output reg [3:0] digit0,
  output reg [3:0] symbol,
  input [3:0] BCD,
  input in,
  input clk, 
  input rst_n  
);

reg [3:0] state;  
reg [3:0] next_digit3,next_digit2,next_digit1,next_digit0;
reg [3:0] next_symbol;
wire in_num;
wire in_sym;
wire in_enter;


assign in_num = (BCD == 4'd0 || BCD == 4'd1 ||BCD == 4'd2 ||BCD == 4'd3 || BCD == 4'd4||BCD == 4'd5 ||BCD == 4'd6 || BCD == 4'd7 || BCD == 4'd8 || BCD == 4'd9)& in? 1 : 0;
assign in_sym = (BCD == 4'd10 || BCD == 4'd11 ||BCD == 4'd12 )& in? 1 : 0;
assign in_enter = (BCD == 4'd15)&in ? 1:0;

always @*
begin
       next_digit3 = digit3;
       next_digit2 = digit2;
       next_digit1 = digit1;
       next_digit0 = digit0;
  case (state)
    `S0://press
      if (in_num)
      begin
        next_state = `S1;     
      end
      else
      begin
        next_state = `S0;
      end
    `S1://save digit3
      if (in_num)
      begin
        next_state = `S2;
        next_digit3 = BCD;
      end
      else
      begin
        next_state = `S1;
      end
    `S2://press
      if (in_num)
      begin
         next_state = `S3;
      end
      else
      begin
        next_state = `S2;
      end
    `S3://save digit2
      if (in_num)
      begin
         next_state = `S4;  
         next_digit2 = BCD;  
      end
      else
      begin
          next_state = `S3;
      end 
    `S4://press
      if (in_num)
      begin
          next_state = `S5;
      end
      else
      begin
          next_state = `S4;
      end
    `S5://save digit1
      if (in_num)
      begin
           next_state = `S6;
           next_digit1 = BCD;
       end
       else
       begin
            next_state = `S5;
       end 
     `S6://press
       if (in_num)
       begin
            next_state = `S7;
       end
       else
       begin
            next_state = `S6;
       end 
     `S7://save digit0
       if (in_num)
       begin
            next_state = `S8;
            next_digit0 = BCD;
       end
       else
       begin
            next_state = `S7;
        end 
      `S8://press 
        if (in_sym)
        begin
             next_state = `S9;         
         end
         else
         begin
             next_state = `S8;
         end 
      `S9://save symbol
         if (in_sym)
         begin
              next_state = `S10;
              next_symbol = BCD;
         end
         else
         begin
              next_state = `S9;
         end  
      `S10://press enter
         if (in_enter)
         begin
              next_state = `S11;
         end
         else
         begin
              next_state = `S10;
         end 
      `S11://show result
         if (in_enter)
         begin
               next_state = `S12;
         end
         else
         begin
                next_state = `S11;
         end  
       `S12://press enter
         if (in_enter)
         begin
                next_state = `S13;
                next_digit3 = 4'd0;
                next_digit2 = 4'd0;
                next_digit1 = 4'd0;
                next_digit0 = 4'd0;
                next_symbol = 4'd0;
         end
         else
         begin
                 next_state = `S12;
         end
      `S13://clear data
         if (in_enter)
         begin
                 next_state = `S0;
         end
         else
         begin
                 next_state = `S13;
          end      
       default:
       begin
        next_state = `S0;	 
       end
endcase
end

always @(posedge clk or negedge rst_n)
begin
  if (~rst_n)
    state <= 4'b0000;
  else
    state <= next_state;
end

always @(posedge clk or negedge rst_n)
begin
  if (~rst_n)
    digit3 <= 4'b0000;
  else
    digit3 <= next_digit3;
end

always @(posedge clk or negedge rst_n)
begin
  if (~rst_n)
    digit2 <= 4'b0000;
  else
    digit2 <= next_digit2;
end

always @(posedge clk or negedge rst_n)
begin
  if (~rst_n)
    digit1 <= 4'b0000;
  else
    digit1 <= next_digit1;
end

always @(posedge clk or negedge rst_n)
begin
  if (~rst_n)
    digit0 <= 4'b0000;
  else
    digit0 <= next_digit0;
end

always @(posedge clk or negedge rst_n)
begin
  if (~rst_n)
    symbol <= 4'b0000;
  else
    symbol <= next_symbol;
end
endmodule