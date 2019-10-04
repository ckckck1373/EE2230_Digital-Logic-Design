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
     input [3:0] level,
     input clk,
     input rst_n
    );
    
    reg b_clk, next_b_clk;
    reg [17:0] cnt,next_cnt;
    reg [17:0] limit;
    
    always@(posedge clk or negedge rst_n)
    begin
        if(rst_n ==1'b0)
        begin
            b_clk <=  1'b0;
            cnt <= 18'd0;
        end    
        else 
        begin
            b_clk <= next_b_clk;
            cnt <= next_cnt;
        end       
    end
    
    always@*
    begin
        if(cnt == limit && note != 4'b0)
        begin
            next_cnt = 18'd0;
            next_b_clk = ~b_clk;
        end
        else
        begin
            next_cnt = cnt + 18'd1;
            next_b_clk = b_clk;
        end

    
    
    case(level)
          4'd15, 4'd14, 4'd13:
          begin
              audio_l = (b_clk == 1'b0) ? 16'hB000 : 16'h5FFF;
              audio_r = (b_clk == 1'b0) ? 16'hB000 : 16'h5FFF;
          end
          4'd12:
          begin
              audio_l = (b_clk == 1'b0) ? 16'hB800 : 16'h57FF;
              audio_r = (b_clk == 1'b0) ? 16'hB800 : 16'h57FF;
          end
          4'd11:
          begin
              audio_l = (b_clk == 1'b0) ? 16'hC000 : 16'h4FFF;
              audio_r = (b_clk == 1'b0) ? 16'hC000 : 16'h4FFF;
          end
          4'd10:
          begin
              audio_l = (b_clk == 1'b0) ? 16'hC800 : 16'h47FF;
              audio_r = (b_clk == 1'b0) ? 16'hC800 : 16'h47FF;
          end
          4'd9:
          begin
              audio_l = (b_clk == 1'b0) ? 16'hD000 : 16'h3FFF;
              audio_r = (b_clk == 1'b0) ? 16'hD000 : 16'h3FFF;
          end
          4'd8:
          begin
              audio_l = (b_clk == 1'b0) ? 16'hD800 : 16'h37FF;
              audio_r = (b_clk == 1'b0) ? 16'hD800 : 16'h37FF;
          end
          4'd7:
          begin
              audio_l = (b_clk == 1'b0) ? 16'hE000 : 16'h2FFF;
              audio_r = (b_clk == 1'b0) ? 16'hE000 : 16'h2FFF;
          end
          4'd6:
          begin
              audio_l = (b_clk == 1'b0) ? 16'hE800 : 16'h27FF;
              audio_r = (b_clk == 1'b0) ? 16'hE800 : 16'h27FF;
          end
          4'd5:
          begin
              audio_l = (b_clk == 1'b0) ? 16'hF000 : 16'h1FFF;
              audio_r = (b_clk == 1'b0) ? 16'hF000 : 16'h1FFF;
          end
          4'd4:
          begin
              audio_l = (b_clk == 1'b0) ? 16'hF800 : 16'h17FF;
              audio_r = (b_clk == 1'b0) ? 16'hF800 : 16'h17FF;
          end
          4'd3:
          begin
              audio_l = (b_clk == 1'b0) ? 16'h0000 : 16'h0FFF;
              audio_r = (b_clk == 1'b0) ? 16'h0000 : 16'h0FFF;
          end
          4'd2, 4'd1, 4'd0:
          begin
              audio_l = (b_clk == 1'b0) ? 16'h0000 : 16'h0000;
              audio_r = (b_clk == 1'b0) ? 16'h0000 : 16'h0000;
          end                                                      
      endcase 
            
      case(note)
         `c: limit = 18'd191110; 
         `d: limit = 18'd170264; 
         `e: limit = 18'd151685;
         `f: limit = 18'd143172;
         `g: limit = 18'd127551;
         `a: limit = 18'd113636;
         `b: limit = 18'd101239;
         `C: limit = 18'd95602;
         `D: limit = 18'd85131;
         `E: limit = 18'd75873;
         `F: limit = 18'd71586;
         `G: limit = 18'd63776;
         `A: limit = 18'd56818;
         `B: limit = 18'd50619;
        default: limit = 18'd191110;
      endcase
    end
endmodule
