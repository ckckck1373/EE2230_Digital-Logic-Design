`timescale 1ns / 1ps
module VGA_Color(
	input clk_vga,
	input valid,
	input [31:0] xposin,
    input [31:0] yposin,
	output reg[3:0]red,
	output reg[3:0]green,
	output reg[3:0]blue,
    output reg [16:0] pixel_addr,
	input [31:0]X_obst0,
    input [31:0]X_obst1,
    input [31:0]X_obst2,
    input [31:0]X_bird_obst0,
    input [31:0]X_bird_obst1,
    input [31:0]Y_hero,
    input showmode,
    input showmode1,
    input DEAD,
    input kp_down,
    input [3:0]life,
    input next_dead,
    input clk_100Hz,
    input [3:0]N0,N1,N2,N3,N4,N5,N6,N7
);
    wire [31:0]xpos, ypos;
    
    //some parameter
    localparam Y_obst=448;
    localparam Y_bird_obst=200;
    localparam wid_obst=120,heg_obst0=100,heg_obst1=100,heg_obst2=100;   
    localparam wid_bird_obst=120,heg_bird_obst0=100,heg_bird_obst1=100;  
    localparam X_hero=120;
    

	
	reg [31:0]addr_hero;
	reg [31:0]addr_bird_obst0,addr_bird_obst1;
	wire [31:0]addr_obst0,addr_obst1,addr_obst2;
	wire [31:0]addr_gameover,addr_sign;
	wire [31:0]addr_life;
	wire [31:0]addr_num0,addr_num1,addr_num2,addr_num3,addr_num4,addr_num5,addr_num6,addr_num7,addr_num8,addr_num9;
	
	//DINO WALK
	always@*
	begin
	   case(showmode)
	          1'b0 : begin
	                     addr_hero = (kp_down==0)? ((xposin>>1)) % 60 + (((yposin+112-Y_hero)>>1)) % 56 * 320 + 65  + 25 * 320 : ((xposin>>1)+60) % 60 + ((yposin+112-Y_hero)>>1) % 56 * 320 + 192  + 25 * 320;
	                 end
	          1'b1 : begin
	                      addr_hero = (kp_down==0)? ((xposin>>1)) % 60 + (((yposin+112-Y_hero)>>1)) % 56 * 320 + 130 + 25 * 320 : ((xposin>>1)+60) % 60 + ((yposin+112-Y_hero)>>1) % 56 * 320 + 258  + 25 * 320;
	                 end
	      default:   begin
	                      addr_hero = (kp_down==0)? ((xposin>>1)) % 60 + (((yposin+112-Y_hero)>>1)) % 56 * 320 + 65 + 25 * 320 : ((xposin>>1)+60) % 60 + ((yposin+112-Y_hero)>>1) % 56 * 320 + 192  + 25 * 320;
	                 end
	   endcase
	end
	
	
	//BIRD FLY
	always@*
        begin
           case(showmode1)
                  1'b0 : begin
                             addr_bird_obst0 =   ((xposin+120-X_bird_obst0)>>1) % 60 + (yposin>>1) % 56 * 320  + 83 * 320 ;
                             addr_bird_obst1 =   ((xposin+120-X_bird_obst1)>>1) % 60 + (yposin>>1) % 56 * 320  + 83 * 320 ;
                         end
                  1'b1 : begin
                              addr_bird_obst0 =  ((xposin+120-X_bird_obst0)>>1) % 60 + (yposin>>1) % 56 * 320 + 65 + 83 * 320 ;
                              addr_bird_obst1 =  ((xposin+120-X_bird_obst1)>>1) % 60 + (yposin>>1) % 56 * 320 + 65 + 83 * 320 ;
                         end
              default:   begin
                              addr_bird_obst0 =  ((xposin+120-X_bird_obst0)>>1) % 60 + (yposin>>1) % 56 * 320  + 83 * 320 ;
                               addr_bird_obst1 =   ((xposin+120-X_bird_obst1)>>1) % 60 + (yposin>>1) % 56 * 320  + 83 * 320 ;
                         end
           endcase
        end
    
    //number controll
       assign    addr_num0 = ((xposin+14)>>1) % 7 + (yposin>>1) % 15 * 320 +   1  + 172 * 320 ;
       assign    addr_num1 = ((xposin+14)>>1) % 7 + (yposin>>1) % 15 * 320 + 15 + 172 * 320 ;
       assign    addr_num2 = ((xposin+14)>>1) % 7 + (yposin>>1) % 15 * 320 + 29  + 172 * 320 ;
       assign    addr_num3 = ((xposin+14)>>1) % 7 + (yposin>>1) % 15 * 320 + 43 + 172 * 320 ;
       assign    addr_num4 = ((xposin+14)>>1) % 7 + (yposin>>1) % 15 * 320 + 57 + 172 * 320 ;
       assign    addr_num5 = ((xposin+14)>>1) % 7 + (yposin>>1) % 15 * 320 + 71 + 172 * 320 ;
       assign    addr_num6 = ((xposin+14)>>1) % 7 + (yposin>>1) % 15 * 320 + 85 + 172 * 320 ;
       assign    addr_num7 = ((xposin+14)>>1) % 7 + (yposin>>1) % 15 * 320 + 99 + 172 * 320 ;
       assign    addr_num8 = ((xposin+14)>>1) % 7 + (yposin>>1) % 15 * 320 + 113 + 172 * 320 ;
       assign    addr_num9 = ((xposin+14)>>1) % 7 + (yposin>>1) % 15 * 320 + 127 + 172 * 320 ;
    
	//Scan the picture
	assign addr_obst0 =  ((xposin+120-X_obst0)>>1) % 60 + (yposin>>1) % 56 * 320 + 129 + 83 * 320 ;
	assign addr_obst1 =  ((xposin+120-X_obst1)>>1) % 60 + (yposin>>1) % 56 * 320 + 193 + 83 * 320 ;
	assign addr_obst2 =  ((xposin+120-X_obst2)>>1) % 60 + (yposin>>1) % 56 * 320 + 255 + 83 * 320 ;

	assign addr_gameover = (xposin>>1) % 320 + (yposin>>1) % 20 * 320 +  145 * 320 ;
	assign addr_sign = (xposin>>1) % 60 + (yposin>>1) % 58 * 320 + 3 + 25 * 320;
	assign addr_life = (xposin >> 1) % 40 + (yposin >>1) % 40 * 320  + 200 * 320 ;
	
	always@*
	begin
	   if((xposin > X_obst0 - wid_obst) && (xposin < X_obst0) && (yposin > Y_obst - 112) && (yposin < Y_obst))
	       pixel_addr = addr_obst0;
	   else if((xposin >= X_obst1 - wid_obst) && (xposin < X_obst1) && (yposin > Y_obst - 112) && (yposin < Y_obst))
           pixel_addr = addr_obst1;
       else if((xposin >= X_obst2 - wid_obst) && (xposin < X_obst2) && (yposin > Y_obst - 112) && (yposin < Y_obst))
           pixel_addr = addr_obst2;
       else if((xposin >= X_bird_obst0 - wid_bird_obst) && (xposin < X_bird_obst0) && (yposin > Y_bird_obst - 112) && (yposin < Y_bird_obst))
           pixel_addr = addr_bird_obst0;
       else if((xposin >= X_bird_obst1 - wid_bird_obst) && (xposin < X_bird_obst1) && (yposin > Y_bird_obst - 112) && (yposin < Y_bird_obst))
           pixel_addr = addr_bird_obst1;
       else if((DEAD == 1)&&(life ==4'd0)&&(xposin >= 0) && (xposin < 640) && (yposin > 200) && (yposin < 240))
           pixel_addr = addr_gameover;    
       else if((xposin >= X_hero - 120) && (xposin < X_hero ) && (yposin > Y_hero - 112) && (yposin < Y_hero)&&(~next_dead))
           pixel_addr = addr_hero;
       else if((xposin >= X_hero - 120) && (xposin < X_hero ) && (yposin > Y_hero - 112) && (yposin < Y_hero)&&(next_dead))
            begin
                case(clk_100Hz)
                1'b1:  pixel_addr = addr_hero ;        
                1'b0:  pixel_addr = 0;
                default : pixel_addr = addr_hero;
                endcase
             end  
       else if((xposin >= 0 ) && (xposin < 640 ) && (yposin >= 448) && (yposin < 480))
           pixel_addr =  10 + 29 * 320  ;  
       else if((xposin >= 550) && (xposin < 625) && (yposin >= 5) && (yposin < 77)&&(life >= 4'd1))
           pixel_addr = addr_life  ;
       else if((xposin >= 475) && (xposin < 550) && (yposin >= 5) && (yposin < 77)&&(life >= 4'd2))     
           pixel_addr = addr_life  ; 
       else if((xposin >= 400) && (xposin < 475) && (yposin >= 5) && (yposin < 77)&&(life >= 4'd3))     
           pixel_addr = addr_life  ;     
       /*else if((xposin >= 30) && (xposin < 44) && (yposin >= 5) && (yposin < 35))     
            begin
            case(N7)
                     4'd0 : pixel_addr = addr_num0  ;  
                     4'd1 : pixel_addr = addr_num1  ;  
                     4'd2 : pixel_addr = addr_num2  ;  
                     4'd3 : pixel_addr = addr_num3  ;  
                     4'd4 : pixel_addr = addr_num4  ;  
                     4'd5 : pixel_addr = addr_num5  ;  
                     4'd6 : pixel_addr = addr_num6  ;  
                     4'd7 : pixel_addr = addr_num7  ;  
                     4'd8 : pixel_addr = addr_num8  ;  
                     4'd9 : pixel_addr = addr_num9  ;  
                     default : pixel_addr = 0;  
                  endcase   
                  end
       else if((xposin >= 48) && (xposin < 62) && (yposin >= 5) && (yposin < 35))     
                  begin
                  case(N6)
                     4'd0 : pixel_addr = addr_num0  ;  
                     4'd1 : pixel_addr = addr_num1  ;  
                     4'd2 : pixel_addr = addr_num2  ;  
                     4'd3 : pixel_addr = addr_num3  ;  
                     4'd4 : pixel_addr = addr_num4  ;  
                     4'd5 : pixel_addr = addr_num5  ;  
                     4'd6 : pixel_addr = addr_num6  ;  
                     4'd7 : pixel_addr = addr_num7  ;  
                     4'd8 : pixel_addr = addr_num8  ;  
                     4'd9 : pixel_addr = addr_num9  ; 
                     default : pixel_addr =0;   
                  endcase   
                  end    
         else if((xposin>= 66) && (xposin < 80) && (yposin >= 5) && (yposin < 35))     
                  begin
                  case(N5)
                     4'd0 : pixel_addr = addr_num0  ;  
                     4'd1 : pixel_addr = addr_num1  ;  
                     4'd2 : pixel_addr = addr_num2  ;  
                     4'd3 : pixel_addr = addr_num3  ;  
                     4'd4 : pixel_addr = addr_num4  ;  
                     4'd5 : pixel_addr = addr_num5  ;  
                     4'd6 : pixel_addr = addr_num6  ;  
                     4'd7 : pixel_addr = addr_num7  ;  
                     4'd8 : pixel_addr = addr_num8  ;  
                     4'd9 : pixel_addr = addr_num9  ;  
                     default : pixel_addr = 0;  
                   endcase   
                   end
             else if((xposin >= 84) && (xposin < 98) && (yposin >= 5) && (yposin < 35))     
                  begin
                  case(N4)
                     4'd0 : pixel_addr = addr_num0  ;  
                     4'd1 : pixel_addr = addr_num1  ;  
                     4'd2 : pixel_addr = addr_num2  ;  
                     4'd3 : pixel_addr = addr_num3  ;  
                     4'd4 : pixel_addr = addr_num4  ;  
                     4'd5 : pixel_addr = addr_num5  ;  
                     4'd6 : pixel_addr = addr_num6  ;  
                     4'd7 : pixel_addr = addr_num7  ;  
                     4'd8 : pixel_addr = addr_num8  ;  
                     4'd9 : pixel_addr = addr_num9  ; 
                     default : pixel_addr = 0;   
                   endcase   
                   end   
            else if((xposin >= 160) && (xposin < 174) && (yposin >= 5) && (yposin < 35))     
                  begin
                  case(N3)
                     4'd0 : pixel_addr = addr_num0  ;  
                     4'd1 : pixel_addr = addr_num1  ;  
                     4'd2 : pixel_addr = addr_num2  ;  
                     4'd3 : pixel_addr = addr_num3  ;  
                     4'd4 : pixel_addr = addr_num4  ;  
                     4'd5 : pixel_addr = addr_num5  ;  
                     4'd6 : pixel_addr = addr_num6  ;  
                     4'd7 : pixel_addr = addr_num7  ;  
                     4'd8 : pixel_addr = addr_num8  ;  
                     4'd9 : pixel_addr = addr_num9  ;   
                     default : pixel_addr = 0; 
                   endcase   
                   end
             else if((xposin >= 178) && (xposin < 192) && (yposin >= 5) && (yposin < 35))     
                  begin
                  case(N2)
                     4'd0 : pixel_addr = addr_num0  ;  
                     4'd1 : pixel_addr = addr_num1  ;  
                     4'd2 : pixel_addr = addr_num2  ;  
                     4'd3 : pixel_addr = addr_num3  ;  
                     4'd4 : pixel_addr = addr_num4  ;  
                     4'd5 : pixel_addr = addr_num5  ;  
                     4'd6 : pixel_addr = addr_num6  ;  
                     4'd7 : pixel_addr = addr_num7  ;  
                     4'd8 : pixel_addr = addr_num8  ;  
                     4'd9 : pixel_addr = addr_num9  ;   
                     default : pixel_addr = 0; 
                   endcase   
                   end   
            else if((xposin  >= 196) && (xposin  < 210) && (yposin >= 5) && (yposin < 35))     
                  begin
                  case(N1)
                     4'd0 : pixel_addr = addr_num0  ;  
                     4'd1 : pixel_addr = addr_num1  ;  
                     4'd2 : pixel_addr = addr_num2  ;  
                     4'd3 : pixel_addr = addr_num3  ;  
                     4'd4 : pixel_addr = addr_num4  ;  
                     4'd5 : pixel_addr = addr_num5  ;  
                     4'd6 : pixel_addr = addr_num6  ;  
                     4'd7 : pixel_addr = addr_num7  ;  
                     4'd8 : pixel_addr = addr_num8  ;  
                     4'd9 : pixel_addr = addr_num9  ;   
                     default : pixel_addr =0; 
                   endcase   
                   end
             else if((xposin>= 214) && (xposin< 228) && (yposin >= 5) && (yposin < 35))     
                  begin
                  case(N0)
                     4'd0 : pixel_addr = addr_num0  ;  
                     4'd1 : pixel_addr = addr_num1  ;  
                     4'd2 : pixel_addr = addr_num2  ;  
                     4'd3 : pixel_addr = addr_num3  ;  
                     4'd4 : pixel_addr = addr_num4  ;  
                     4'd5 : pixel_addr = addr_num5  ;  
                     4'd6 : pixel_addr = addr_num6  ;  
                     4'd7 : pixel_addr = addr_num7  ;  
                     4'd8 : pixel_addr = addr_num8  ;  
                     4'd9 : pixel_addr = addr_num9  ;   
                     default : pixel_addr = 0; 
                   endcase   
                   end  */        
       else 
            pixel_addr = 0;
	end
	
	
	
endmodule