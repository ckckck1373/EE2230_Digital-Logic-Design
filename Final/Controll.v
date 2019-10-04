`timescale 1ns / 1ps


module Controll(
    input clk,
    input jump,
    input pause,
    input restart,
    input dead,
    output reg reset,
    output reg enable
 );
    
    reg [3:0] state;
    
    localparam S0=4'b0001,S1=4'b0010,S2=4'b0100,S3=4'b1000;
    
    
    initial 
    begin
        state = S0;
        reset = 1'b1;
        enable = 1'b0;
    end
    
    
    always@(posedge clk)
    begin
        case(state)
            S0: //initial state
            begin
                reset = 1'b1;
                enable = 1'b0;
                if(jump)state = S1;
                else state = state;
            end
            S1: //  playing state
            begin
                reset = 1'b0;
                enable = 1'b1;
                if(pause)state = S2;
                else if(dead)state=S3;
                else if(restart) state = S0;
                else state = state;
            end
            S2: // pause state
            begin
                reset = 1'b0; 
                enable = 1'b0;
                if(pause) state = S1;
                else if(restart)state = S0;
                else state = state;
            end
            S3: // hero dead state
            begin
                reset = 1'b0;
                enable = 1'b0;
                if(jump||restart)state = S0;
                else state = state;
            end
            default:
            begin
                reset = 1'b1;
                enable = 1'b0;
                if(jump)state = S1;
                else state = state;
            end
            endcase
    end
    
    endmodule