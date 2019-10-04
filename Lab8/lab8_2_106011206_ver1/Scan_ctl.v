`timescale 1ns / 1ps
module scan_ctl(
output reg[3:0]scan_ctl, 
output reg [3:0]ssd_in,
input [3:0] in0, 
input [3:0] in1, 
input [3:0] in2, 
input [3:0] in3,  
input [1:0] ssd_ctl_en 
);
 

always @(ssd_ctl_en)
  case (ssd_ctl_en)
    2'b00: 
    begin
      scan_ctl= 4'b0111;
      ssd_in=in0;
    end
    2'b01: 
    begin
     scan_ctl= 4'b1011;
      ssd_in=in1;
    end
    2'b10: 
    begin
      scan_ctl= 4'b1101;
      ssd_in=in2;
    end
    2'b11: 
    begin
     scan_ctl= 4'b1110;
      ssd_in=in3;
    end
    default: 
    begin
      scan_ctl= 4'b1111;
      ssd_in=in0;
    end
  endcase

endmodule
