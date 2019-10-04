`define A 8'd160

module pixel_gen(
  input [9:0] h_cnt,
  input [9:0] v_cnt,
  input valid,
  input [3:0] digit3,
  input [3:0] digit2,
  input [3:0] digit1,
  input [3:0] digit0,
  input [1:0]clk_ctl,
  input  clk,
  output reg [3:0] vgaRed,
  output reg [3:0] vgaGreen,
  output reg [3:0] vgaBlue
);
   
   
   wire [9:0]h_cnt,v_cnt;
   reg [1:0]en;
   
  always @(clk)
   begin
   case(en)
   2'b00:
   begin
  case (digit3)
   4'd15:
  begin 
     if(h_cnt < 100 & h_cnt > 70 & v_cnt < 210 & v_cnt > 205  )
          {vgaRed, vgaGreen, vgaBlue} = 12'h000;
     else if(h_cnt < 100 & h_cnt > 95 & v_cnt < 240 & v_cnt > 210  )
          {vgaRed, vgaGreen, vgaBlue} = 12'h000;
     else if(h_cnt < 100 & h_cnt > 95 & v_cnt < 270 & v_cnt > 240  )
          {vgaRed, vgaGreen, vgaBlue} = 12'h000;
     else if(h_cnt < 100 & h_cnt > 70 & v_cnt < 270 & v_cnt > 265  )
          {vgaRed, vgaGreen, vgaBlue} = 12'h000;              
     else if(h_cnt < 75 & h_cnt > 70 & v_cnt < 270 & v_cnt > 240  )
          {vgaRed, vgaGreen, vgaBlue} = 12'h000;
     else if(h_cnt < 75 & h_cnt > 70 & v_cnt < 240 & v_cnt > 210  )
          {vgaRed, vgaGreen, vgaBlue} = 12'h000;
     else if(h_cnt < 100 & h_cnt > 70 & v_cnt < 243 & v_cnt >  238 )
          {vgaRed, vgaGreen, vgaBlue} = 12'hfff;      
     else
          {vgaRed, vgaGreen, vgaBlue} = 12'h0;
   end
  4'd0: 
  begin 
     if(h_cnt < 100 & h_cnt > 70 & v_cnt < 210 & v_cnt > 205  )
          {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
     else if(h_cnt < 100 & h_cnt > 95 & v_cnt < 240 & v_cnt > 210  )
          {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
     else if(h_cnt < 100 & h_cnt > 95 & v_cnt < 270 & v_cnt > 240  )
          {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
     else if(h_cnt < 100 & h_cnt > 70 & v_cnt < 270 & v_cnt > 265  )
          {vgaRed, vgaGreen, vgaBlue} = 12'hfff;              
     else if(h_cnt < 75 & h_cnt > 70 & v_cnt < 270 & v_cnt > 240  )
          {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
     else if(h_cnt < 75 & h_cnt > 70 & v_cnt < 240 & v_cnt > 210  )
          {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
     else if(h_cnt < 100 & h_cnt > 70 & v_cnt < 243 & v_cnt >  238 )
          {vgaRed, vgaGreen, vgaBlue} = 12'h000;      
     else
          {vgaRed, vgaGreen, vgaBlue} = 12'h0;
   end
  4'd1: 
   begin 
      if(h_cnt < 100 & h_cnt > 70 & v_cnt < 210 & v_cnt > 205  )
           {vgaRed, vgaGreen, vgaBlue} = 12'h000;
      else if(h_cnt < 100 & h_cnt > 95 & v_cnt < 240 & v_cnt > 210  )
           {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
      else if(h_cnt < 100 & h_cnt > 95 & v_cnt < 270 & v_cnt > 240  )
           {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
      else if(h_cnt < 100 & h_cnt > 70 & v_cnt < 270 & v_cnt > 265  )
           {vgaRed, vgaGreen, vgaBlue} = 12'h000;              
      else if(h_cnt < 75 & h_cnt > 70 & v_cnt < 270 & v_cnt > 240  )
           {vgaRed, vgaGreen, vgaBlue} = 12'h000;
      else if(h_cnt < 75 & h_cnt > 70 & v_cnt < 240 & v_cnt > 210  )
           {vgaRed, vgaGreen, vgaBlue} = 12'h000;
      else if(h_cnt < 100 & h_cnt > 70 & v_cnt < 243 & v_cnt >  238 )
           {vgaRed, vgaGreen, vgaBlue} = 12'h000; 
      else
           {vgaRed, vgaGreen, vgaBlue} = 12'h0;
    end
  4'd2: 
   begin 
      if(h_cnt < 100 & h_cnt > 70 & v_cnt < 210 & v_cnt > 205  )
            {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
      else if(h_cnt < 100 & h_cnt > 95 & v_cnt < 240 & v_cnt > 210  )
            {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
      else if(h_cnt < 100 & h_cnt > 95 & v_cnt < 270 & v_cnt > 240  )
            {vgaRed, vgaGreen, vgaBlue} = 12'h000;
      else if(h_cnt < 100 & h_cnt > 70 & v_cnt < 270 & v_cnt > 265  )
            {vgaRed, vgaGreen, vgaBlue} = 12'hfff;              
      else if(h_cnt < 75 & h_cnt > 70 & v_cnt < 270 & v_cnt > 240  )
            {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
      else if(h_cnt < 75 & h_cnt > 70 & v_cnt < 240 & v_cnt > 210  )
            {vgaRed, vgaGreen, vgaBlue} = 12'h000;
      else if(h_cnt < 100 & h_cnt > 70 & v_cnt < 243 & v_cnt >  238 )
            {vgaRed, vgaGreen, vgaBlue} = 12'hfff; 
      else
            {vgaRed, vgaGreen, vgaBlue} = 12'h0;
      end
  4'd3: 
     begin 
      if(h_cnt < 100 & h_cnt > 70 & v_cnt < 210 & v_cnt > 205  )
            {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
      else if(h_cnt < 100 & h_cnt > 95 & v_cnt < 240 & v_cnt > 210  )
            {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
      else if(h_cnt < 100 & h_cnt > 95 & v_cnt < 270 & v_cnt > 240  )
            {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
      else if(h_cnt < 100 & h_cnt > 70 & v_cnt < 270 & v_cnt > 265  )
            {vgaRed, vgaGreen, vgaBlue} = 12'hfff;              
      else if(h_cnt < 75 & h_cnt > 70 & v_cnt < 270 & v_cnt > 240  )
            {vgaRed, vgaGreen, vgaBlue} = 12'h000;
      else if(h_cnt < 75 & h_cnt > 70 & v_cnt < 240 & v_cnt > 210  )
            {vgaRed, vgaGreen, vgaBlue} = 12'h000;
      else if(h_cnt < 100 & h_cnt > 70 & v_cnt < 243 & v_cnt >  238 )
            {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
      else
            {vgaRed, vgaGreen, vgaBlue} = 12'h000;
      end
  4'd4: 
      begin 
      if(h_cnt < 100 & h_cnt > 70 & v_cnt < 210 & v_cnt > 205  )
            {vgaRed, vgaGreen, vgaBlue} = 12'h000;
      else if(h_cnt < 100 & h_cnt > 95 & v_cnt < 240 & v_cnt > 210  )
            {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
      else if(h_cnt < 100 & h_cnt > 95 & v_cnt < 270 & v_cnt > 240  )
            {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
      else if(h_cnt < 100 & h_cnt > 70 & v_cnt < 270 & v_cnt > 265  )
            {vgaRed, vgaGreen, vgaBlue} = 12'h000;              
      else if(h_cnt < 75 & h_cnt > 70 & v_cnt < 270 & v_cnt > 240  )
            {vgaRed, vgaGreen, vgaBlue} = 12'h000;
      else if(h_cnt < 75 & h_cnt > 70 & v_cnt < 240 & v_cnt > 210  )
            {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
      else if(h_cnt < 100 & h_cnt > 70 & v_cnt < 243 & v_cnt >  238 )
            {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
      else
            {vgaRed, vgaGreen, vgaBlue} = 12'h000;
      end
 4'd5: 
      begin 
      if(h_cnt < 100 & h_cnt > 70 & v_cnt < 210 & v_cnt > 205  )
            {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
      else if(h_cnt < 100 & h_cnt > 95 & v_cnt < 240 & v_cnt > 210  )
            {vgaRed, vgaGreen, vgaBlue} = 12'h000;
      else if(h_cnt < 100 & h_cnt > 95 & v_cnt < 270 & v_cnt > 240  )
            {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
      else if(h_cnt < 100 & h_cnt > 70 & v_cnt < 270 & v_cnt > 265  )
            {vgaRed, vgaGreen, vgaBlue} = 12'hfff;              
      else if(h_cnt < 75 & h_cnt > 70 & v_cnt < 270 & v_cnt > 240  )
            {vgaRed, vgaGreen, vgaBlue} = 12'h000;
      else if(h_cnt < 75 & h_cnt > 70 & v_cnt < 240 & v_cnt > 210  )
            {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
      else if(h_cnt < 100 & h_cnt > 70 & v_cnt < 243 & v_cnt >  238 )
            {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
      else
            {vgaRed, vgaGreen, vgaBlue} = 12'h000;
      end
 4'd6: 
      begin 
      if(h_cnt < 100 & h_cnt > 70 & v_cnt < 210 & v_cnt > 205  )
           {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
      else if(h_cnt < 100 & h_cnt > 95 & v_cnt < 240 & v_cnt > 210  )
           {vgaRed, vgaGreen, vgaBlue} = 12'h000;
      else if(h_cnt < 100 & h_cnt > 95 & v_cnt < 270 & v_cnt > 240  )
           {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
      else if(h_cnt < 100 & h_cnt > 70 & v_cnt < 270 & v_cnt > 265  )
           {vgaRed, vgaGreen, vgaBlue} = 12'hfff;              
      else if(h_cnt < 75 & h_cnt > 70 & v_cnt < 270 & v_cnt > 240  )
           {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
      else if(h_cnt < 75 & h_cnt > 70 & v_cnt < 240 & v_cnt > 210  )
           {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
      else if(h_cnt < 100 & h_cnt > 70 & v_cnt < 243 & v_cnt >  238 )
           {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
      else
           {vgaRed, vgaGreen, vgaBlue} = 12'h000;
      end 
 4'd7: 
      begin 
      if(h_cnt < 100 & h_cnt > 70 & v_cnt < 210 & v_cnt > 205  )
            {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
      else if(h_cnt < 100 & h_cnt > 95 & v_cnt < 240 & v_cnt > 210  )
            {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
      else if(h_cnt < 100 & h_cnt > 95 & v_cnt < 270 & v_cnt > 240  )
            {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
      else if(h_cnt < 100 & h_cnt > 70 & v_cnt < 270 & v_cnt > 265  )
            {vgaRed, vgaGreen, vgaBlue} = 12'h000;              
      else if(h_cnt < 75 & h_cnt > 70 & v_cnt < 270 & v_cnt > 240  )
            {vgaRed, vgaGreen, vgaBlue} = 12'h000;
      else if(h_cnt < 75 & h_cnt > 70 & v_cnt < 240 & v_cnt > 210  )
            {vgaRed, vgaGreen, vgaBlue} = 12'h000;
      else if(h_cnt < 100 & h_cnt > 70 & v_cnt < 243 & v_cnt >  238 )
            {vgaRed, vgaGreen, vgaBlue} = 12'h000;
      else
            {vgaRed, vgaGreen, vgaBlue} = 12'h000;
      end 
 4'd8: 
      begin 
      if(h_cnt < 100 & h_cnt > 70 & v_cnt < 210 & v_cnt > 205  )
            {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
      else if(h_cnt < 100 & h_cnt > 95 & v_cnt < 240 & v_cnt > 210  )
            {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
      else if(h_cnt < 100 & h_cnt > 95 & v_cnt < 270 & v_cnt > 240  )
            {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
      else if(h_cnt < 100 & h_cnt > 70 & v_cnt < 270 & v_cnt > 265  )
            {vgaRed, vgaGreen, vgaBlue} = 12'hfff;              
      else if(h_cnt < 75 & h_cnt > 70 & v_cnt < 270 & v_cnt > 240  )
            {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
      else if(h_cnt < 75 & h_cnt > 70 & v_cnt < 240 & v_cnt > 210  )
            {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
      else if(h_cnt < 100 & h_cnt > 70 & v_cnt < 243 & v_cnt >  238 )
            {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
      else
            {vgaRed, vgaGreen, vgaBlue} = 12'h000;
      end    
 4'd9: 
      begin 
      if(h_cnt < 100 & h_cnt > 70 & v_cnt < 210 & v_cnt > 205  )
            {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
      else if(h_cnt < 100 & h_cnt > 95 & v_cnt < 240 & v_cnt > 210  )
            {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
      else if(h_cnt < 100 & h_cnt > 95 & v_cnt < 270 & v_cnt > 240  )
            {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
      else if(h_cnt < 100 & h_cnt > 70 & v_cnt < 270 & v_cnt > 265  )
            {vgaRed, vgaGreen, vgaBlue} = 12'hfff;              
      else if(h_cnt < 75 & h_cnt > 70 & v_cnt < 270 & v_cnt > 240  )
            {vgaRed, vgaGreen, vgaBlue} = 12'h000;
      else if(h_cnt < 75 & h_cnt > 70 & v_cnt < 240 & v_cnt > 210  )
            {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
      else if(h_cnt < 100 & h_cnt > 70 & v_cnt < 243 & v_cnt >  238 )
            {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
      else
            {vgaRed, vgaGreen, vgaBlue} = 12'h000;
     end     
  4'd10: 
      begin 
      if(h_cnt < 100 & h_cnt > 70 & v_cnt < 210 & v_cnt > 205  )
            {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
      else if(h_cnt < 100 & h_cnt > 95 & v_cnt < 240 & v_cnt > 210  )
            {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
      else if(h_cnt < 100 & h_cnt > 95 & v_cnt < 270 & v_cnt > 240  )
            {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
      else if(h_cnt < 100 & h_cnt > 70 & v_cnt < 270 & v_cnt > 265  )
            {vgaRed, vgaGreen, vgaBlue} = 12'h000;              
      else if(h_cnt < 75 & h_cnt > 70 & v_cnt < 270 & v_cnt > 240  )
            {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
      else if(h_cnt < 75 & h_cnt > 70 & v_cnt < 240 & v_cnt > 210  )
            {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
      else if(h_cnt < 100 & h_cnt > 70 & v_cnt < 243 & v_cnt >  238 )
            {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
      else
            {vgaRed, vgaGreen, vgaBlue} = 12'h000;
      end   
   4'd12: 
      begin 
      if(h_cnt < 100 & h_cnt > 70 & v_cnt < 210 & v_cnt > 205  )
           {vgaRed, vgaGreen, vgaBlue} = 12'h000;
      else if(h_cnt < 100 & h_cnt > 95 & v_cnt < 240 & v_cnt > 210  )
           {vgaRed, vgaGreen, vgaBlue} = 12'h000;
      else if(h_cnt < 100 & h_cnt > 95 & v_cnt < 270 & v_cnt > 240  )
           {vgaRed, vgaGreen, vgaBlue} = 12'h000;
      else if(h_cnt < 100 & h_cnt > 70 & v_cnt < 270 & v_cnt > 265  )
            {vgaRed, vgaGreen, vgaBlue} = 12'h000;              
      else if(h_cnt < 75 & h_cnt > 70 & v_cnt < 270 & v_cnt > 240  )
            {vgaRed, vgaGreen, vgaBlue} = 12'h000;
      else if(h_cnt < 75 & h_cnt > 70 & v_cnt < 240 & v_cnt > 210  )
            {vgaRed, vgaGreen, vgaBlue} = 12'h000;
      else if(h_cnt < 100 & h_cnt > 70 & v_cnt < 243 & v_cnt >  238 )
            {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
      else
            {vgaRed, vgaGreen, vgaBlue} = 12'h000;
      end  
    4'd11: 
     begin 
     if(h_cnt < 100 & h_cnt > 70 & v_cnt < 210 & v_cnt > 205  )
            {vgaRed, vgaGreen, vgaBlue} = 12'h000;
     else if(h_cnt < 100 & h_cnt > 95 & v_cnt < 240 & v_cnt > 210  )
            {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
     else if(h_cnt < 100 & h_cnt > 95 & v_cnt < 270 & v_cnt > 240  )
            {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
     else if(h_cnt < 100 & h_cnt > 70 & v_cnt < 270 & v_cnt > 265  )
            {vgaRed, vgaGreen, vgaBlue} = 12'h000;              
     else if(h_cnt < 75 & h_cnt > 70 & v_cnt < 270 & v_cnt > 240  )
            {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
     else if(h_cnt < 75 & h_cnt > 70 & v_cnt < 240 & v_cnt > 210  )
            {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
     else if(h_cnt < 100 & h_cnt > 70 & v_cnt < 243 & v_cnt >  238 )
            {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
     else
            {vgaRed, vgaGreen, vgaBlue} = 12'h000;
     end                      
 endcase
end

2'b01:
begin
 case (digit2)
 4'd15:
 begin 
    if(h_cnt < 100+`A & h_cnt > 70+`A & v_cnt < 210 & v_cnt > 205  )
         {vgaRed, vgaGreen, vgaBlue} = 12'h000;
    else if(h_cnt < 100+`A & h_cnt > 95+`A & v_cnt < 240 & v_cnt > 210  )
         {vgaRed, vgaGreen, vgaBlue} = 12'h000;
    else if(h_cnt < 100+`A & h_cnt > 95+`A & v_cnt < 270 & v_cnt > 240  )
         {vgaRed, vgaGreen, vgaBlue} = 12'h000;
    else if(h_cnt < 100+`A & h_cnt > 70+`A & v_cnt < 270 & v_cnt > 265  )
         {vgaRed, vgaGreen, vgaBlue} = 12'h000;              
    else if(h_cnt < 75+`A & h_cnt > 70+`A & v_cnt < 270 & v_cnt > 240  )
         {vgaRed, vgaGreen, vgaBlue} = 12'h000;
    else if(h_cnt < 75+`A & h_cnt > 70+`A & v_cnt < 240 & v_cnt > 210  )
         {vgaRed, vgaGreen, vgaBlue} = 12'h000;
    else if(h_cnt < 100+`A & h_cnt > 70+`A & v_cnt < 243 & v_cnt >  238 )
         {vgaRed, vgaGreen, vgaBlue} = 12'hfff;     
    else
         {vgaRed, vgaGreen, vgaBlue} = 12'h0;
  end
4'd0: 
begin 
   if(h_cnt < 100+`A & h_cnt > 70+`A & v_cnt < 210 & v_cnt > 205  )
        {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
   else if(h_cnt < 100+`A & h_cnt > 95+`A & v_cnt < 240 & v_cnt > 210  )
        {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
   else if(h_cnt < 100+`A & h_cnt > 95+`A & v_cnt < 270 & v_cnt > 240  )
        {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
   else if(h_cnt < 100+`A & h_cnt > 70+`A & v_cnt < 270 & v_cnt > 265  )
        {vgaRed, vgaGreen, vgaBlue} = 12'hfff;              
   else if(h_cnt < 75+`A & h_cnt > 70+`A & v_cnt < 270 & v_cnt > 240  )
        {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
   else if(h_cnt < 75+`A & h_cnt > 70+`A & v_cnt < 240 & v_cnt > 210  )
        {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
   else if(h_cnt < 100+`A & h_cnt > 70+`A & v_cnt < 243 & v_cnt >  238 )
        {vgaRed, vgaGreen, vgaBlue} = 12'h000;      
   else
        {vgaRed, vgaGreen, vgaBlue} = 12'h0;
 end
4'd1: 
 begin 
    if(h_cnt < 100+`A & h_cnt > 70+`A & v_cnt < 210 & v_cnt > 205  )
         {vgaRed, vgaGreen, vgaBlue} = 12'h000;
    else if(h_cnt < 100+`A  & h_cnt > 95+`A  & v_cnt < 240 & v_cnt > 210  )
         {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
    else if(h_cnt < 100+`A  & h_cnt > 95+`A  & v_cnt < 270 & v_cnt > 240  )
         {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
    else if(h_cnt < 100+`A & h_cnt > 70+`A  & v_cnt < 270 & v_cnt > 265  )
         {vgaRed, vgaGreen, vgaBlue} = 12'h000;              
    else if(h_cnt < 75+`A  & h_cnt > 70+`A  & v_cnt < 270 & v_cnt > 240  )
         {vgaRed, vgaGreen, vgaBlue} = 12'h000;
    else if(h_cnt < 75+`A  & h_cnt > 70+`A  & v_cnt < 240 & v_cnt > 210  )
         {vgaRed, vgaGreen, vgaBlue} = 12'h000;
    else if(h_cnt < 100+`A  & h_cnt > 70+`A  & v_cnt < 243 & v_cnt >  238 )
         {vgaRed, vgaGreen, vgaBlue} = 12'h000; 
    else
         {vgaRed, vgaGreen, vgaBlue} = 12'h0;
  end
4'd2: 
 begin 
    if(h_cnt < 100+`A  & h_cnt > 70+`A & v_cnt < 210 & v_cnt > 205  )
          {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
    else if(h_cnt < 100+`A & h_cnt > 95+`A & v_cnt < 240 & v_cnt > 210  )
          {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
    else if(h_cnt < 100+`A & h_cnt > 95+`A & v_cnt < 270 & v_cnt > 240  )
          {vgaRed, vgaGreen, vgaBlue} = 12'h000;
    else if(h_cnt < 100+`A & h_cnt > 70+`A & v_cnt < 270 & v_cnt > 265  )
          {vgaRed, vgaGreen, vgaBlue} = 12'hfff;              
    else if(h_cnt < 75+`A & h_cnt > 70+`A & v_cnt < 270 & v_cnt > 240  )
          {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
    else if(h_cnt < 75+`A & h_cnt > 70+`A & v_cnt < 240 & v_cnt > 210  )
          {vgaRed, vgaGreen, vgaBlue} = 12'h000;
    else if(h_cnt < 100+`A & h_cnt > 70+`A & v_cnt < 243 & v_cnt >  238 )
          {vgaRed, vgaGreen, vgaBlue} = 12'hfff; 
    else
          {vgaRed, vgaGreen, vgaBlue} = 12'h0;
    end
4'd3: 
   begin 
    if(h_cnt < 100+`A & h_cnt > 70+`A & v_cnt < 210 & v_cnt > 205  )
          {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
    else if(h_cnt < 100+`A & h_cnt > 95+`A & v_cnt < 240 & v_cnt > 210  )
          {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
    else if(h_cnt < 100+`A & h_cnt > 95+`A & v_cnt < 270 & v_cnt > 240  )
          {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
    else if(h_cnt < 100+`A & h_cnt > 70+`A & v_cnt < 270 & v_cnt > 265  )
          {vgaRed, vgaGreen, vgaBlue} = 12'hfff;              
    else if(h_cnt < 75+`A & h_cnt > 70+`A & v_cnt < 270 & v_cnt > 240  )
          {vgaRed, vgaGreen, vgaBlue} = 12'h000;
    else if(h_cnt < 75+`A & h_cnt > 70+`A & v_cnt < 240 & v_cnt > 210  )
          {vgaRed, vgaGreen, vgaBlue} = 12'h000;
    else if(h_cnt < 100+`A & h_cnt > 70+`A & v_cnt < 243 & v_cnt >  238 )
          {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
    else
          {vgaRed, vgaGreen, vgaBlue} = 12'h000;
    end
4'd4: 
    begin 
    if(h_cnt < 100+`A & h_cnt > 70+`A & v_cnt < 210 & v_cnt > 205  )
          {vgaRed, vgaGreen, vgaBlue} = 12'h000;
    else if(h_cnt < 100+`A & h_cnt > 95+`A & v_cnt < 240 & v_cnt > 210  )
          {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
    else if(h_cnt < 100+`A & h_cnt > 95+`A & v_cnt < 270 & v_cnt > 240  )
          {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
    else if(h_cnt < 100+`A & h_cnt > 70+`A & v_cnt < 270 & v_cnt > 265  )
          {vgaRed, vgaGreen, vgaBlue} = 12'h000;              
    else if(h_cnt < 75+`A & h_cnt > 70+`A & v_cnt < 270 & v_cnt > 240  )
          {vgaRed, vgaGreen, vgaBlue} = 12'h000;
    else if(h_cnt < 75+`A & h_cnt > 70+`A & v_cnt < 240 & v_cnt > 210  )
          {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
    else if(h_cnt < 100+`A & h_cnt > 70+`A & v_cnt < 243 & v_cnt >  238 )
          {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
    else
          {vgaRed, vgaGreen, vgaBlue} = 12'h000;
    end
4'd5: 
    begin 
    if(h_cnt < 100+`A & h_cnt > 70+`A & v_cnt < 210 & v_cnt > 205  )
          {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
    else if(h_cnt < 100+`A & h_cnt > 95+`A & v_cnt < 240 & v_cnt > 210  )
          {vgaRed, vgaGreen, vgaBlue} = 12'h000;
    else if(h_cnt < 100+`A & h_cnt > 95+`A & v_cnt < 270 & v_cnt > 240  )
          {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
    else if(h_cnt < 100+`A & h_cnt > 70+`A & v_cnt < 270 & v_cnt > 265  )
          {vgaRed, vgaGreen, vgaBlue} = 12'hfff;              
    else if(h_cnt < 75+`A & h_cnt > 70+`A & v_cnt < 270 & v_cnt > 240  )
          {vgaRed, vgaGreen, vgaBlue} = 12'h000;
    else if(h_cnt < 75+`A & h_cnt > 70+`A & v_cnt < 240 & v_cnt > 210  )
          {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
    else if(h_cnt < 100+`A & h_cnt > 70+`A & v_cnt < 243 & v_cnt >  238 )
          {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
    else
          {vgaRed, vgaGreen, vgaBlue} = 12'h000;
    end
4'd6: 
    begin 
    if(h_cnt < 100+`A & h_cnt > 70+`A & v_cnt < 210 & v_cnt > 205  )
         {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
    else if(h_cnt < 100+`A & h_cnt > 95+`A & v_cnt < 240 & v_cnt > 210  )
         {vgaRed, vgaGreen, vgaBlue} = 12'h000;
    else if(h_cnt < 100+`A & h_cnt > 95+`A & v_cnt < 270 & v_cnt > 240  )
         {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
    else if(h_cnt < 100+`A & h_cnt > 70+`A & v_cnt < 270 & v_cnt > 265  )
         {vgaRed, vgaGreen, vgaBlue} = 12'hfff;              
    else if(h_cnt < 75+`A & h_cnt > 70+`A & v_cnt < 270 & v_cnt > 240  )
         {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
    else if(h_cnt < 75+`A & h_cnt > 70+`A & v_cnt < 240 & v_cnt > 210  )
         {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
    else if(h_cnt < 100+`A & h_cnt > 70+`A & v_cnt < 243 & v_cnt >  238 )
         {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
    else
         {vgaRed, vgaGreen, vgaBlue} = 12'h000;
    end 
4'd7: 
    begin 
    if(h_cnt < 100+`A & h_cnt > 70+`A & v_cnt < 210 & v_cnt > 205  )
          {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
    else if(h_cnt < 100+`A & h_cnt > 95+`A & v_cnt < 240 & v_cnt > 210  )
          {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
    else if(h_cnt < 100+`A & h_cnt > 95+`A & v_cnt < 270 & v_cnt > 240  )
          {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
    else if(h_cnt < 100+`A & h_cnt+`A > 70 & v_cnt < 270 & v_cnt > 265  )
          {vgaRed, vgaGreen, vgaBlue} = 12'h000;              
    else if(h_cnt < 75+`A & h_cnt > 70+`A & v_cnt < 270 & v_cnt > 240  )
          {vgaRed, vgaGreen, vgaBlue} = 12'h000;
    else if(h_cnt < 75+`A & h_cnt > 70+`A & v_cnt < 240 & v_cnt > 210  )
          {vgaRed, vgaGreen, vgaBlue} = 12'h000;
    else if(h_cnt < 100+`A & h_cnt > 70+`A & v_cnt < 243 & v_cnt >  238 )
          {vgaRed, vgaGreen, vgaBlue} = 12'h000;
    else
          {vgaRed, vgaGreen, vgaBlue} = 12'h000;
    end 
4'd8: 
    begin 
    if(h_cnt < 100+`A & h_cnt > 70+`A & v_cnt < 210 & v_cnt > 205  )
          {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
    else if(h_cnt < 100+`A & h_cnt > 95+`A & v_cnt < 240 & v_cnt > 210  )
          {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
    else if(h_cnt < 100+`A & h_cnt > 95+`A & v_cnt < 270 & v_cnt > 240  )
          {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
    else if(h_cnt < 100+`A & h_cnt > 70+`A & v_cnt < 270 & v_cnt > 265  )
          {vgaRed, vgaGreen, vgaBlue} = 12'hfff;              
    else if(h_cnt < 75+`A & h_cnt > 70+`A & v_cnt < 270 & v_cnt > 240  )
          {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
    else if(h_cnt < 75+`A & h_cnt > 70+`A & v_cnt < 240 & v_cnt > 210  )
          {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
    else if(h_cnt < 100+`A & h_cnt > 70+`A & v_cnt < 243 & v_cnt >  238 )
          {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
    else
          {vgaRed, vgaGreen, vgaBlue} = 12'h000;
    end    
4'd9: 
    begin 
    if(h_cnt < 100+`A & h_cnt > 70+`A & v_cnt < 210 & v_cnt > 205  )
          {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
    else if(h_cnt < 100+`A & h_cnt > 95+`A & v_cnt < 240 & v_cnt > 210  )
          {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
    else if(h_cnt < 100+`A & h_cnt > 95+`A & v_cnt < 270 & v_cnt > 240  )
          {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
    else if(h_cnt < 100+`A & h_cnt > 70+`A & v_cnt < 270 & v_cnt > 265  )
          {vgaRed, vgaGreen, vgaBlue} = 12'hfff;              
    else if(h_cnt < 75+`A & h_cnt > 70+`A & v_cnt < 270 & v_cnt > 240  )
          {vgaRed, vgaGreen, vgaBlue} = 12'h000;
    else if(h_cnt < 75+`A & h_cnt > 70+`A & v_cnt < 240 & v_cnt > 210  )
          {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
    else if(h_cnt < 100+`A & h_cnt > 70+`A & v_cnt < 243 & v_cnt >  238 )
          {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
    else
          {vgaRed, vgaGreen, vgaBlue} = 12'h000;
   end     
4'd10: 
    begin 
    if(h_cnt < 100+`A & h_cnt > 70+`A & v_cnt < 210 & v_cnt > 205  )
          {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
    else if(h_cnt < 100+`A & h_cnt > 95+`A & v_cnt < 240 & v_cnt > 210  )
          {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
    else if(h_cnt < 100+`A & h_cnt > 95+`A & v_cnt < 270 & v_cnt > 240  )
          {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
    else if(h_cnt < 100+`A & h_cnt > 70+`A & v_cnt < 270 & v_cnt > 265  )
          {vgaRed, vgaGreen, vgaBlue} = 12'h000;              
    else if(h_cnt < 75+`A & h_cnt > 70+`A & v_cnt < 270 & v_cnt > 240  )
          {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
    else if(h_cnt < 75+`A & h_cnt > 70+`A & v_cnt < 240 & v_cnt > 210  )
          {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
    else if(h_cnt < 100+`A & h_cnt > 70+`A & v_cnt < 243 & v_cnt >  238 )
          {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
    else
          {vgaRed, vgaGreen, vgaBlue} = 12'h000;
    end   
 4'd12: 
    begin 
    if(h_cnt < 100+`A & h_cnt > 70+`A & v_cnt < 210 & v_cnt > 205  )
         {vgaRed, vgaGreen, vgaBlue} = 12'h000;
    else if(h_cnt < 100+`A & h_cnt > 95+`A & v_cnt < 240 & v_cnt > 210  )
         {vgaRed, vgaGreen, vgaBlue} = 12'h000;
    else if(h_cnt < 100+`A & h_cnt > 95+`A & v_cnt < 270 & v_cnt > 240  )
         {vgaRed, vgaGreen, vgaBlue} = 12'h000;
    else if(h_cnt < 100+`A & h_cnt > 70+`A & v_cnt < 270 & v_cnt > 265  )
          {vgaRed, vgaGreen, vgaBlue} = 12'h000;              
    else if(h_cnt < 75+`A & h_cnt > 70+`A & v_cnt < 270 & v_cnt > 240  )
          {vgaRed, vgaGreen, vgaBlue} = 12'h000;
    else if(h_cnt < 75+`A & h_cnt > 70+`A & v_cnt < 240 & v_cnt > 210  )
          {vgaRed, vgaGreen, vgaBlue} = 12'h000;
    else if(h_cnt < 100+`A & h_cnt > 70+`A & v_cnt < 243 & v_cnt >  238 )
          {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
    else
          {vgaRed, vgaGreen, vgaBlue} = 12'h000;
    end  
  4'd11: 
   begin 
   if(h_cnt < 100+`A & h_cnt > 70+`A & v_cnt < 210 & v_cnt > 205  )
          {vgaRed, vgaGreen, vgaBlue} = 12'h000;
   else if(h_cnt < 100+`A & h_cnt > 95+`A & v_cnt < 240 & v_cnt > 210  )
          {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
   else if(h_cnt < 100+`A & h_cnt > 95+`A & v_cnt < 270 & v_cnt > 240  )
          {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
   else if(h_cnt < 100+`A & h_cnt > 70+`A & v_cnt < 270 & v_cnt > 265  )
          {vgaRed, vgaGreen, vgaBlue} = 12'h000;              
   else if(h_cnt < 75+`A & h_cnt > 70+`A & v_cnt < 270 & v_cnt > 240  )
          {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
   else if(h_cnt < 75+`A & h_cnt > 70+`A & v_cnt < 240 & v_cnt > 210  )
          {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
   else if(h_cnt < 100+`A & h_cnt > 70+`A & v_cnt < 243 & v_cnt >  238 )
          {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
   else
          {vgaRed, vgaGreen, vgaBlue} = 12'h000;
   end                   
endcase
end

2'b10:
begin
    case (digit1)
     4'd15:
    begin 
       if(h_cnt < 100+2*`A & h_cnt > 70+2*`A & v_cnt < 210 & v_cnt > 205  )
            {vgaRed, vgaGreen, vgaBlue} = 12'h000;
       else if(h_cnt < 100+2*`A & h_cnt > 95+2*`A & v_cnt < 240 & v_cnt > 210  )
            {vgaRed, vgaGreen, vgaBlue} = 12'h000;
       else if(h_cnt < 100+2*`A & h_cnt > 95+2*`A & v_cnt < 270 & v_cnt > 240  )
            {vgaRed, vgaGreen, vgaBlue} = 12'h000;
       else if(h_cnt < 100+2*`A & h_cnt > 70+2*`A & v_cnt < 270 & v_cnt > 265  )
            {vgaRed, vgaGreen, vgaBlue} = 12'h000;              
       else if(h_cnt < 75+2*`A & h_cnt > 70+2*`A & v_cnt < 270 & v_cnt > 240  )
            {vgaRed, vgaGreen, vgaBlue} = 12'h000;
       else if(h_cnt < 75+2*`A & h_cnt > 70+2*`A & v_cnt < 240 & v_cnt > 210  )
            {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
       else if(h_cnt < 100+2*`A & h_cnt > 70+2*`A & v_cnt < 243 & v_cnt >  238 )
            {vgaRed, vgaGreen, vgaBlue} = 12'h000;      
       else
            {vgaRed, vgaGreen, vgaBlue} = 12'h0;
     end
 4'd0: 
 begin 
    if(h_cnt < 100+2*`A & h_cnt > 70+2*`A & v_cnt < 210 & v_cnt > 205  )
         {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
    else if(h_cnt < 100+2*`A & h_cnt > 95+2*`A & v_cnt < 240 & v_cnt > 210  )
         {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
    else if(h_cnt < 100+2*`A & h_cnt > 95+2*`A & v_cnt < 270 & v_cnt > 240  )
         {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
    else if(h_cnt < 100+2*`A & h_cnt > 70+2*`A & v_cnt < 270 & v_cnt > 265  )
         {vgaRed, vgaGreen, vgaBlue} = 12'hfff;              
    else if(h_cnt < 75+2*`A & h_cnt > 70+2*`A & v_cnt < 270 & v_cnt > 240  )
         {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
    else if(h_cnt < 75+2*`A & h_cnt > 70+2*`A & v_cnt < 240 & v_cnt > 210  )
         {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
    else if(h_cnt < 100+2*`A & h_cnt > 70+2*`A & v_cnt < 243 & v_cnt >  238 )
         {vgaRed, vgaGreen, vgaBlue} = 12'h000;      
    else
         {vgaRed, vgaGreen, vgaBlue} = 12'h0;
  end
 4'd1: 
  begin 
     if(h_cnt < 100+2*`A & h_cnt > 70+2*`A & v_cnt < 210 & v_cnt > 205  )
          {vgaRed, vgaGreen, vgaBlue} = 12'h000;
     else if(h_cnt < 100+2*`A  & h_cnt > 95+2*`A  & v_cnt < 240 & v_cnt > 210  )
          {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
     else if(h_cnt < 100+2*`A  & h_cnt > 95+2*`A  & v_cnt < 270 & v_cnt > 240  )
          {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
     else if(h_cnt < 100+2*`A & h_cnt > 70+2*`A  & v_cnt < 270 & v_cnt > 265  )
          {vgaRed, vgaGreen, vgaBlue} = 12'h000;              
     else if(h_cnt < 75+2*`A  & h_cnt > 70+2*`A  & v_cnt < 270 & v_cnt > 240  )
          {vgaRed, vgaGreen, vgaBlue} = 12'h000;
     else if(h_cnt < 75+2*`A  & h_cnt > 70+2*`A  & v_cnt < 240 & v_cnt > 210  )
          {vgaRed, vgaGreen, vgaBlue} = 12'h000;
     else if(h_cnt < 100+2*`A  & h_cnt > 70+2*`A  & v_cnt < 243 & v_cnt >  238 )
          {vgaRed, vgaGreen, vgaBlue} = 12'h000; 
     else
          {vgaRed, vgaGreen, vgaBlue} = 12'h0;
   end
 4'd2: 
  begin 
     if(h_cnt < 100+2*`A  & h_cnt > 70+2*`A & v_cnt < 210 & v_cnt > 205  )
           {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
     else if(h_cnt < 100+2*`A & h_cnt > 95+2*`A & v_cnt < 240 & v_cnt > 210  )
           {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
     else if(h_cnt < 100+2*`A & h_cnt > 95+2*`A & v_cnt < 270 & v_cnt > 240  )
           {vgaRed, vgaGreen, vgaBlue} = 12'h000;
     else if(h_cnt < 100+2*`A & h_cnt > 70+2*`A & v_cnt < 270 & v_cnt > 265  )
           {vgaRed, vgaGreen, vgaBlue} = 12'hfff;              
     else if(h_cnt < 75+2*`A & h_cnt > 70+2*`A & v_cnt < 270 & v_cnt > 240  )
           {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
     else if(h_cnt < 75+2*`A & h_cnt > 70+2*`A & v_cnt < 240 & v_cnt > 210  )
           {vgaRed, vgaGreen, vgaBlue} = 12'h000;
     else if(h_cnt < 100+2*`A & h_cnt > 70+2*`A & v_cnt < 243 & v_cnt >  238 )
           {vgaRed, vgaGreen, vgaBlue} = 12'hfff; 
     else
           {vgaRed, vgaGreen, vgaBlue} = 12'h0;
     end
 4'd3: 
    begin 
     if(h_cnt < 100+2*`A & h_cnt > 70+2*`A & v_cnt < 210 & v_cnt > 205  )
           {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
     else if(h_cnt < 100+2*`A & h_cnt > 95+2*`A & v_cnt < 240 & v_cnt > 210  )
           {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
     else if(h_cnt < 100+2*`A & h_cnt > 95+2*`A & v_cnt < 270 & v_cnt > 240  )
           {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
     else if(h_cnt < 100+2*`A & h_cnt > 70+2*`A & v_cnt < 270 & v_cnt > 265  )
           {vgaRed, vgaGreen, vgaBlue} = 12'hfff;              
     else if(h_cnt < 75+2*`A & h_cnt > 70+2*`A & v_cnt < 270 & v_cnt > 240  )
           {vgaRed, vgaGreen, vgaBlue} = 12'h000;
     else if(h_cnt < 75+2*`A & h_cnt > 70+2*`A & v_cnt < 240 & v_cnt > 210  )
           {vgaRed, vgaGreen, vgaBlue} = 12'h000;
     else if(h_cnt < 100+2*`A & h_cnt > 70+2*`A & v_cnt < 243 & v_cnt >  238 )
           {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
     else
           {vgaRed, vgaGreen, vgaBlue} = 12'h000;
     end
 4'd4: 
     begin 
     if(h_cnt < 100+2*`A & h_cnt > 70+2*`A & v_cnt < 210 & v_cnt > 205  )
           {vgaRed, vgaGreen, vgaBlue} = 12'h000;
     else if(h_cnt < 100+2*`A & h_cnt > 95+2*`A & v_cnt < 240 & v_cnt > 210  )
           {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
     else if(h_cnt < 100+2*`A & h_cnt > 95+2*`A & v_cnt < 270 & v_cnt > 240  )
           {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
     else if(h_cnt < 100+2*`A & h_cnt > 70+2*`A & v_cnt < 270 & v_cnt > 265  )
           {vgaRed, vgaGreen, vgaBlue} = 12'h000;              
     else if(h_cnt < 75+2*`A & h_cnt > 70+2*`A & v_cnt < 270 & v_cnt > 240  )
           {vgaRed, vgaGreen, vgaBlue} = 12'h000;
     else if(h_cnt < 75+2*`A & h_cnt > 70+2*`A & v_cnt < 240 & v_cnt > 210  )
           {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
     else if(h_cnt < 100+2*`A & h_cnt > 70+2*`A & v_cnt < 243 & v_cnt >  238 )
           {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
     else
           {vgaRed, vgaGreen, vgaBlue} = 12'h000;
     end
4'd5: 
     begin 
     if(h_cnt < 100+2*`A & h_cnt > 70+2*`A & v_cnt < 210 & v_cnt > 205  )
           {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
     else if(h_cnt < 100+2*`A & h_cnt > 95+2*`A & v_cnt < 240 & v_cnt > 210  )
           {vgaRed, vgaGreen, vgaBlue} = 12'h000;
     else if(h_cnt < 100+2*`A & h_cnt > 95+2*`A & v_cnt < 270 & v_cnt > 240  )
           {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
     else if(h_cnt < 100+2*`A & h_cnt > 70+2*`A & v_cnt < 270 & v_cnt > 265  )
           {vgaRed, vgaGreen, vgaBlue} = 12'hfff;              
     else if(h_cnt < 75+2*`A & h_cnt > 70+2*`A & v_cnt < 270 & v_cnt > 240  )
           {vgaRed, vgaGreen, vgaBlue} = 12'h000;
     else if(h_cnt < 75+2*`A & h_cnt > 70+2*`A & v_cnt < 240 & v_cnt > 210  )
           {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
     else if(h_cnt < 100+2*`A & h_cnt > 70+2*`A & v_cnt < 243 & v_cnt >  238 )
           {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
     else
           {vgaRed, vgaGreen, vgaBlue} = 12'h000;
     end
4'd6: 
     begin 
     if(h_cnt < 100+2*`A & h_cnt > 70+2*`A & v_cnt < 210 & v_cnt > 205  )
          {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
     else if(h_cnt < 100+2*`A & h_cnt > 95+2*`A & v_cnt < 240 & v_cnt > 210  )
          {vgaRed, vgaGreen, vgaBlue} = 12'h000;
     else if(h_cnt < 100+2*`A & h_cnt > 95+2*`A & v_cnt < 270 & v_cnt > 240  )
          {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
     else if(h_cnt < 100+2*`A & h_cnt > 70+2*`A & v_cnt < 270 & v_cnt > 265  )
          {vgaRed, vgaGreen, vgaBlue} = 12'hfff;              
     else if(h_cnt < 75+2*`A & h_cnt > 70+2*`A & v_cnt < 270 & v_cnt > 240  )
          {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
     else if(h_cnt < 75+2*`A & h_cnt > 70+2*`A & v_cnt < 240 & v_cnt > 210  )
          {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
     else if(h_cnt < 100+2*`A & h_cnt > 70+2*`A & v_cnt < 243 & v_cnt >  238 )
          {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
     else
          {vgaRed, vgaGreen, vgaBlue} = 12'h000;
     end 
4'd7: 
     begin 
     if(h_cnt < 100+2*`A & h_cnt > 70+2*`A & v_cnt < 210 & v_cnt > 205  )
           {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
     else if(h_cnt < 100+2*`A & h_cnt > 95+2*`A & v_cnt < 240 & v_cnt > 210  )
           {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
     else if(h_cnt < 100+2*`A & h_cnt > 95+2*`A & v_cnt < 270 & v_cnt > 240  )
           {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
     else if(h_cnt < 100+2*`A & h_cnt+2*`A > 70 & v_cnt < 270 & v_cnt > 265  )
           {vgaRed, vgaGreen, vgaBlue} = 12'h000;              
     else if(h_cnt < 75+2*`A & h_cnt > 70+2*`A & v_cnt < 270 & v_cnt > 240  )
           {vgaRed, vgaGreen, vgaBlue} = 12'h000;
     else if(h_cnt < 75+2*`A & h_cnt > 70+2*`A & v_cnt < 240 & v_cnt > 210  )
           {vgaRed, vgaGreen, vgaBlue} = 12'h000;
     else if(h_cnt < 100+2*`A & h_cnt > 70+2*`A & v_cnt < 243 & v_cnt >  238 )
           {vgaRed, vgaGreen, vgaBlue} = 12'h000;
     else
           {vgaRed, vgaGreen, vgaBlue} = 12'h000;
     end 
4'd8: 
     begin 
     if(h_cnt < 100+2*`A & h_cnt > 70+2*`A & v_cnt < 210 & v_cnt > 205  )
           {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
     else if(h_cnt < 100+2*`A & h_cnt > 95+2*`A & v_cnt < 240 & v_cnt > 210  )
           {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
     else if(h_cnt < 100+2*`A & h_cnt > 95+2*`A & v_cnt < 270 & v_cnt > 240  )
           {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
     else if(h_cnt < 100+2*`A & h_cnt > 70+2*`A & v_cnt < 270 & v_cnt > 265  )
           {vgaRed, vgaGreen, vgaBlue} = 12'hfff;              
     else if(h_cnt < 75+2*`A & h_cnt > 70+2*`A & v_cnt < 270 & v_cnt > 240  )
           {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
     else if(h_cnt < 75+2*`A & h_cnt > 70+2*`A & v_cnt < 240 & v_cnt > 210  )
           {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
     else if(h_cnt < 100+2*`A & h_cnt > 70+2*`A & v_cnt < 243 & v_cnt >  238 )
           {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
     else
           {vgaRed, vgaGreen, vgaBlue} = 12'h000;
     end    
4'd9: 
     begin 
     if(h_cnt < 100+2*`A & h_cnt > 70+2*`A & v_cnt < 210 & v_cnt > 205  )
           {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
     else if(h_cnt < 100+2*`A & h_cnt > 95+2*`A & v_cnt < 240 & v_cnt > 210  )
           {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
     else if(h_cnt < 100+2*`A & h_cnt > 95+2*`A & v_cnt < 270 & v_cnt > 240  )
           {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
     else if(h_cnt < 100+2*`A & h_cnt > 70+2*`A & v_cnt < 270 & v_cnt > 265  )
           {vgaRed, vgaGreen, vgaBlue} = 12'hfff;              
     else if(h_cnt < 75+2*`A & h_cnt > 70+2*`A & v_cnt < 270 & v_cnt > 240  )
           {vgaRed, vgaGreen, vgaBlue} = 12'h000;
     else if(h_cnt < 75+2*`A & h_cnt > 70+2*`A & v_cnt < 240 & v_cnt > 210  )
           {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
     else if(h_cnt < 100+2*`A & h_cnt > 70+2*`A & v_cnt < 243 & v_cnt >  238 )
           {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
     else
           {vgaRed, vgaGreen, vgaBlue} = 12'h000;
    end     
 4'd10: 
     begin 
     if(h_cnt < 100+2*`A & h_cnt > 70+2*`A & v_cnt < 210 & v_cnt > 205  )
           {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
     else if(h_cnt < 100+2*`A & h_cnt > 95+2*`A & v_cnt < 240 & v_cnt > 210  )
           {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
     else if(h_cnt < 100+2*`A & h_cnt > 95+2*`A & v_cnt < 270 & v_cnt > 240  )
           {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
     else if(h_cnt < 100+2*`A & h_cnt > 70+2*`A & v_cnt < 270 & v_cnt > 265  )
           {vgaRed, vgaGreen, vgaBlue} = 12'h000;              
     else if(h_cnt < 75+2*`A & h_cnt > 70+2*`A & v_cnt < 270 & v_cnt > 240  )
           {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
     else if(h_cnt < 75+2*`A & h_cnt > 70+2*`A & v_cnt < 240 & v_cnt > 210  )
           {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
     else if(h_cnt < 100+2*`A & h_cnt > 70+2*`A & v_cnt < 243 & v_cnt >  238 )
           {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
     else
           {vgaRed, vgaGreen, vgaBlue} = 12'h000;
     end   
  4'd12: 
     begin 
     if(h_cnt < 100+2*`A & h_cnt > 70+2*`A & v_cnt < 210 & v_cnt > 205  )
          {vgaRed, vgaGreen, vgaBlue} = 12'h000;
     else if(h_cnt < 100+2*`A & h_cnt > 95+2*`A & v_cnt < 240 & v_cnt > 210  )
          {vgaRed, vgaGreen, vgaBlue} = 12'h000;
     else if(h_cnt < 100+2*`A & h_cnt > 95+2*`A & v_cnt < 270 & v_cnt > 240  )
          {vgaRed, vgaGreen, vgaBlue} = 12'h000;
     else if(h_cnt < 100+2*`A & h_cnt > 70+2*`A & v_cnt < 270 & v_cnt > 265  )
           {vgaRed, vgaGreen, vgaBlue} = 12'h000;              
     else if(h_cnt < 75+2*`A & h_cnt > 70+2*`A & v_cnt < 270 & v_cnt > 240  )
           {vgaRed, vgaGreen, vgaBlue} = 12'h000;
     else if(h_cnt < 75+2*`A & h_cnt > 70+2*`A & v_cnt < 240 & v_cnt > 210  )
           {vgaRed, vgaGreen, vgaBlue} = 12'h000;
     else if(h_cnt < 100+2*`A & h_cnt > 70+2*`A & v_cnt < 243 & v_cnt >  238 )
           {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
     else
           {vgaRed, vgaGreen, vgaBlue} = 12'h000;
     end  
   4'd11: 
    begin 
    if(h_cnt < 100+2*`A & h_cnt > 70+2*`A & v_cnt < 210 & v_cnt > 205  )
           {vgaRed, vgaGreen, vgaBlue} = 12'h000;
    else if(h_cnt < 100+2*`A & h_cnt > 95+2*`A & v_cnt < 240 & v_cnt > 210  )
           {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
    else if(h_cnt < 100+2*`A & h_cnt > 95+2*`A & v_cnt < 270 & v_cnt > 240  )
           {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
    else if(h_cnt < 100+2*`A & h_cnt > 70+2*`A & v_cnt < 270 & v_cnt > 265  )
           {vgaRed, vgaGreen, vgaBlue} = 12'h000;              
    else if(h_cnt < 75+2*`A & h_cnt > 70+2*`A & v_cnt < 270 & v_cnt > 240  )
           {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
    else if(h_cnt < 75+2*`A & h_cnt > 70+2*`A & v_cnt < 240 & v_cnt > 210  )
           {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
    else if(h_cnt < 100+2*`A & h_cnt > 70+2*`A & v_cnt < 243 & v_cnt >  238 )
           {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
    else
           {vgaRed, vgaGreen, vgaBlue} = 12'h000;
    end                   
endcase
end

2'b11:
begin
  case (digit0)
   4'd15:
  begin 
     if(h_cnt < 100+3*`A & h_cnt > 70+3*`A & v_cnt < 210 & v_cnt > 205  )
          {vgaRed, vgaGreen, vgaBlue} = 12'h000;
     else if(h_cnt < 100+3*`A & h_cnt > 95+3*`A & v_cnt < 240 & v_cnt > 210  )
          {vgaRed, vgaGreen, vgaBlue} = 12'h000;
     else if(h_cnt < 100+3*`A & h_cnt > 95+3*`A & v_cnt < 270 & v_cnt > 240  )
          {vgaRed, vgaGreen, vgaBlue} = 12'h000;
     else if(h_cnt < 100+3*`A & h_cnt > 70+3*`A & v_cnt < 270 & v_cnt > 265  )
          {vgaRed, vgaGreen, vgaBlue} = 12'h000;              
     else if(h_cnt < 75+3*`A & h_cnt > 70+3*`A & v_cnt < 270 & v_cnt > 240  )
          {vgaRed, vgaGreen, vgaBlue} = 12'h000;
     else if(h_cnt < 75+3*`A & h_cnt > 70+3*`A & v_cnt < 240 & v_cnt > 210  )
          {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
     else if(h_cnt < 100+3*`A & h_cnt > 70+3*`A & v_cnt < 243 & v_cnt >  238 )
          {vgaRed, vgaGreen, vgaBlue} = 12'h000;      
     else
          {vgaRed, vgaGreen, vgaBlue} = 12'h0;
   end
4'd0: 
begin 
  if(h_cnt < 100+3*`A & h_cnt > 70+3*`A & v_cnt < 210 & v_cnt > 205  )
       {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
  else if(h_cnt < 100+3*`A & h_cnt > 95+3*`A & v_cnt < 240 & v_cnt > 210  )
       {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
  else if(h_cnt < 100+3*`A & h_cnt > 95+3*`A & v_cnt < 270 & v_cnt > 240  )
       {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
  else if(h_cnt < 100+3*`A & h_cnt > 70+3*`A & v_cnt < 270 & v_cnt > 265  )
       {vgaRed, vgaGreen, vgaBlue} = 12'hfff;              
  else if(h_cnt < 75+3*`A & h_cnt > 70+3*`A & v_cnt < 270 & v_cnt > 240  )
       {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
  else if(h_cnt < 75+3*`A & h_cnt > 70+3*`A & v_cnt < 240 & v_cnt > 210  )
       {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
  else if(h_cnt < 100+3*`A & h_cnt > 70+3*`A & v_cnt < 243 & v_cnt >  238 )
       {vgaRed, vgaGreen, vgaBlue} = 12'h000;      
  else
       {vgaRed, vgaGreen, vgaBlue} = 12'h0;
end
4'd1: 
begin 
   if(h_cnt < 100+3*`A & h_cnt > 70+3*`A & v_cnt < 210 & v_cnt > 205  )
        {vgaRed, vgaGreen, vgaBlue} = 12'h000;
   else if(h_cnt < 100+3*`A  & h_cnt > 95+3*`A  & v_cnt < 240 & v_cnt > 210  )
        {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
   else if(h_cnt < 100+3*`A  & h_cnt > 95+3*`A  & v_cnt < 270 & v_cnt > 240  )
        {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
   else if(h_cnt < 100+3*`A & h_cnt > 70+3*`A  & v_cnt < 270 & v_cnt > 265  )
        {vgaRed, vgaGreen, vgaBlue} = 12'h000;              
   else if(h_cnt < 75+3*`A  & h_cnt > 70+3*`A  & v_cnt < 270 & v_cnt > 240  )
        {vgaRed, vgaGreen, vgaBlue} = 12'h000;
   else if(h_cnt < 75+3*`A  & h_cnt > 70+3*`A  & v_cnt < 240 & v_cnt > 210  )
        {vgaRed, vgaGreen, vgaBlue} = 12'h000;
   else if(h_cnt < 100+3*`A  & h_cnt > 70+3*`A  & v_cnt < 243 & v_cnt >  238 )
        {vgaRed, vgaGreen, vgaBlue} = 12'h000; 
   else
        {vgaRed, vgaGreen, vgaBlue} = 12'h0;
 end
4'd2: 
begin 
   if(h_cnt < 100+3*`A  & h_cnt > 70+3*`A & v_cnt < 210 & v_cnt > 205  )
         {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
   else if(h_cnt < 100+3*`A & h_cnt > 95+3*`A & v_cnt < 240 & v_cnt > 210  )
         {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
   else if(h_cnt < 100+3*`A & h_cnt > 953*+`A & v_cnt < 270 & v_cnt > 240  )
         {vgaRed, vgaGreen, vgaBlue} = 12'h000;
   else if(h_cnt < 100+3*`A & h_cnt > 70+3*`A & v_cnt < 270 & v_cnt > 265  )
         {vgaRed, vgaGreen, vgaBlue} = 12'hfff;              
   else if(h_cnt < 75+3*`A & h_cnt > 70+3*`A & v_cnt < 270 & v_cnt > 240  )
         {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
   else if(h_cnt < 75+3*`A & h_cnt > 70+3*`A & v_cnt < 240 & v_cnt > 210  )
         {vgaRed, vgaGreen, vgaBlue} = 12'h000;
   else if(h_cnt < 100+3*`A & h_cnt > 70+3*`A & v_cnt < 243 & v_cnt >  238 )
         {vgaRed, vgaGreen, vgaBlue} = 12'hfff; 
   else
         {vgaRed, vgaGreen, vgaBlue} = 12'h0;
   end
4'd3: 
  begin 
   if(h_cnt < 100+3*`A & h_cnt > 70+3*`A & v_cnt < 210 & v_cnt > 205  )
         {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
   else if(h_cnt < 100+3*`A & h_cnt > 95+3*`A & v_cnt < 240 & v_cnt > 210  )
         {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
   else if(h_cnt < 100+3*`A & h_cnt > 95+3*`A & v_cnt < 270 & v_cnt > 240  )
         {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
   else if(h_cnt < 100+3*`A & h_cnt > 70+3*`A & v_cnt < 270 & v_cnt > 265  )
         {vgaRed, vgaGreen, vgaBlue} = 12'hfff;              
   else if(h_cnt < 75+3*`A & h_cnt > 70+3*`A & v_cnt < 270 & v_cnt > 240  )
         {vgaRed, vgaGreen, vgaBlue} = 12'h000;
   else if(h_cnt < 75+3*`A & h_cnt > 70+3*`A & v_cnt < 240 & v_cnt > 210  )
         {vgaRed, vgaGreen, vgaBlue} = 12'h000;
   else if(h_cnt < 100+3*`A & h_cnt > 70+3*`A & v_cnt < 243 & v_cnt >  238 )
         {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
   else
         {vgaRed, vgaGreen, vgaBlue} = 12'h000;
   end
4'd4: 
   begin 
   if(h_cnt < 100+3*`A & h_cnt > 70+3*`A & v_cnt < 210 & v_cnt > 205  )
         {vgaRed, vgaGreen, vgaBlue} = 12'h000;
   else if(h_cnt < 100+3*`A & h_cnt > 95+3*`A & v_cnt < 240 & v_cnt > 210  )
         {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
   else if(h_cnt < 100+3*`A & h_cnt > 95+3*`A & v_cnt < 270 & v_cnt > 240  )
         {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
   else if(h_cnt < 100+3*`A & h_cnt > 70+3*`A & v_cnt < 270 & v_cnt > 265  )
         {vgaRed, vgaGreen, vgaBlue} = 12'h000;              
   else if(h_cnt < 75+3*`A & h_cnt > 70+3*`A & v_cnt < 270 & v_cnt > 240  )
         {vgaRed, vgaGreen, vgaBlue} = 12'h000;
   else if(h_cnt < 75+3*`A & h_cnt > 70+3*`A & v_cnt < 240 & v_cnt > 210  )
         {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
   else if(h_cnt < 100+3*`A & h_cnt > 70+3*`A & v_cnt < 243 & v_cnt >  238 )
         {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
   else
         {vgaRed, vgaGreen, vgaBlue} = 12'h000;
   end
4'd5: 
   begin 
   if(h_cnt < 100+3*`A & h_cnt > 70+3*`A & v_cnt < 210 & v_cnt > 205  )
         {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
   else if(h_cnt < 100+3*`A & h_cnt > 95+3*`A & v_cnt < 240 & v_cnt > 210  )
         {vgaRed, vgaGreen, vgaBlue} = 12'h000;
   else if(h_cnt < 100+3*`A & h_cnt > 95+3*`A & v_cnt < 270 & v_cnt > 240  )
         {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
   else if(h_cnt < 100+3*`A & h_cnt > 70+3*`A & v_cnt < 270 & v_cnt > 265  )
         {vgaRed, vgaGreen, vgaBlue} = 12'hfff;              
   else if(h_cnt < 75+3*`A & h_cnt > 70+3*`A & v_cnt < 270 & v_cnt > 240  )
         {vgaRed, vgaGreen, vgaBlue} = 12'h000;
   else if(h_cnt < 75+3*`A & h_cnt > 70+3*`A & v_cnt < 240 & v_cnt > 210  )
         {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
   else if(h_cnt < 100+3*`A & h_cnt > 70+3*`A & v_cnt < 243 & v_cnt >  238 )
         {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
   else
         {vgaRed, vgaGreen, vgaBlue} = 12'h000;
   end
4'd6: 
   begin 
   if(h_cnt < 100+3*`A & h_cnt > 70+3*`A & v_cnt < 210 & v_cnt > 205  )
        {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
   else if(h_cnt < 100+3*`A & h_cnt > 95+3*`A & v_cnt < 240 & v_cnt > 210  )
        {vgaRed, vgaGreen, vgaBlue} = 12'h000;
   else if(h_cnt < 100+3*`A & h_cnt > 95+3*`A & v_cnt < 270 & v_cnt > 240  )
        {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
   else if(h_cnt < 100+3*`A & h_cnt > 70+3*`A & v_cnt < 270 & v_cnt > 265  )
        {vgaRed, vgaGreen, vgaBlue} = 12'hfff;              
   else if(h_cnt < 75+3*`A & h_cnt > 70+3*`A & v_cnt < 270 & v_cnt > 240  )
        {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
   else if(h_cnt < 75+3*`A & h_cnt > 70+3*`A & v_cnt < 240 & v_cnt > 210  )
        {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
   else if(h_cnt < 100+3*`A & h_cnt > 70+3*`A & v_cnt < 243 & v_cnt >  238 )
        {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
   else
        {vgaRed, vgaGreen, vgaBlue} = 12'h000;
   end 
4'd7: 
   begin 
   if(h_cnt < 100+3*`A & h_cnt > 70+3*`A & v_cnt < 210 & v_cnt > 205  )
         {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
   else if(h_cnt < 100+3*`A & h_cnt > 95+3*`A & v_cnt < 240 & v_cnt > 210  )
         {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
   else if(h_cnt < 100+3*`A & h_cnt > 95+3*`A & v_cnt < 270 & v_cnt > 240  )
         {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
   else if(h_cnt < 100+3*`A & h_cnt+3*`A > 70 & v_cnt < 270 & v_cnt > 265  )
         {vgaRed, vgaGreen, vgaBlue} = 12'h000;              
   else if(h_cnt < 75+3*`A & h_cnt > 70+3*`A & v_cnt < 270 & v_cnt > 240  )
         {vgaRed, vgaGreen, vgaBlue} = 12'h000;
   else if(h_cnt < 75+3*`A & h_cnt > 70+3*`A & v_cnt < 240 & v_cnt > 210  )
         {vgaRed, vgaGreen, vgaBlue} = 12'h000;
   else if(h_cnt < 100+3*`A & h_cnt > 70+3*`A & v_cnt < 243 & v_cnt >  238 )
         {vgaRed, vgaGreen, vgaBlue} = 12'h000;
   else
         {vgaRed, vgaGreen, vgaBlue} = 12'h000;
   end 
4'd8: 
   begin 
   if(h_cnt < 100+3*`A & h_cnt > 70+3*`A & v_cnt < 210 & v_cnt > 205  )
         {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
   else if(h_cnt < 100+3*`A & h_cnt > 95+3*`A & v_cnt < 240 & v_cnt > 210  )
         {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
   else if(h_cnt < 100+3*`A & h_cnt > 95+3*`A & v_cnt < 270 & v_cnt > 240  )
         {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
   else if(h_cnt < 100+3*`A & h_cnt > 70+3*`A & v_cnt < 270 & v_cnt > 265  )
         {vgaRed, vgaGreen, vgaBlue} = 12'hfff;              
   else if(h_cnt < 75+3*`A & h_cnt > 70+3*`A & v_cnt < 270 & v_cnt > 240  )
         {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
   else if(h_cnt < 75+3*`A & h_cnt > 70+3*`A & v_cnt < 240 & v_cnt > 210  )
         {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
   else if(h_cnt < 100+3*`A & h_cnt > 70+3*`A & v_cnt < 243 & v_cnt >  238 )
         {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
   else
         {vgaRed, vgaGreen, vgaBlue} = 12'h000;
   end    
4'd9: 
   begin 
   if(h_cnt < 100+3*`A & h_cnt > 70+3*`A & v_cnt < 210 & v_cnt > 205  )
         {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
   else if(h_cnt < 100+3*`A & h_cnt > 95+3*`A & v_cnt < 240 & v_cnt > 210  )
         {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
   else if(h_cnt < 100+3*`A & h_cnt > 95+3*`A & v_cnt < 270 & v_cnt > 240  )
         {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
   else if(h_cnt < 100+3*`A & h_cnt > 70+3*`A & v_cnt < 270 & v_cnt > 265  )
         {vgaRed, vgaGreen, vgaBlue} = 12'hfff;              
   else if(h_cnt < 75+3*`A & h_cnt > 70+3*`A & v_cnt < 270 & v_cnt > 240  )
         {vgaRed, vgaGreen, vgaBlue} = 12'h000;
   else if(h_cnt < 75+3*`A & h_cnt > 70+3*`A & v_cnt < 240 & v_cnt > 210  )
         {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
   else if(h_cnt < 100+3*`A & h_cnt > 70+3*`A & v_cnt < 243 & v_cnt >  238 )
         {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
   else
         {vgaRed, vgaGreen, vgaBlue} = 12'h000;
  end     
4'd10: 
   begin 
   if(h_cnt < 100+3*`A & h_cnt > 70+3*`A & v_cnt < 210 & v_cnt > 205  )
         {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
   else if(h_cnt < 100+3*`A & h_cnt > 95+3*`A & v_cnt < 240 & v_cnt > 210  )
         {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
   else if(h_cnt < 100+3*`A & h_cnt > 95+3*`A & v_cnt < 270 & v_cnt > 240  )
         {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
   else if(h_cnt < 100+3*`A & h_cnt > 70+3*`A & v_cnt < 270 & v_cnt > 265  )
         {vgaRed, vgaGreen, vgaBlue} = 12'h000;              
   else if(h_cnt < 75+3*`A & h_cnt > 70+3*`A & v_cnt < 270 & v_cnt > 240  )
         {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
   else if(h_cnt < 75+3*`A & h_cnt > 70+3*`A & v_cnt < 240 & v_cnt > 210  )
         {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
   else if(h_cnt < 100+3*`A & h_cnt > 70+3*`A & v_cnt < 243 & v_cnt >  238 )
         {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
   else
         {vgaRed, vgaGreen, vgaBlue} = 12'h000;
   end   
4'd12: 
   begin 
   if(h_cnt < 100+3*`A & h_cnt > 70+3*`A & v_cnt < 210 & v_cnt > 205  )
        {vgaRed, vgaGreen, vgaBlue} = 12'h000;
   else if(h_cnt < 100+3*`A & h_cnt > 95+3*`A & v_cnt < 240 & v_cnt > 210  )
        {vgaRed, vgaGreen, vgaBlue} = 12'h000;
   else if(h_cnt < 100+3*`A & h_cnt > 95+3*`A & v_cnt < 270 & v_cnt > 240  )
        {vgaRed, vgaGreen, vgaBlue} = 12'h000;
   else if(h_cnt < 100+3*`A & h_cnt > 70+3*`A & v_cnt < 270 & v_cnt > 265  )
         {vgaRed, vgaGreen, vgaBlue} = 12'h000;              
   else if(h_cnt < 75+3*`A & h_cnt > 70+3*`A & v_cnt < 270 & v_cnt > 240  )
         {vgaRed, vgaGreen, vgaBlue} = 12'h000;
   else if(h_cnt < 75+3*`A & h_cnt > 70+3*`A & v_cnt < 240 & v_cnt > 210  )
         {vgaRed, vgaGreen, vgaBlue} = 12'h000;
   else if(h_cnt < 100+3*`A & h_cnt > 70+3*`A & v_cnt < 243 & v_cnt >  238 )
         {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
   else
         {vgaRed, vgaGreen, vgaBlue} = 12'h000;
   end  
 4'd11: 
  begin 
  if(h_cnt < 100+3*`A & h_cnt > 70+3*`A & v_cnt < 210 & v_cnt > 205  )
         {vgaRed, vgaGreen, vgaBlue} = 12'h000;
  else if(h_cnt < 100+3*`A & h_cnt > 95+3*`A & v_cnt < 240 & v_cnt > 210  )
         {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
  else if(h_cnt < 100+3*`A & h_cnt > 95+3*`A & v_cnt < 270 & v_cnt > 240  )
         {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
  else if(h_cnt < 100+3*`A & h_cnt > 70+3*`A & v_cnt < 270 & v_cnt > 265  )
         {vgaRed, vgaGreen, vgaBlue} = 12'h000;              
  else if(h_cnt < 75+3*`A & h_cnt > 70+3*`A & v_cnt < 270 & v_cnt > 240  )
         {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
  else if(h_cnt < 75+3*`A & h_cnt > 70+3*`A & v_cnt < 240 & v_cnt > 210  )
         {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
  else if(h_cnt < 100+3*`A & h_cnt > 70+3*`A & v_cnt < 243 & v_cnt >  238 )
         {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
  else
         {vgaRed, vgaGreen, vgaBlue} = 12'h000;
  end                   

endcase  
end
endcase
end




  always @*
  begin
    if(!valid)
      en = 2'b00;
    else if(h_cnt < 160)
      en = 2'b00;
    else if(h_cnt < 320)
      en = 2'b01;
    else if(h_cnt < 480)
      en = 2'b10;
    else if(h_cnt < 640)
      en = 2'b11;       
    else
       en = 2'b00;
  end


endmodule
