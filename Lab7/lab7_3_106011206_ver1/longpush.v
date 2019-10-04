`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/04/22 13:38:54
// Design Name: 
// Module Name: longpush
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


module longpush(
    input clk,
    input rst_n,
    input button,
    output reg longpush

    );
    
    reg state;
    
    always @(posedge clk or negedge rst_n)
    begin
        if(rst_n==0)
            state <= 1'b0;
        else
            state <= button;
            longpush <= state & button;
    end
endmodule
