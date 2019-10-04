`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/05/18 19:55:40
// Design Name: 
// Module Name: top
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


module top(
	inout  PS2_DATA,
    inout  PS2_CLK,
    output mclk,
    output lrclk,
    output sclk,
    output sdin,
    output [7:0] segs,
    output [3:0] scan_ctl,
    input clk,
    input rst,
    input switch
    );
    
      wire [1:0] clk_ctl;
       wire [511:0] key_down;
       wire [8:0] last_change;
       wire key_valid;
       wire [15:0] audio_l,audio_r;
       wire [3:0] ssd_in;
       reg [3:0]note;
       reg [3:0]note1; 
       wire [3:0]BCD;
       
           
     always@*
     begin
          if(switch == 1'b1)
          begin
              if(key_down[21]== 1'd1)
              begin
                  note = 4'd1;
                  note1 = 4'd3;
              end
              else if (key_down[29]== 1'd1)
              begin
                  note = 4'd2;
                  note1 = 4'd4;
              end
              else if (key_down[36]== 1'd1)
              begin
                   note = 4'd3;
                   note1 = 4'd5;
              end
              else if (key_down[45]== 1'd1)
              begin
                    note = 4'd4;
                    note1 = 4'd6;
              end
              else if (key_down[44]== 1'd1)
              begin
                    note = 4'd5;
                    note1 = 4'd7;
              end
              else if (key_down[53]== 1'd1)
              begin
                    note = 4'd6;
                    note1 = 4'd8;
              end
              else if (key_down[60]== 1'd1)
              begin
                     note = 4'd7;
                     note1 = 4'd9;
              end
              else if (key_down[28]== 1'd1)
              begin
                     note = 4'd8;
                     note1 = 4'd10;
              end
              else if (key_down[27]== 1'd1)
              begin
                     note = 4'd9;
                     note1 = 4'd11;
              end
              else if (key_down[35]== 1'd1)
              begin
                    note = 4'd10;
                    note1 = 4'd12;
              end
              else if (key_down[43]== 1'd1)
              begin
                    note = 4'd11;
                    note1 = 4'd13;
              end     
              else if (key_down[52]== 1'd1)
              begin
                    note = 4'd12;
                    note1 = 4'd14;
              end
              else if (key_down[51]== 1'd1)
              begin
                    note = 4'd13;
                    note1 = 4'd11;
              end    
              else if (key_down[59]== 1'd1)
              begin
                    note = 4'd14;
                    note1 = 4'd12;
              end        
              else 
              begin
                    note = 4'd0;
                    note1 = 4'd0;
              end
          end
          else
          begin
          if(key_down[21]== 1'd1)
               begin
                     note = 4'd1;
                     note1 = 4'd1;
               end
               else if (key_down[29]== 1'd1)
               begin
                     note = 4'd2;
                     note1 = 4'd2;
               end
               else if (key_down[36]== 1'd1)
               begin
                     note = 4'd3;
                     note1 = 4'd3;
               end
               else if (key_down[45]== 1'd1)
               begin
                     note = 4'd4;
                     note1 = 4'd4;
               end
               else if (key_down[44]== 1'd1)
               begin
                     note = 4'd5;
                     note1 = 4'd5;
               end
               else if (key_down[53]== 1'd1)
               begin
                      note = 4'd6;
                      note1 = 4'd6;
               end
               else if (key_down[60]== 1'd1)
               begin
                      note = 4'd7;
                      note1 = 4'd7;
               end
               else if (key_down[28]== 1'd1)
               begin
                      note = 4'd8;
                      note1 = 4'd8;
               end
               else if (key_down[27]== 1'd1)
               begin
                      note = 4'd9;
                      note1 = 4'd9;
               end
               else if (key_down[35]== 1'd1)
               begin
                      note = 4'd10;
                      note1 = 4'd10;
               end
               else if (key_down[43]== 1'd1)
               begin
                      note = 4'd11;
                      note1 = 4'd11;
               end     
               else if (key_down[52]== 1'd1)
               begin
                      note = 4'd12;
                      note1 = 4'd12;
               end
               else if (key_down[51]== 1'd1)
               begin
                      note = 4'd13;
                      note1 = 4'd13;
               end    
               else if (key_down[59]== 1'd1)
               begin
                      note = 4'd14;
                      note1 = 4'd14;
               end        
               else 
               begin
                      note = 4'd0;
                      note1 = 4'd0;
               end
            end
        end       
           
           
      KeyboardDecoder U0(
                  .key_down(key_down),
                  .last_change(last_change),
                  .key_valid(key_valid),
                  .PS2_DATA(PS2_DATA),
                  .PS2_CLK(PS2_CLK),
                  .rst(rst),
                  .clk(clk)
                  );
                  
      Frequency_Divider U1(
                  .clk_ctl(clk_ctl), 
                  .clk(clk), 
                  .rst_n(~rst) 
                  );                 
                  
                  
      Hexa_deci U2(
                 .last_change(last_change),
                 .BCD(BCD)
                  );           
          
          
          
          
          
      note U3(
                .audio_l(audio_l),
                .audio_r(audio_r),
                .note(note),
                .note1(note1),
                .level(4'd5),
                .clk(clk),
                .rst_n(~rst)
                );    
                             
      speaker U4(
                .mclk (mclk), 
                .lrclk(lrclk), // right_left clk
                .sclk(sclk),//serial clk
                .sdin(sdin), 
                .audio_l(audio_l),
                .audio_r(audio_r), 
                .clk(clk),
                .rst_n(~rst)
                 );        
          
          
      scan_ctl U5(
                .scan_ctl(scan_ctl), 
                .ssd_in(ssd_in),
                .in0(4'd0), 
                .in1(4'd0), 
                .in2(4'd0), 
                .in3(BCD),  
                .ssd_ctl_en(clk_ctl) 
                 );    
                 
                 
      Display U6(
                .ssd_in(ssd_in),
                .segs(segs)
                 );             
      endmodule

