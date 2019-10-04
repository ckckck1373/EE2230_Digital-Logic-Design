`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/03/15 20:43:45
// Design Name: 
// Module Name: Display
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
// define segment codes
`define SS_0 8'b00000011
`define SS_1 8'b10011111
`define SS_2 8'b00100101
`define SS_3 8'b00001101
`define SS_4 8'b10011001
`define SS_5 8'b01001001
`define SS_6 8'b01000001
`define SS_7 8'b00011111
`define SS_8 8'b00000001
`define SS_9 8'b00001001
`define SS_F 8'b01110001
module Display(
    input [3:0]b,
    output reg [7:0] d
    );
always @*
      case (b)
        4'd0: d= `SS_0;
        4'd1: d = `SS_1;
        4'd2: d = `SS_2;
        4'd3: d = `SS_3;
        4'd4: d = `SS_4;
        4'd5: d = `SS_5;
        4'd6: d = `SS_6;
        4'd7: d = `SS_7;
        4'd8: d = `SS_8;
        4'd9: d = `SS_9;
        default: d = `SS_9;
      endcase

          
endmodule
