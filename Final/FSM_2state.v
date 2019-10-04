`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/06/07 21:51:43
// Design Name: 
// Module Name: FSM_2state
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


module FSM_2state(
    input clk,
    input rst_n,
    input in,
    output reg state
    );
    
    reg next_state;
    
    always@*
        case(state)
            1'b0:
            if(in)
                next_state = 1'b1;
            else
                next_state = 1'b0;
            1'b1:
            if(in)
                next_state = 1'b0;
            else
                next_state = 1'b1;
            default:
            begin
                next_state = 1'b0;
            end
         endcase
         
         
    always@(posedge clk or negedge rst_n)
     if(~rst_n)
        state <= 1'b0;
     else
        state <= next_state;
       
endmodule
