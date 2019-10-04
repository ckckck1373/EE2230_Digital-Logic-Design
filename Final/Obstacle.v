`timescale 1ns / 1ps

module Obstacle(
    input clk_10000Hz,
    input clk_01ms,
    input clk_10ms,
    input clk_100ms,
    input reset,
    input enable,
    input switch_clk,
    output reg [31:0] x_obst0,
    output reg [31:0] x_obst1,
    output reg [31:0] x_obst2,
    output reg [31:0] x_bird_obst0,
    output reg [31:0] x_bird_obst1,
    output reg showmode,
    output reg clk_game
   );
    
    reg [31:0] diff,diff_next;
    reg [31:0] count0,count0_next;
    
    reg [31:0] count1,count1_next;
    
    reg clk_game_next;
    
    wire [6:0]random;
    // change clk
    assign clk_change = (switch_clk == 1)? clk_game: clk_01ms;
    
    //7bits random number
    Random U0 (
        .clk(clk_01ms),
        .out(random)               
        );
    
    initial 
    begin
        x_obst0 = 610 + 250;
        x_obst1 = 610 + 350 + 250;
        x_obst2 = 610 + 350 + 350 + 250;
        x_bird_obst0 = 1260 + 350 + 350 + 250;
        x_bird_obst1 = 2780 + 350 + 350 + 250;
        diff = 5'd10; count0 = 32'd0; count1 = 32'd0;
    end      
    
 //diff can controll clk_gmae ; clk_game can controll the speed of  background 
    always@*
    if(count0 >= diff)
        begin
             count0_next = 32'b0;
             clk_game_next = ~clk_game;
        end
    else 
        begin
             count0_next = count0 +1'b1;
             clk_game_next = clk_game;
        end   
        
    always@(posedge clk_10000Hz or posedge reset)
    if(reset)
    begin
         count0 <= 32'b0;
         clk_game <= 1'b0;
    end
    else
    begin
        count0 <= count0_next;
        clk_game <= clk_game_next;
    end
     
  // diff decrease and clk_game increase while 
  always@*
  if(count1 == 5'd30 && diff >= 32'd5 )
    begin
        diff_next = diff - 1'b1; 
        count1_next = 32'd0;
    end
  else
    begin
        diff_next = diff;
        count1_next = count1 + 1'b1;
    end
    
   
  always@(posedge clk_100ms or posedge reset)
  if(reset)
    begin
        diff <= 32'd24;
        count1 <= 32'd0;
    end
  else 
    begin
        diff <= diff_next;
        count1 <= count1_next;
    end



  
  // obstacles' position
  always@(posedge clk_change or posedge reset)
  begin
    if(reset)
    begin
        x_obst0 = 610+ 700;
        x_obst1 = 850 + 350+ 700;
        x_obst2 = 1200 + 350 + 350+ 700;
        x_bird_obst0 = 1280 + 350 + 350 + 250;
        x_bird_obst1 = 5400 + 350 + 350 + 250;
    end
    else
    begin
        if(enable)
        begin // reset position once it approach 0
             if(x_obst0 == 0)
                  x_obst0 = x_obst2 + 300 + (240-diff*10) + random;
             else if(x_obst1 == 0)
                  x_obst1 = x_obst0 + 370 + (240-diff*10) + random;
             else if( x_obst2 == 0)
                  x_obst2 = x_obst1 + 420 + (240-diff*10) + random;
             else if( x_bird_obst0 == 0)
                  x_bird_obst0 =  x_obst1 + 1500 + (240- diff*10) + random;
             else if( x_bird_obst1 == 0)
                  x_bird_obst1 =  x_bird_obst0 + 8500 + (240- diff*10) + random;         
            // push postion back
                x_obst0 = x_obst0 - 1;
                x_obst1 = x_obst1 - 1;
                x_obst2 = x_obst2 - 1;
                x_bird_obst0 =  x_bird_obst0 - 1;
                x_bird_obst1 =  x_bird_obst1 - 2;
             end
         end
    end
    
    
    
   always@(posedge clk_100ms)
        begin
            if(reset)
                showmode = 1'b0;
            else if(enable)
                showmode = ~showmode;         
            else
                showmode = 1'b0;
        end
endmodule