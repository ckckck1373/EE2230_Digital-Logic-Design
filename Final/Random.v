`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/06/07 20:26:57
// Design Name: 
// Module Name: Random
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


module Random(
    input clk,
    output reg [6:0] out
    );
    
    reg [20:0] random;
    initial random = ~(20'b0);
    reg [20:0] random_next;
    wire feedback;
    
    // continue looping
    assign feedback = random [20] ^ random [17];
    
    always@*
    begin
        random_next = {random[19:0], feedback};
    end
    always@(posedge clk)
    begin
        random <= random_next;
        out <= random [6:0];      
    end
endmodule
