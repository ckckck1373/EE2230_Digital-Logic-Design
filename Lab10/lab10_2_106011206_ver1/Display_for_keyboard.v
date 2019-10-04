`timescale 1ns / 1ps


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

`define SS_c 8'b11100101
`define SS_d 8'b10000101
`define SS_e 8'b00100001
`define SS_f 8'b01110001
`define SS_g 8'b00001001
`define SS_a 8'b01000001
`define SS_b 8'b11000001
`define SS_C 8'b01100010
`define SS_D 8'b00000010
`define SS_E 8'b01100000
`define SS_F 8'b01110000
`define SS_G 8'b01000010
`define SS_A 8'b00010000
`define SS_B 8'b00000000

module Display(
    input [3:0]ssd_in,
    output reg [7:0] segs
    );
    
always @*
    begin
      case (ssd_in)
        `c: segs= `SS_c;
        `d: segs = `SS_d;
        `e: segs = `SS_e;
        `f: segs = `SS_f;
        `g: segs = `SS_g;
        `a: segs = `SS_a;
        `b: segs = `SS_b;
        `C: segs = `SS_C;
        `D: segs = `SS_D;
        `E: segs = `SS_E;
        `F: segs = `SS_F;
        `G: segs = `SS_G;
        `A: segs = `SS_A;
        `B: segs = `SS_B;
        default: segs = 8'b11111111;
        endcase
   end
        
endmodule
