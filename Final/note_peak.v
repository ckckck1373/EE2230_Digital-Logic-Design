`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/05/06 16:05:21
// Design Name: 
// Module Name: note_peak
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


module note_peak(
    clk,
    rst_n,
    clk_20,
    note_1,
    note_2,
    dead,
    kp_down,
    kp_jump
    
    
    );
    input kp_jump, kp_down; 
    input dead;
    input clk_20;
    input clk;
    input rst_n;
    output reg [11:0]note_1;
    output reg [11:0]note_2;
    reg [11:0] note1_next,note1_next,note2_next,note2_next, note1_store, note2_store;
    reg A,A_tmp;
   
    
    
    always @(posedge clk_20)    ////there and back
    begin 
       if(dead==0 && note_1>=650)
            begin
                note1_next = 1;
                note2_next = 1;
                A_tmp=0;

            end
        else if (dead==1 && note_1<=640)
        begin
            note1_next = 650;
            note2_next = 650;
            A_tmp=0;

        end
        
        else if (kp_jump==1&& note_1<=640)
        begin
            note1_next = 642;
            note2_next = 642;
            note1_store = note_1;
            note2_store = note_2;            
        end 
        
        else if (note_1==645)
        begin
            note1_next = note1_store+4;
            note2_next = note2_store+4;
        end
        
        else if (kp_down==1&& note_1<=640)
        begin
            note1_next = 646;
            note2_next = 646;
            note1_store = note_1;
            note2_store = note_2;            
        end 
        
        else if (note_1==649)
        begin
            note1_next = note1_store+4;
            note2_next = note2_store+4;
        end     
    
        else if(note_1 == 12'd640 && note_2 == 12'd640)
        begin
            note1_next = 1;
            note2_next = 1;
            A_tmp=0;
 
        end    


        else if(note_1 == 12'd128 && A==1)
        begin
            note1_next = 129;    
            note2_next = 129; 
            A_tmp=0;

        end
        else if(note_1 == 12'd128 && A==0)
        begin
            note1_next = 1;
            note2_next = 1;
            A_tmp=1;    

        end                                   
       
       
        else 
            note1_next = note_1+1;
            note2_next = note_2+1;          
    end 
    

 
always @(posedge clk or negedge rst_n)
      if (~rst_n)
      begin
        note_1 <= 0;
        note_2 <= 0;
        A<=0;

      end  
      else
      begin
        note_1 <= note1_next; 
        note_2 <= note1_next;
        A <=  A_tmp;

      end     
endmodule
