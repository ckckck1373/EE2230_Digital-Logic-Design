`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/04/29 14:24:24
// Design Name: 
// Module Name: note
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
`define c 4'd1
`define d 4'd2
`define e 4'd3
`define f 4'd4
`define g 4'd5
`define a 4'd6
`define b 4'd7
`define C 4'd8
`define D 4'd9
`define E 4'd10
`define F 4'd11
`define G 4'd12
`define A 4'd13
`define B 4'd14

module note(
     output reg [15:0] audio_l,
     output reg [15:0] audio_r,
     input [3:0] note,
     input [3:0] note1,
     
     input [3:0] level,
     input clk,
     input rst_n
    );
    
    reg b_clk, next_b_clk;
    reg b_clk1,next_b_clk1;
    reg [18:0] cnt,next_cnt;
    reg [18:0] cnt1,next_cnt1;
    reg [18:0] limit,limit1;
    
    always@(posedge clk or negedge rst_n)
    begin
        if(rst_n ==1'b0)
        begin
            b_clk <=  1'b0;
            cnt <= 19'd0;
            b_clk1 <=  1'b0;
            cnt1 <= 19'd0;
        end    
        else 
        begin
            b_clk <= next_b_clk;
            cnt <= next_cnt;
            b_clk1 <= next_b_clk1;
            cnt1 <= next_cnt1;
        end       
    end
    
    always@*
    begin
        if(cnt == limit && note !=4'b0 )
        begin
            next_cnt = 19'd0;
            next_b_clk = ~b_clk;
        end
        else
        begin
            next_cnt = cnt + 18'd1;
            next_b_clk = b_clk;
        end
     
       if(cnt1 == limit1 && note1 !=4'b0 )
       begin
            next_cnt1 = 19'd0;
            next_b_clk1 = ~b_clk1;
       end
       else
       begin
           next_cnt1 = cnt1 + 19'd1;
           next_b_clk1 = b_clk1;
       end  
       
    case(level)
          4'd15, 4'd14, 4'd13:
          begin
              audio_l = (b_clk == 1'b0) ? 16'hB000 : 16'h5FFF;
              audio_r = (b_clk1 == 1'b0) ? 16'hB000 : 16'h5FFF;
          end
          4'd12:
          begin
              audio_l = (b_clk == 1'b0) ? 16'hB800 : 16'h57FF;
              audio_r = (b_clk1 == 1'b0) ? 16'hB800 : 16'h57FF;
          end
          4'd11:
          begin
              audio_l = (b_clk == 1'b0) ? 16'hC000 : 16'h4FFF;
              audio_r = (b_clk1 == 1'b0) ? 16'hC000 : 16'h4FFF;
          end
          4'd10:
          begin
              audio_l = (b_clk == 1'b0) ? 16'hC800 : 16'h47FF;
              audio_r = (b_clk1 == 1'b0) ? 16'hC800 : 16'h47FF;
          end
          4'd9:
          begin
              audio_l = (b_clk == 1'b0) ? 16'hD000 : 16'h3FFF;
              audio_r = (b_clk1 == 1'b0) ? 16'hD000 : 16'h3FFF;
          end
          4'd8:
          begin
              audio_l = (b_clk == 1'b0) ? 16'hD800 : 16'h37FF;
              audio_r = (b_clk1 == 1'b0) ? 16'hD800 : 16'h37FF;
          end
          4'd7:
          begin
              audio_l = (b_clk == 1'b0) ? 16'hE000 : 16'h2FFF;
              audio_r = (b_clk1 == 1'b0) ? 16'hE000 : 16'h2FFF;
          end
          4'd6:
          begin
              audio_l = (b_clk == 1'b0) ? 16'hE800 : 16'h27FF;
              audio_r = (b_clk1 == 1'b0) ? 16'hE800 : 16'h27FF;
          end
          4'd5:
          begin
              audio_l = (b_clk == 1'b0) ? 16'hF000 : 16'h1FFF;
              audio_r = (b_clk1 == 1'b0) ? 16'hF000 : 16'h1FFF;
          end
          4'd4:
          begin
              audio_l = (b_clk == 1'b0) ? 16'hF800 : 16'h17FF;
              audio_r = (b_clk1 == 1'b0) ? 16'hF800 : 16'h17FF;
          end
          4'd3:
          begin
              audio_l = (b_clk == 1'b0) ? 16'h0000 : 16'h0FFF;
              audio_r = (b_clk1 == 1'b0) ? 16'h0000 : 16'h0FFF;
          end
          4'd2, 4'd1, 4'd0:
          begin
              audio_l = (b_clk == 1'b0) ? 16'h0000 : 16'h0000;
              audio_r = (b_clk1 == 1'b0) ? 16'h0000 : 16'h0000;
          end                                                      
      endcase 
            
      case(note)
          `c: limit = 19'd191110; 
          `d: limit = 19'd170264; 
          `e: limit = 19'd151685;
          `f: limit = 19'd143172;
          `g: limit = 19'd127551;
          `a: limit = 19'd113636;
          `b: limit = 19'd101239;
          `C: limit = 19'd95602;
          `D: limit = 19'd85131;
          `E: limit = 19'd75873;
          `F: limit = 19'd71586;
          `G: limit = 19'd63776;
          `A: limit = 19'd56818;
          `B: limit = 19'd50619;
          default: limit = 19'd191110;
      endcase
      
       case(note1)
           `c: limit1 = 19'd191110; 
           `d: limit1 = 19'd170264; 
           `e: limit1 = 19'd151685;
           `f: limit1 = 19'd143172;
           `g: limit1 = 19'd127551;
           `a: limit1 = 19'd113636;
           `b: limit1 = 19'd101239;
           `C: limit1 = 19'd95602;
           `D: limit1 = 19'd85131;
           `E: limit1 = 19'd75873;
           `F: limit1 = 19'd71586;
           `G: limit1 = 19'd63776;
           `A: limit1 = 19'd56818;
           `B: limit1 = 19'd50619;
        default: limit1 = 19'd191110;
       endcase
    end
    
    
        
    
endmodule
