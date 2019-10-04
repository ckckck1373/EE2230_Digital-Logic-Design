`timescale 1ns / 1ps


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
`define SS_A 8'b00010001
`define SS_S 8'b11111101
`define SS_M 8'b10010001
`define SS_Ne 8'b11111101



module Display_for_keyboard(
    input [3:0]ssd_in,
    output reg [7:0] ssd_ctl
    );
    
always @*
    begin
      case (ssd_in)
        4'd0: ssd_ctl= `SS_0;
        4'd1: ssd_ctl = `SS_1;
        4'd2: ssd_ctl = `SS_2;
        4'd3: ssd_ctl = `SS_3;
        4'd4: ssd_ctl = `SS_4;
        4'd5: ssd_ctl = `SS_5;
        4'd6: ssd_ctl = `SS_6;
        4'd7: ssd_ctl = `SS_7;
        4'd8: ssd_ctl = `SS_8;
        4'd9: ssd_ctl = `SS_9;
        4'd10: ssd_ctl = `SS_A;
        4'd11: ssd_ctl = `SS_M;
        4'd12: ssd_ctl = `SS_S;
        4'd15: ssd_ctl = `SS_Ne;
        default: ssd_ctl = 8'b11111111;
        endcase
   end
             
endmodule
