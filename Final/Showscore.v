`timescale 1ns / 1ps

module Showscore(
      input clk,
      input [31:0]current_score,
      input clk_100000Hz,
      output reg[3:0]N0,
      output reg[3:0]N1,
      output reg[3:0]N2,
      output reg[3:0]N3,
      output reg[3:0]N4,
      output reg[3:0]N5,
      output reg[3:0]N6,
      output reg[3:0]N7
      );
      
      reg [31:0]highest_score = 0;
      
      always@(posedge clk)
        if(highest_score<current_score)
              highest_score=current_score;
        else highest_score=highest_score;


    //4 numbers  
        always@(posedge clk_100000Hz)
        begin
            N0<=current_score%10;
            N1<=(current_score%100-N0)/10;
            N2<=(current_score%1000-10*N1-N0)/100;
            N3<=(current_score-100*N2-10*N1-N0)/1000;
             
            N4<=highest_score%10;
            N5<=(highest_score%100-N4)/10;
            N6<=(highest_score%1000-10*N5-N4)/100;
            N7<=(highest_score-100*N6-10*N5-N4)/1000;   
        end
        
endmodule