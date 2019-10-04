`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/06/07 19:05:42
// Design Name: 
// Module Name: Check
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


module Check(
    input clk,
    input clk_1s,
    input clk_2Hz,
    input reset,
    input enable,
    input kp_down,
    input [31:0]x_obst0,
    input [31:0]x_obst1, 
    input [31:0]x_obst2,
    input [31:0] x_bird_obst0,
    input [31:0] x_bird_obst1,
    input [31:0]y_hero,
    output reg [3:0]life,
    output really_dead,
    output reg dead,
    output reg [31:0] current_score,
    output reg next_dead, 
    input undead,
    input clk_game
    );
    
    //some parameter for hero
    localparam y_obst = 448;
    localparam wid_obst = 120, heg_obst0 = 56, heg_obst1 = 50, heg_obst2 = 56;
    
    localparam y_bird_obst = 200;
    localparam wid_bird_obst = 120, heg_bird_obst0 = 56, heg_bird_obst1 = 56;
    
    localparam x_hero = 120;
    
    
    //new 6.12 add more life
    assign really_dead = (life == 4'd0)? 1'b1 :1'b0;
    
   // reg dead;//being attack
    initial begin dead = 0; current_score = 0; end
    reg [3:0]next_life;
    
    //blick blick dino
   // reg next_dead;// deifferent for delay signal!!!
        
        // take 5 characteristic points to determine dead or not
        always@*
        begin
            if(reset)
                dead = 1'b0;
            else begin
            //not pause and not invinsible mode
            if((enable)&&(!undead)&&(~kp_down)&&(~next_dead))
            begin
                 //obstacle 0
                if((x_hero - 23 < x_obst0)&&(x_hero- 23 + wid_obst > x_obst0)&&(y_hero- 100 > y_obst-heg_obst0))
                    dead = 1'b1;
                else if((x_hero - 24 < x_obst0)&&(x_hero- 24 + wid_obst > x_obst0)&&(y_hero - 76 > y_obst-heg_obst0))
                    dead = 1'b1;
                else if((x_hero - 54 < x_obst0)&&(x_hero- 54 + wid_obst > x_obst0)&&(y_hero - 8 > y_obst-heg_obst0))   
                    dead = 1'b1; 
                else if((x_hero - 90 < x_obst0)&&(x_hero- 90 + wid_obst > x_obst0)&&(y_hero - 8 > y_obst-heg_obst0))
                    dead = 1'b1; 
                else if((x_hero - 70 < x_obst0)&&(x_hero- 70 + wid_obst > x_obst0)&&(y_hero - 80 > y_obst-heg_obst0))
                    dead = 1'b1; 
                //obstacle 1        
                else if((x_hero - 23 < x_obst1)&&(x_hero- 23 + wid_obst > x_obst1)&&(y_hero- 100 > y_obst-heg_obst1))
                    dead = 1'b1;
                else if((x_hero - 24 < x_obst1)&&(x_hero- 24 + wid_obst > x_obst1)&&(y_hero - 76 > y_obst-heg_obst1))
                    dead = 1'b1;
                else if((x_hero - 54 < x_obst1)&&(x_hero- 54 + wid_obst > x_obst1)&&(y_hero - 8 > y_obst-heg_obst1))
                    dead = 1'b1;
                else if((x_hero - 60 < x_obst1)&&(x_hero- 60 + wid_obst > x_obst1)&&(y_hero - 8 > y_obst-heg_obst1))
                    dead = 1'b1;
                else if((x_hero - 70 < x_obst1)&&(x_hero- 70 + wid_obst > x_obst1)&&(y_hero - 80 > y_obst-heg_obst1)) 
                    dead = 1'b1;
                //obstacle 2    
                else if((x_hero - 23 < x_obst2)&&(x_hero- 23 + wid_obst > x_obst2)&&(y_hero- 100 > y_obst-heg_obst2))
                    dead = 1'b1;
                else if((x_hero - 24 < x_obst2)&&(x_hero- 24 + wid_obst > x_obst2)&&(y_hero - 76 > y_obst-heg_obst2))
                    dead = 1'b1;
                else if((x_hero - 54 < x_obst2)&&(x_hero- 54 + wid_obst > x_obst2)&&(y_hero - 8 > y_obst-heg_obst2))
                    dead = 1'b1;
                else if((x_hero - 60 < x_obst2)&&(x_hero- 60 + wid_obst > x_obst2)&&(y_hero - 8 > y_obst-heg_obst2))
                    dead = 1'b1;
                else if((x_hero - 70 < x_obst2)&&(x_hero- 70 + wid_obst > x_obst2)&&(y_hero - 80 > y_obst-heg_obst2)) 
                    dead = 1'b1;
                //bird 0  
                else if((x_hero - 16 < x_bird_obst0)&&(x_hero- 16 +  wid_bird_obst > x_bird_obst0)&&(y_hero- 110 < y_bird_obst ))
                   dead = 1'b1;
                else if((x_hero - 24 < x_bird_obst0)&&(x_hero- 24 +  wid_bird_obst > x_bird_obst0)&&(y_hero - 90 < y_bird_obst ))
                   dead = 1'b1;
                else if((x_hero - 54 < x_bird_obst0)&&(x_hero- 54 +  wid_bird_obst > x_bird_obst0)&&(y_hero - 80 < y_bird_obst ))   
                   dead = 1'b1; 
                else if((x_hero - 60 < x_bird_obst0)&&(x_hero- 60 +  wid_bird_obst > x_bird_obst0)&&(y_hero - 60 < y_bird_obst ))
                   dead = 1'b1; 
                else if((x_hero - 65 < x_bird_obst0)&&(x_hero- 65 +  wid_bird_obst > x_bird_obst0)&&(y_hero - 40 < y_bird_obst ))     
                   dead = 1'b1;
                else if((x_hero - 50 < x_bird_obst0)&&(x_hero- 50 + wid_bird_obst > x_bird_obst0)&&(y_hero - 80 <  y_bird_obst )) 
                   dead = 1'b1;
                else if((x_hero - 70 < x_bird_obst0)&&(x_hero- 70 + wid_bird_obst > x_bird_obst0)&&(y_hero - 30 <  y_bird_obst )) 
                   dead = 1'b1;
                //bird 1
                else if((x_hero - 16 < x_bird_obst1)&&(x_hero- 16 +  wid_bird_obst > x_bird_obst1)&&(y_hero- 110 < y_bird_obst ))
                   dead = 1'b1;
                else if((x_hero - 24 < x_bird_obst1)&&(x_hero- 24 +  wid_bird_obst > x_bird_obst1)&&(y_hero - 90 < y_bird_obst ))
                   dead = 1'b1;
                else if((x_hero - 54 < x_bird_obst1)&&(x_hero- 54 +  wid_bird_obst > x_bird_obst1)&&(y_hero - 80 < y_bird_obst ))   
                   dead = 1'b1; 
                else if((x_hero - 60 < x_bird_obst1)&&(x_hero- 60 +  wid_bird_obst > x_bird_obst1)&&(y_hero - 60 < y_bird_obst ))
                   dead = 1'b1; 
                else if((x_hero - 54 < x_bird_obst1)&&(x_hero- 65 +  wid_bird_obst > x_bird_obst1)&&(y_hero - 40 < y_bird_obst ))     
                   dead = 1'b1;
                else if((x_hero - 50 < x_bird_obst1)&&(x_hero- 50 + wid_bird_obst > x_bird_obst1)&&(y_hero - 80 <  y_bird_obst )) 
                   dead = 1'b1;
                else if((x_hero - 70 < x_bird_obst1)&&(x_hero- 70 + wid_bird_obst > x_bird_obst1)&&(y_hero - 30 <  y_bird_obst )) 
                   dead = 1'b1;
                else dead = 1'b0;
            end         
            else if((enable)&&(!undead)&&(kp_down)&&(~next_dead))
            begin
                //obstacle 0
                if((x_hero - 23 < x_obst0)&&(x_hero- 23 + wid_obst > x_obst0)&&(y_hero- 50 > y_obst-heg_obst0))
                     dead = 1'b1;  
                else if((x_hero - 24 < x_obst0)&&(x_hero- 24 + wid_obst > x_obst0)&&(y_hero - 38 > y_obst-heg_obst0))
                     dead = 1'b1;
                else if((x_hero - 54 < x_obst0)&&(x_hero- 54 + wid_obst > x_obst0)&&(y_hero - 8 > y_obst-heg_obst0))
                     dead = 1'b1;
                else if((x_hero - 60 < x_obst0)&&(x_hero- 60 + wid_obst > x_obst0)&&(y_hero - 8 > y_obst-heg_obst0))
                     dead = 1'b1;
                else if((x_hero - 70 < x_obst0)&&(x_hero- 70 + wid_obst > x_obst0)&&(y_hero - 80 > y_obst-heg_obst0))       
                     dead = 1'b1;
                  //obstacle 1         
                else if((x_hero - 23 < x_obst1)&&(x_hero- 23 + wid_obst > x_obst1)&&(y_hero- 50 > y_obst-heg_obst1))   
                     dead = 1'b1;
                else if((x_hero - 24 < x_obst1)&&(x_hero- 24 + wid_obst > x_obst1)&&(y_hero - 38 > y_obst-heg_obst1))       
                      dead = 1'b1;
                else if((x_hero - 54 < x_obst1)&&(x_hero- 54 + wid_obst > x_obst1)&&(y_hero - 8 > y_obst-heg_obst1))      
                      dead = 1'b1; 
                else if((x_hero - 60 < x_obst1)&&(x_hero- 60 + wid_obst > x_obst1)&&(y_hero - 8 > y_obst-heg_obst1))      
                      dead = 1'b1; 
                else if((x_hero - 70 < x_obst1)&&(x_hero- 70 + wid_obst > x_obst1)&&(y_hero - 80 > y_obst-heg_obst1))      
                      dead = 1'b1; 
                //obstacle 2      
                else if((x_hero - 23 < x_obst2)&&(x_hero- 23 + wid_obst > x_obst2)&&(y_hero- 50 > y_obst-heg_obst2))      
                      dead = 1'b1; 
                else if((x_hero - 24 < x_obst2)&&(x_hero- 24 + wid_obst > x_obst2)&&(y_hero - 38 > y_obst-heg_obst2))      
                      dead = 1'b1;       
                else if((x_hero - 54 < x_obst2)&&(x_hero- 54 + wid_obst > x_obst2)&&(y_hero - 8 > y_obst-heg_obst2))
                      dead = 1'b1;      
                else if((x_hero - 60 < x_obst2)&&(x_hero- 60 + wid_obst > x_obst2)&&(y_hero - 8 > y_obst-heg_obst2))
                      dead = 1'b1;       
                else if((x_hero - 70 < x_obst2)&&(x_hero- 70 + wid_obst > x_obst2)&&(y_hero - 80 > y_obst-heg_obst2)) 
                      dead = 1'b1;
                 //bird 0  
                else if((x_hero - 23 < x_bird_obst0)&&(x_hero- 23 +  wid_bird_obst > x_bird_obst0)&&(y_hero- 50 < y_bird_obst ))
                    dead = 1'b1;
                else if((x_hero - 24 < x_bird_obst0)&&(x_hero- 24 +  wid_bird_obst > x_bird_obst0)&&(y_hero - 38 < y_bird_obst ))
                    dead = 1'b1;
                else if((x_hero - 54 < x_bird_obst0)&&(x_hero- 54 +  wid_bird_obst > x_bird_obst0)&&(y_hero - 8 < y_bird_obst ))   
                    dead = 1'b1; 
                else if((x_hero - 60 < x_bird_obst0)&&(x_hero- 60 +  wid_bird_obst > x_bird_obst0)&&(y_hero - 8 < y_bird_obst ))
                    dead = 1'b1; 
                else if((x_hero - 65 < x_bird_obst0)&&(x_hero- 65 +  wid_bird_obst > x_bird_obst0)&&(y_hero - 38 < y_bird_obst ))     
                    dead = 1'b1;
                else if((x_hero - 50 < x_bird_obst0)&&(x_hero- 50 + wid_bird_obst > x_bird_obst0)&&(y_hero - 60 <  y_bird_obst)) 
                    dead = 1'b1;
                else if((x_hero - 70 < x_bird_obst0)&&(x_hero- 70 + wid_bird_obst > x_bird_obst0)&&(y_hero - 30 <  y_bird_obst )) 
                    dead = 1'b1;     
                   //bird 01   
                 else if((x_hero - 23 < x_bird_obst1)&&(x_hero- 23 +  wid_bird_obst > x_bird_obst1)&&(y_hero- 50 < y_bird_obst ))
                      dead = 1'b1;
                 else if((x_hero - 24 < x_bird_obst1)&&(x_hero- 24 +  wid_bird_obst > x_bird_obst1)&&(y_hero - 38 < y_bird_obst ))
                      dead = 1'b1;
                 else if((x_hero - 54 < x_bird_obst1)&&(x_hero- 54 +  wid_bird_obst > x_bird_obst1)&&(y_hero - 8 < y_bird_obst ))   
                      dead = 1'b1; 
                  else if((x_hero - 60 < x_bird_obst1)&&(x_hero- 60 +  wid_bird_obst > x_bird_obst1)&&(y_hero - 8 < y_bird_obst))
                      dead = 1'b1; 
                  else if((x_hero - 65 < x_bird_obst1)&&(x_hero- 65 +  wid_bird_obst > x_bird_obst1)&&(y_hero - 38 < y_bird_obst ))     
                      dead = 1'b1;
                  else if((x_hero - 50 < x_bird_obst1)&&(x_hero- 50 + wid_bird_obst > x_bird_obst1)&&(y_hero - 60 <  y_bird_obst )) 
                      dead = 1'b1;
                  else if((x_hero - 70 < x_bird_obst1)&&(x_hero- 70 + wid_bird_obst > x_bird_obst1)&&(y_hero - 30 <  y_bird_obst )) 
                      dead = 1'b1; 
                   else dead = 1'b0;     
                             
            end   
            else dead = 1'b0;                 
         end
end

always@(posedge clk_1s or posedge reset)
begin
    if(reset)
        next_dead <= 1'b0;
    else if(dead == 1)
        next_dead <= dead;
    else 
        next_dead <= 1'b0;
end


//score

always@(posedge clk_1s  or posedge reset)
begin
    if(reset)
        current_score = 0;
    else 
    begin
        if(enable)
            begin
                current_score = current_score + 1 ;
            end
        else 
            begin
                current_score = current_score;
            end
    end
end    



//lfe controll

always@*
begin
if(reset)
    next_life = life;
else if(dead ==1)
    next_life = life - 1;
/*else if(add_life ==1)
    next_life = life + 1 ;*/
else
    next_life = life;
end


always@(posedge clk_1s  or posedge reset)
begin
    if(reset)
    life <= 4'd3;
    else 
    life <= next_life;
end



endmodule
