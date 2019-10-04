module mem_addr_gen(
  input clk,
  input rst,
  input [9:0] h_cnt,
  input [9:0] v_cnt,
  input en_scroll,
  output [16:0] pixel_addr
);
    
reg [7:0] position;

assign pixel_addr = ((h_cnt>>1)+320*(v_cnt>>1)+ position*320 )% 76800;  //640*480 --> 320*240 

always @ (posedge clk or posedge rst) 
begin
  if(rst | position > 8'd239)
    position <= 0;
  else if(en_scroll ==1'b1)
    position <= position + 1'b1;
  else 
    position <= position;
end
    






endmodule