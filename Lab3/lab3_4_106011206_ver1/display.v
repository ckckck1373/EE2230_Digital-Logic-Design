// define segment codes
`define SS_N 8'b11010101
`define SS_T 8'b11100001
`define SS_H 8'b10010001
`define SS_U 8'b10000011
`define SS_E 8'b01100001
`define SS_F 8'b01110001


module display(
    output reg[7:0] segs,
    input [3:0] i
    );

 

always @*
    begin
        case(i)
            4'd0 : segs = `SS_N;
            4'd1 : segs = `SS_T;
            4'd2 : segs = `SS_H;
            4'd3 : segs = `SS_U;
            4'd4 : segs = `SS_E;
            default: segs = `SS_F;
        endcase
    end
endmodule