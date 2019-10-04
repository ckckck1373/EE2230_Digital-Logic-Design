
 `define difference 8'd40

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
  output [11:0]pixel
);
   
   reg [3:0]vgaRed, vgaGreen, vgaBlue;
   wire [9:0]h_cnt,v_cnt;
   reg [1:0]en;
   
    
   assign pixel = {vgaRed, vgaGreen, vgaBlue};
   
  always @(clk)
   begin
   case(en)
   2'b00:
   begin
  case (digit3)
  4'd0: 
  begin 
     if(h_cnt <= 30 && h_cnt >= 10 && v_cnt <= 8 && v_cnt >= 5)
          {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
     else if(h_cnt <= 30 && h_cnt >= 27 && v_cnt <= 28 && v_cnt >= 8)
          {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
     else if(h_cnt <= 30 && h_cnt >= 27 && v_cnt <= 48 && v_cnt >= 28  )
          {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
     else if(h_cnt <= 30  && h_cnt >= 10 && v_cnt <= 51  && v_cnt >=  48 )
          {vgaRed, vgaGreen, vgaBlue} = 12'hfff;              
     else if(h_cnt <= 13 && h_cnt >= 10 && v_cnt <= 48 && v_cnt >= 28  )
          {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
     else if(h_cnt <= 13 && h_cnt >= 10 && v_cnt <= 28 && v_cnt >=  8 )
          {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
     else if(h_cnt <= 30 && h_cnt >= 10 && v_cnt <= 28 && v_cnt >=  25 )
          {vgaRed, vgaGreen, vgaBlue} = 12'h000;      
     else
          {vgaRed, vgaGreen, vgaBlue} = 12'h0;
   end
  4'd1: 
   begin 
      if(h_cnt <= 30 && h_cnt >= 10 && v_cnt <= 8 && v_cnt >= 5)
           {vgaRed, vgaGreen, vgaBlue} = 12'h000;
      else if(h_cnt <= 30 && h_cnt >= 27 && v_cnt <= 28 && v_cnt >= 8)
           {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
      else if(h_cnt <= 30 && h_cnt >= 27 && v_cnt <= 48 && v_cnt >= 28  )
           {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
      else if(h_cnt <= 30  && h_cnt >= 10 && v_cnt <= 51  && v_cnt >=  48 )
           {vgaRed, vgaGreen, vgaBlue} = 12'h000;              
      else if(h_cnt <= 13 && h_cnt >= 10 && v_cnt <= 48 && v_cnt >= 28  )
           {vgaRed, vgaGreen, vgaBlue} = 12'h000;
      else if(h_cnt <= 13 && h_cnt >= 10 && v_cnt <= 28 && v_cnt >=  8 )
           {vgaRed, vgaGreen, vgaBlue} = 12'h000;
      else if(h_cnt <= 30 && h_cnt >= 10 && v_cnt <= 28 && v_cnt >=  25 )
           {vgaRed, vgaGreen, vgaBlue} = 12'h000; 
      else
           {vgaRed, vgaGreen, vgaBlue} = 12'h0;
    end
  4'd2: 
   begin 
      if(h_cnt <= 30 && h_cnt >= 10 && v_cnt <= 8 && v_cnt >= 5)
            {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
      else if(h_cnt <= 30 && h_cnt >= 27 && v_cnt <= 28 && v_cnt >= 8)
            {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
      else if(h_cnt <= 30 && h_cnt >= 27 && v_cnt <= 48 && v_cnt >= 28  )
            {vgaRed, vgaGreen, vgaBlue} = 12'h000;
      else if(h_cnt <= 30  && h_cnt >= 10 && v_cnt <= 51  && v_cnt >=  48 )
            {vgaRed, vgaGreen, vgaBlue} = 12'hfff;              
      else if(h_cnt <= 13 && h_cnt >= 10 && v_cnt <= 48 && v_cnt >= 28  )
            {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
      else if(h_cnt <= 13 && h_cnt >= 10 && v_cnt <= 28 && v_cnt >=  8 )
            {vgaRed, vgaGreen, vgaBlue} = 12'h000;
      else if(h_cnt <= 30 && h_cnt >= 10 && v_cnt <= 28 && v_cnt >=  25 )
            {vgaRed, vgaGreen, vgaBlue} = 12'hfff; 
      else
            {vgaRed, vgaGreen, vgaBlue} = 12'h0;
      end
  4'd3: 
     begin 
      if(h_cnt <= 30 && h_cnt >= 10 && v_cnt <= 8 && v_cnt >= 5)
            {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
      else if(h_cnt <= 30 && h_cnt >= 27 && v_cnt <= 28 && v_cnt >= 8)
            {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
      else if(h_cnt <= 30 && h_cnt >= 27 && v_cnt <= 48 && v_cnt >= 28  )
            {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
      else if(h_cnt <= 30  && h_cnt >= 10 && v_cnt <= 51  && v_cnt >=  48 )
            {vgaRed, vgaGreen, vgaBlue} = 12'hfff;              
      else if(h_cnt <= 13 && h_cnt >= 10 && v_cnt <= 48 && v_cnt >= 28  )
            {vgaRed, vgaGreen, vgaBlue} = 12'h000;
      else if(h_cnt <= 13 && h_cnt >= 10 && v_cnt <= 28 && v_cnt >=  8 )
            {vgaRed, vgaGreen, vgaBlue} = 12'h000;
      else if(h_cnt <= 30 && h_cnt >= 10 && v_cnt <= 28 && v_cnt >=  25 )
            {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
      else
            {vgaRed, vgaGreen, vgaBlue} = 12'h000;
      end
  4'd4: 
      begin 
      if(h_cnt <= 30 && h_cnt >= 10 && v_cnt <= 8 && v_cnt >= 5)
            {vgaRed, vgaGreen, vgaBlue} = 12'h000;
      else if(h_cnt <= 30 && h_cnt >= 27 && v_cnt <= 28 && v_cnt >= 8)
            {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
      else if(h_cnt <= 30 && h_cnt >= 27 && v_cnt <= 48 && v_cnt >= 28  )
            {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
      else if(h_cnt <= 30  && h_cnt >= 10 && v_cnt <= 51  && v_cnt >=  48 )
            {vgaRed, vgaGreen, vgaBlue} = 12'h000;              
      else if(h_cnt <= 13 && h_cnt >= 10 && v_cnt <= 48 && v_cnt >= 28  )
            {vgaRed, vgaGreen, vgaBlue} = 12'h000;
      else if(h_cnt <= 13 && h_cnt >= 10 && v_cnt <= 28 && v_cnt >=  8 )
            {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
      else if(h_cnt <= 30 && h_cnt >= 10 && v_cnt <= 28 && v_cnt >=  25 )
            {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
      else
            {vgaRed, vgaGreen, vgaBlue} = 12'h000;
      end
 4'd5: 
      begin 
      if(h_cnt <= 30 && h_cnt >= 10 && v_cnt <= 8 && v_cnt >= 5)
            {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
      else if(h_cnt <= 30 && h_cnt >= 27 && v_cnt <= 28 && v_cnt >= 8)
            {vgaRed, vgaGreen, vgaBlue} = 12'h000;
      else if(h_cnt <= 30 && h_cnt >= 27 && v_cnt <= 48 && v_cnt >= 28  )
            {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
      else if(h_cnt <= 30  && h_cnt >= 10 && v_cnt <= 51  && v_cnt >=  48 )
            {vgaRed, vgaGreen, vgaBlue} = 12'hfff;              
      else if(h_cnt <= 13 && h_cnt >= 10 && v_cnt <= 48 && v_cnt >= 28  )
            {vgaRed, vgaGreen, vgaBlue} = 12'h000;
      else if(h_cnt <= 13 && h_cnt >= 10 && v_cnt <= 28 && v_cnt >=  8 )
            {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
      else if(h_cnt <= 30 && h_cnt >= 10 && v_cnt <= 28 && v_cnt >=  25 )
            {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
      else
            {vgaRed, vgaGreen, vgaBlue} = 12'h000;
      end
 4'd6: 
      begin 
      if(h_cnt <= 30 && h_cnt >= 10 && v_cnt <= 8 && v_cnt >= 5)
           {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
      else if(h_cnt <= 30 && h_cnt >= 27 && v_cnt <= 28 && v_cnt >= 8)
           {vgaRed, vgaGreen, vgaBlue} = 12'h000;
      else if(h_cnt <= 30 && h_cnt >= 27 && v_cnt <= 48 && v_cnt >= 28  )
           {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
      else if(h_cnt <= 30  && h_cnt >= 10 && v_cnt <= 51  && v_cnt >=  48 )
           {vgaRed, vgaGreen, vgaBlue} = 12'hfff;              
      else if(h_cnt <= 13 && h_cnt >= 10 && v_cnt <= 48 && v_cnt >= 28  )
           {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
      else if(h_cnt <= 13 && h_cnt >= 10 && v_cnt <= 28 && v_cnt >=  8 )
           {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
      else if(h_cnt <= 30 && h_cnt >= 10 && v_cnt <= 28 && v_cnt >=  25 )
           {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
      else
           {vgaRed, vgaGreen, vgaBlue} = 12'h000;
      end 
 4'd7: 
      begin 
      if(h_cnt <= 30 && h_cnt >= 10 && v_cnt <= 8 && v_cnt >= 5)
            {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
      else if(h_cnt <= 30 && h_cnt >= 27 && v_cnt <= 28 && v_cnt >= 8)
            {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
      else if(h_cnt <= 30 && h_cnt >= 27 && v_cnt <= 48 && v_cnt >= 28  )
            {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
      else if(h_cnt <= 30  && h_cnt >= 10 && v_cnt <= 51  && v_cnt >=  48 )
            {vgaRed, vgaGreen, vgaBlue} = 12'h000;              
      else if(h_cnt <= 13 && h_cnt >= 10 && v_cnt <= 48 && v_cnt >= 28  )
            {vgaRed, vgaGreen, vgaBlue} = 12'h000;
      else if(h_cnt <= 13 && h_cnt >= 10 && v_cnt <= 28 && v_cnt >=  8 )
            {vgaRed, vgaGreen, vgaBlue} = 12'h000;
      else if(h_cnt <= 30 && h_cnt >= 10 && v_cnt <= 28 && v_cnt >=  25 )
            {vgaRed, vgaGreen, vgaBlue} = 12'h000;
      else
            {vgaRed, vgaGreen, vgaBlue} = 12'h000;
      end 
 4'd8: 
      begin 
      if(h_cnt <= 30 && h_cnt >= 10 && v_cnt <= 8 && v_cnt >= 5)
            {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
      else if(h_cnt <= 30 && h_cnt >= 27 && v_cnt <= 28 && v_cnt >= 8)
            {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
      else if(h_cnt <= 30 && h_cnt >= 27 && v_cnt <= 48 && v_cnt >= 28  )
            {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
      else if(h_cnt <= 30  && h_cnt >= 10 && v_cnt <= 51  && v_cnt >=  48 )
            {vgaRed, vgaGreen, vgaBlue} = 12'hfff;              
      else if(h_cnt <= 13 && h_cnt >= 10 && v_cnt <= 48 && v_cnt >= 28  )
            {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
      else if(h_cnt <= 13 && h_cnt >= 10 && v_cnt <= 28 && v_cnt >=  8 )
            {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
      else if(h_cnt <= 30 && h_cnt >= 10 && v_cnt <= 28 && v_cnt >=  25 )
            {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
      else
            {vgaRed, vgaGreen, vgaBlue} = 12'h000;
      end    
 4'd9: 
      begin 
      if(h_cnt <= 30 && h_cnt >= 10 && v_cnt <= 8 && v_cnt >= 5)
            {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
      else if(h_cnt <= 30 && h_cnt >= 27 && v_cnt <= 28 && v_cnt >= 8)
            {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
      else if(h_cnt <= 30 && h_cnt >= 27 && v_cnt <= 48 && v_cnt >= 28  )
            {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
      else if(h_cnt <= 30  && h_cnt >= 10 && v_cnt <= 51  && v_cnt >=  48 )
            {vgaRed, vgaGreen, vgaBlue} = 12'hfff;              
      else if(h_cnt <= 13 && h_cnt >= 10 && v_cnt <= 48 && v_cnt >= 28  )
            {vgaRed, vgaGreen, vgaBlue} = 12'h000;
      else if(h_cnt <= 13 && h_cnt >= 10 && v_cnt <= 28 && v_cnt >=  8 )
            {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
      else if(h_cnt <= 30 && h_cnt >= 10 && v_cnt <= 28 && v_cnt >=  25 )
            {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
      else
            {vgaRed, vgaGreen, vgaBlue} = 12'h000;
     end                  
 endcase
end

2'b01:
begin
 case (digit2)
4'd0: 
begin 
   if(h_cnt <= 30+`difference && h_cnt >= 10+`difference && v_cnt <= 8 && v_cnt >= 5)
        {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
   else if(h_cnt <= 30+`difference && h_cnt >= 27+`difference && v_cnt <= 28 && v_cnt >= 8)
        {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
   else if(h_cnt <= 30+`difference && h_cnt >= 27+`difference && v_cnt <= 48 && v_cnt >= 28  )
        {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
   else if(h_cnt <= 30+`difference   && h_cnt >= 10+`difference  && v_cnt <= 51   && v_cnt >=  48  )
        {vgaRed, vgaGreen, vgaBlue} = 12'hfff;              
   else if(h_cnt <= 13+`difference  && h_cnt >= 10+`difference  && v_cnt <= 48  && v_cnt >= 28   )
        {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
   else if(h_cnt <= 13+`difference  && h_cnt >= 10+`difference  && v_cnt <= 28  && v_cnt >=  8  )
        {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
   else if(h_cnt <= 30+`difference && h_cnt >= 10+`difference && v_cnt <= 28 && v_cnt >=  25 )
        {vgaRed, vgaGreen, vgaBlue} = 12'h000;      
   else
        {vgaRed, vgaGreen, vgaBlue} = 12'h0;
 end
4'd1: 
 begin 
    if(h_cnt <= 30+`difference && h_cnt >= 10+`difference && v_cnt <= 8 && v_cnt >= 5)
         {vgaRed, vgaGreen, vgaBlue} = 12'h000;
    else if(h_cnt <= 30+`difference && h_cnt >= 27+`difference && v_cnt <= 28 && v_cnt >= 8)
         {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
    else if(h_cnt <= 30+`difference && h_cnt >= 27+`difference && v_cnt <= 48 && v_cnt >= 28  )
         {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
    else if(h_cnt <= 30+`difference   && h_cnt >= 10+`difference  && v_cnt <= 51   && v_cnt >=  48  )
         {vgaRed, vgaGreen, vgaBlue} = 12'h000;              
    else if(h_cnt <= 13+`difference  && h_cnt >= 10+`difference  && v_cnt <= 48  && v_cnt >= 28   )
         {vgaRed, vgaGreen, vgaBlue} = 12'h000;
    else if(h_cnt <= 13+`difference  && h_cnt >= 10+`difference  && v_cnt <= 28  && v_cnt >=  8  )
         {vgaRed, vgaGreen, vgaBlue} = 12'h000;
    else if(h_cnt <= 30+`difference && h_cnt >= 10+`difference && v_cnt <= 28 && v_cnt >=  25 )
         {vgaRed, vgaGreen, vgaBlue} = 12'h000; 
    else
         {vgaRed, vgaGreen, vgaBlue} = 12'h0;
  end
4'd2: 
 begin 
    if(h_cnt <= 30+`difference && h_cnt >= 10+`difference && v_cnt <= 8 && v_cnt >= 5)
          {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
    else if(h_cnt <= 30+`difference && h_cnt >= 27+`difference && v_cnt <= 28 && v_cnt >= 8)
          {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
    else if(h_cnt <= 30+`difference && h_cnt >= 27+`difference && v_cnt <= 48 && v_cnt >= 28  )
          {vgaRed, vgaGreen, vgaBlue} = 12'h000;
    else if(h_cnt <= 30+`difference   && h_cnt >= 10+`difference  && v_cnt <= 51   && v_cnt >=  48  )
          {vgaRed, vgaGreen, vgaBlue} = 12'hfff;              
    else if(h_cnt <= 13+`difference  && h_cnt >= 10+`difference  && v_cnt <= 48  && v_cnt >= 28   )
          {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
    else if(h_cnt <= 13+`difference  && h_cnt >= 10+`difference  && v_cnt <= 28  && v_cnt >=  8  )
          {vgaRed, vgaGreen, vgaBlue} = 12'h000;
    else if(h_cnt <= 30+`difference && h_cnt >= 10+`difference && v_cnt <= 28 && v_cnt >=  25 )
          {vgaRed, vgaGreen, vgaBlue} = 12'hfff; 
    else
          {vgaRed, vgaGreen, vgaBlue} = 12'h0;
    end
4'd3: 
   begin 
    if(h_cnt <= 30+`difference && h_cnt >= 10+`difference && v_cnt <= 8 && v_cnt >= 5)
          {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
    else if(h_cnt <= 30+`difference && h_cnt >= 27+`difference && v_cnt <= 28 && v_cnt >= 8)
          {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
    else if(h_cnt <= 30+`difference && h_cnt >= 27+`difference && v_cnt <= 48 && v_cnt >= 28  )
          {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
    else if(h_cnt <= 30+`difference   && h_cnt >= 10+`difference  && v_cnt <= 51   && v_cnt >=  48  )
          {vgaRed, vgaGreen, vgaBlue} = 12'hfff;              
    else if(h_cnt <= 13+`difference  && h_cnt >= 10+`difference  && v_cnt <= 48  && v_cnt >= 28   )
          {vgaRed, vgaGreen, vgaBlue} = 12'h000;
    else if(h_cnt <= 13+`difference  && h_cnt >= 10+`difference  && v_cnt <= 28  && v_cnt >=  8  )
          {vgaRed, vgaGreen, vgaBlue} = 12'h000;
    else if(h_cnt <= 30+`difference && h_cnt >= 10+`difference && v_cnt <= 28 && v_cnt >=  25 )
          {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
    else
          {vgaRed, vgaGreen, vgaBlue} = 12'h000;
    end
4'd4: 
    begin 
    if(h_cnt <= 30+`difference && h_cnt >= 10+`difference && v_cnt <= 8 && v_cnt >= 5)
          {vgaRed, vgaGreen, vgaBlue} = 12'h000;
    else if(h_cnt <= 30+`difference && h_cnt >= 27+`difference && v_cnt <= 28 && v_cnt >= 8)
          {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
    else if(h_cnt <= 30+`difference && h_cnt >= 27+`difference && v_cnt <= 48 && v_cnt >= 28 )
          {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
    else if(h_cnt <= 30+`difference   && h_cnt >= 10+`difference  && v_cnt <= 51   && v_cnt >=  48  )
          {vgaRed, vgaGreen, vgaBlue} = 12'h000;              
    else if(h_cnt <= 13+`difference  && h_cnt >= 10+`difference  && v_cnt <= 48  && v_cnt >= 28   )
          {vgaRed, vgaGreen, vgaBlue} = 12'h000;
    else if(h_cnt <= 13+`difference  && h_cnt >= 10+`difference  && v_cnt <= 28  && v_cnt >=  8  )
          {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
    else if(h_cnt <= 30+`difference && h_cnt >= 10+`difference && v_cnt <= 28 && v_cnt >=  25 )
          {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
    else
          {vgaRed, vgaGreen, vgaBlue} = 12'h000;
    end
4'd5: 
    begin 
    if(h_cnt <= 30+`difference && h_cnt >= 10+`difference && v_cnt <= 8 && v_cnt >= 5)
          {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
    else if(h_cnt <= 30+`difference && h_cnt >= 27+`difference && v_cnt <= 28 && v_cnt >= 8)
          {vgaRed, vgaGreen, vgaBlue} = 12'h000;
    else if(h_cnt <= 30+`difference && h_cnt >= 27+`difference && v_cnt <= 48 && v_cnt >= 28  )
          {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
    else if(h_cnt <= 30+`difference   && h_cnt >= 10+`difference  && v_cnt <= 51   && v_cnt >=  48 )
          {vgaRed, vgaGreen, vgaBlue} = 12'hfff;              
    else if(h_cnt <= 13+`difference  && h_cnt >= 10+`difference  && v_cnt <= 48  && v_cnt >= 28   )
          {vgaRed, vgaGreen, vgaBlue} = 12'h000;
    else if(h_cnt <= 13+`difference  && h_cnt >= 10+`difference  && v_cnt <= 28  && v_cnt >=  8  )
          {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
    else if(h_cnt <= 30+`difference && h_cnt >= 10+`difference && v_cnt <= 28 && v_cnt >=  25 )
          {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
    else
          {vgaRed, vgaGreen, vgaBlue} = 12'h000;
    end
4'd6: 
    begin 
    if(h_cnt <= 30+`difference && h_cnt >= 10+`difference && v_cnt <= 8 && v_cnt >= 5)
         {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
    else if(h_cnt <= 30+`difference && h_cnt >= 27+`difference && v_cnt <= 28 && v_cnt >= 8)
         {vgaRed, vgaGreen, vgaBlue} = 12'h000;
    else if(h_cnt <= 30+`difference && h_cnt >= 27+`difference && v_cnt <= 48 && v_cnt >= 28  )
         {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
    else if(h_cnt <= 30+`difference   && h_cnt >= 10+`difference  && v_cnt <= 51   && v_cnt >=  48  )
         {vgaRed, vgaGreen, vgaBlue} = 12'hfff;              
    else if(h_cnt <= 13+`difference  && h_cnt >= 10+`difference  && v_cnt <= 48  && v_cnt >= 28   )
         {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
    else if(h_cnt <= 13+`difference  && h_cnt >= 10+`difference  && v_cnt <= 28  && v_cnt >=  8 )
         {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
    else if(h_cnt <= 30+`difference && h_cnt >= 10+`difference && v_cnt <= 28 && v_cnt >=  25 )
         {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
    else
         {vgaRed, vgaGreen, vgaBlue} = 12'h000;
    end 
4'd7: 
    begin 
    if(h_cnt <= 30+`difference && h_cnt >= 10+`difference && v_cnt <= 8 && v_cnt >= 5)
          {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
    else if(h_cnt <= 30+`difference && h_cnt >= 27+`difference && v_cnt <= 28 && v_cnt >= 8)
          {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
    else if(h_cnt <= 30+`difference && h_cnt >= 27+`difference && v_cnt <= 48 && v_cnt >= 28  )
          {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
    else if(h_cnt <= 30+`difference   && h_cnt >= 10+`difference  && v_cnt <= 51   && v_cnt >=  48  )
          {vgaRed, vgaGreen, vgaBlue} = 12'h000;              
    else if(h_cnt <= 13+`difference  && h_cnt >= 10+`difference  && v_cnt <= 48  && v_cnt >= 28   )
          {vgaRed, vgaGreen, vgaBlue} = 12'h000;
    else if(h_cnt <= 13+`difference  && h_cnt >= 10+`difference  && v_cnt <= 28  && v_cnt >=  8  )
          {vgaRed, vgaGreen, vgaBlue} = 12'h000;
    else if(h_cnt <= 30+`difference && h_cnt >= 10+`difference && v_cnt <= 28 && v_cnt >=  25 )
          {vgaRed, vgaGreen, vgaBlue} = 12'h000;
    else
          {vgaRed, vgaGreen, vgaBlue} = 12'h000;
    end 
4'd8: 
    begin 
    if(h_cnt <= 30+`difference && h_cnt >= 10+`difference && v_cnt <= 8 && v_cnt >= 5)
          {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
    else if(h_cnt <= 30+`difference && h_cnt >= 27+`difference && v_cnt <= 28 && v_cnt >= 8)
          {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
    else if(h_cnt <= 30+`difference && h_cnt >= 27+`difference && v_cnt <= 48 && v_cnt >= 28  )
          {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
    else if(h_cnt <= 30+`difference   && h_cnt >= 10+`difference  && v_cnt <= 51  && v_cnt >=  48  )
          {vgaRed, vgaGreen, vgaBlue} = 12'hfff;              
    else if(h_cnt <= 13+`difference  && h_cnt >= 10+`difference  && v_cnt <= 48  && v_cnt >= 28   )
          {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
    else if(h_cnt <= 13+`difference  && h_cnt >= 10+`difference  && v_cnt <= 28  && v_cnt >=  8  )
          {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
    else if(h_cnt <= 30+`difference && h_cnt >= 10+`difference && v_cnt <= 28 && v_cnt >=  25 )
          {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
    else
          {vgaRed, vgaGreen, vgaBlue} = 12'h000;
    end    
4'd9: 
    begin 
    if(h_cnt <= 30+`difference && h_cnt >= 10+`difference && v_cnt <= 8 && v_cnt >= 5)
          {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
    else if(h_cnt <= 30+`difference && h_cnt >= 27+`difference && v_cnt <= 28 && v_cnt >= 8)
          {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
    else if(h_cnt <= 30+`difference && h_cnt >= 27+`difference && v_cnt <= 48 && v_cnt >= 28  )
          {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
    else if(h_cnt <= 30+`difference   && h_cnt >= 10+`difference  && v_cnt <= 51   && v_cnt >=  48  )
          {vgaRed, vgaGreen, vgaBlue} = 12'hfff;              
    else if(h_cnt <= 13+`difference  && h_cnt >= 10+`difference  && v_cnt <= 48  && v_cnt >= 28   )
          {vgaRed, vgaGreen, vgaBlue} = 12'h000;
    else if(h_cnt <= 13+`difference  && h_cnt >= 10+`difference  && v_cnt <= 28  && v_cnt >=  8  )
          {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
    else if(h_cnt <= 30+`difference && h_cnt >= 10+`difference && v_cnt <= 28 && v_cnt >=  25 )
          {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
    else
          {vgaRed, vgaGreen, vgaBlue} = 12'h000;
   end     
endcase
end

2'b10:
begin
    case (digit1)
    4'd0: 
    begin 
       if(h_cnt <= 30+2*`difference && h_cnt >= 10+2*`difference && v_cnt <= 8 && v_cnt >= 5)
            {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
       else if(h_cnt <= 30+2*`difference && h_cnt >= 27+2*`difference && v_cnt <= 28 && v_cnt >= 8)
            {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
       else if(h_cnt <= 30+2*`difference && h_cnt >= 27+2*`difference && v_cnt <= 48 && v_cnt >= 28  )
            {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
       else if(h_cnt <= 30+2*`difference   && h_cnt >= 10+2*`difference  && v_cnt <= 51   && v_cnt >=  48  )
            {vgaRed, vgaGreen, vgaBlue} = 12'hfff;              
       else if(h_cnt <= 13+2*`difference  && h_cnt >= 10+2*`difference  && v_cnt <= 48  && v_cnt >= 28   )
            {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
       else if(h_cnt <= 13+2*`difference  && h_cnt >= 10+2*`difference  && v_cnt <= 28  && v_cnt >=  8 )
            {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
       else if(h_cnt <= 30+2*`difference && h_cnt >= 10+2*`difference && v_cnt <= 28 && v_cnt >=  25 )
            {vgaRed, vgaGreen, vgaBlue} = 12'h000;      
       else
            {vgaRed, vgaGreen, vgaBlue} = 12'h0;
     end
    4'd1: 
     begin 
        if(h_cnt <= 30+2*`difference && h_cnt >= 10+2*`difference && v_cnt <= 8 && v_cnt >= 5)
             {vgaRed, vgaGreen, vgaBlue} = 12'h000;
        else if(h_cnt <= 30+2*`difference && h_cnt >= 27+2*`difference && v_cnt <= 28 && v_cnt >= 8)
             {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
        else if(h_cnt <= 30+2*`difference && h_cnt >= 27+2*`difference && v_cnt <= 48 && v_cnt >= 28  )
             {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
        else if(h_cnt <= 30+2*`difference   && h_cnt >= 10+2*`difference  && v_cnt <= 51   && v_cnt >=  48  )
             {vgaRed, vgaGreen, vgaBlue} = 12'h000;              
        else if(h_cnt <= 13+2*`difference  && h_cnt >= 10+2*`difference  && v_cnt <= 48  && v_cnt >= 28   )
             {vgaRed, vgaGreen, vgaBlue} = 12'h000;
        else if(h_cnt <= 13+2*`difference  && h_cnt >= 10+2*`difference  && v_cnt <= 28  && v_cnt >=  8  )
             {vgaRed, vgaGreen, vgaBlue} = 12'h000;
        else if(h_cnt <= 30+2*`difference && h_cnt >= 10+2*`difference && v_cnt <= 28 && v_cnt >=  25 )
             {vgaRed, vgaGreen, vgaBlue} = 12'h000; 
        else
             {vgaRed, vgaGreen, vgaBlue} = 12'h0;
      end
    4'd2: 
     begin 
        if(h_cnt <= 30+2*`difference && h_cnt >= 10+2*`difference && v_cnt <= 8 && v_cnt >= 5)
              {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
        else if(h_cnt <= 30+2*`difference && h_cnt >= 27+2*`difference && v_cnt <= 28 && v_cnt >= 8)
              {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
        else if(h_cnt <= 30+2*`difference && h_cnt >= 27+2*`difference && v_cnt <= 48 && v_cnt >= 28  )
              {vgaRed, vgaGreen, vgaBlue} = 12'h000;
        else if(h_cnt <= 30+2*`difference   && h_cnt >= 10+2*`difference  && v_cnt <= 51   && v_cnt >=  48  )
              {vgaRed, vgaGreen, vgaBlue} = 12'hfff;              
        else if(h_cnt <= 13+2*`difference  && h_cnt >= 10+2*`difference  && v_cnt <= 48  && v_cnt >= 28   )
              {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
        else if(h_cnt <= 13+2*`difference  && h_cnt >= 10+2*`difference  && v_cnt <= 28  && v_cnt >=  8 )
              {vgaRed, vgaGreen, vgaBlue} = 12'h000;
        else if(h_cnt <= 30+2*`difference && h_cnt >= 10+2*`difference && v_cnt <= 28 && v_cnt >=  25 )
              {vgaRed, vgaGreen, vgaBlue} = 12'hfff; 
        else
              {vgaRed, vgaGreen, vgaBlue} = 12'h0;
        end
    4'd3: 
       begin 
        if(h_cnt <= 30+2*`difference && h_cnt >= 10+2*`difference && v_cnt <= 8 && v_cnt >= 5)
              {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
        else if(h_cnt <= 30+2*`difference && h_cnt >= 27+2*`difference && v_cnt <= 28 && v_cnt >= 8)
              {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
        else if(h_cnt <= 30+2*`difference && h_cnt >= 27+2*`difference && v_cnt <= 48 && v_cnt >= 28  )
              {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
        else if(h_cnt <= 30+2*`difference   && h_cnt >= 10+2*`difference  && v_cnt <= 51   && v_cnt >=  48  )
              {vgaRed, vgaGreen, vgaBlue} = 12'hfff;              
        else if(h_cnt <= 13+2*`difference  && h_cnt >= 10+2*`difference  && v_cnt <= 48  && v_cnt >= 28  )
              {vgaRed, vgaGreen, vgaBlue} = 12'h000;
        else if(h_cnt <= 13+2*`difference  && h_cnt >= 10+2*`difference  && v_cnt <= 28  && v_cnt >=  8  )
              {vgaRed, vgaGreen, vgaBlue} = 12'h000;
        else if(h_cnt <= 30+2*`difference && h_cnt >= 10+2*`difference && v_cnt <= 28 && v_cnt >=  25 )
              {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
        else
              {vgaRed, vgaGreen, vgaBlue} = 12'h000;
        end
    4'd4: 
        begin 
        if(h_cnt <= 30+2*`difference && h_cnt >= 10+2*`difference && v_cnt <= 8 && v_cnt >= 5)
              {vgaRed, vgaGreen, vgaBlue} = 12'h000;
        else if(h_cnt <= 30+2*`difference && h_cnt >= 27+2*`difference && v_cnt <= 28 && v_cnt >= 8)
              {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
        else if(h_cnt <= 30+2*`difference && h_cnt >= 27+2*`difference && v_cnt <= 48 && v_cnt >= 28  )
              {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
        else if(h_cnt <= 30+2*`difference   && h_cnt >= 10+2*`difference  && v_cnt <= 51   && v_cnt >=  48  )
              {vgaRed, vgaGreen, vgaBlue} = 12'h000;              
        else if(h_cnt <= 13+2*`difference  && h_cnt >= 10+2*`difference  && v_cnt <= 48  && v_cnt >= 28   )
              {vgaRed, vgaGreen, vgaBlue} = 12'h000;
        else if(h_cnt <= 13+2*`difference  && h_cnt >= 10+2*`difference  && v_cnt <= 28  && v_cnt >=  8 )
              {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
        else if(h_cnt <= 30+2*`difference && h_cnt >= 10+2*`difference && v_cnt <= 28 && v_cnt >=  25 )
              {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
        else
              {vgaRed, vgaGreen, vgaBlue} = 12'h000;
        end
    4'd5: 
        begin 
        if(h_cnt <= 30+2*`difference && h_cnt >= 10+2*`difference && v_cnt <= 8 && v_cnt >= 5)
              {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
        else if(h_cnt <= 30+2*`difference && h_cnt >= 27+2*`difference && v_cnt <= 28 && v_cnt >= 8)
              {vgaRed, vgaGreen, vgaBlue} = 12'h000;
        else if(h_cnt <= 30+2*`difference && h_cnt >= 27+2*`difference && v_cnt <= 48 && v_cnt >= 28  )
              {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
        else if(h_cnt <= 30+2*`difference   && h_cnt >= 10+2*`difference  && v_cnt <= 51   && v_cnt >=  48  )
              {vgaRed, vgaGreen, vgaBlue} = 12'hfff;              
        else if(h_cnt <= 13+2*`difference  && h_cnt >= 10+2*`difference  && v_cnt <= 48  && v_cnt >= 28   )
              {vgaRed, vgaGreen, vgaBlue} = 12'h000;
        else if(h_cnt <= 13+2*`difference  && h_cnt >= 10+2*`difference  && v_cnt <= 28  && v_cnt >=  8  )
              {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
        else if(h_cnt <= 30+2*`difference && h_cnt >= 10+2*`difference && v_cnt <= 28 && v_cnt >=  25)
              {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
        else
              {vgaRed, vgaGreen, vgaBlue} = 12'h000;
        end
    4'd6: 
        begin 
        if(h_cnt <= 30+2*`difference && h_cnt >= 10+2*`difference && v_cnt <= 8 && v_cnt >= 5)
             {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
        else if(h_cnt <= 30+2*`difference && h_cnt >= 27+2*`difference && v_cnt <= 28 && v_cnt >= 8)
             {vgaRed, vgaGreen, vgaBlue} = 12'h000;
        else if(h_cnt <= 30+2*`difference && h_cnt >= 27+2*`difference && v_cnt <= 48 && v_cnt >= 28 )
             {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
        else if(h_cnt <= 30+2*`difference   && h_cnt >= 10+2*`difference  && v_cnt <= 51   && v_cnt >=  48  )
             {vgaRed, vgaGreen, vgaBlue} = 12'hfff;              
        else if(h_cnt <= 13+2*`difference  && h_cnt >= 10+2*`difference  && v_cnt <= 48  && v_cnt >= 28   )
             {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
        else if(h_cnt <= 13+2*`difference  && h_cnt >= 10+2*`difference  && v_cnt <= 28  && v_cnt >=  8  )
             {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
        else if(h_cnt <= 30+2*`difference && h_cnt >= 10+2*`difference && v_cnt <= 28 && v_cnt >=  25)
             {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
        else
             {vgaRed, vgaGreen, vgaBlue} = 12'h000;
        end 
    4'd7: 
        begin 
        if(h_cnt <= 30+2*`difference && h_cnt >= 10+2*`difference && v_cnt <= 8 && v_cnt >= 5)
              {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
        else if(h_cnt <= 30+2*`difference && h_cnt >= 27+2*`difference && v_cnt <= 28 && v_cnt >= 8)
              {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
        else if(h_cnt <= 30+2*`difference && h_cnt >= 27+2*`difference && v_cnt <= 48 && v_cnt >= 28  )
              {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
        else if(h_cnt <= 30+2*`difference   && h_cnt >= 10+2*`difference  && v_cnt <= 51   && v_cnt >=  48  )
              {vgaRed, vgaGreen, vgaBlue} = 12'h000;              
        else if(h_cnt <= 13+2*`difference  && h_cnt >= 10+2*`difference  && v_cnt <= 48  && v_cnt >= 28   )
              {vgaRed, vgaGreen, vgaBlue} = 12'h000;
        else if(h_cnt <= 13+2*`difference  && h_cnt >= 10+2*`difference  && v_cnt <= 28  && v_cnt >=  8  )
              {vgaRed, vgaGreen, vgaBlue} = 12'h000;
        else if(h_cnt <= 30+2*`difference && h_cnt >= 10+2*`difference && v_cnt <= 28 && v_cnt >=  25 )
              {vgaRed, vgaGreen, vgaBlue} = 12'h000;
        else
              {vgaRed, vgaGreen, vgaBlue} = 12'h000;
        end 
    4'd8: 
        begin 
        if(h_cnt <= 30+2*`difference && h_cnt >= 10+2*`difference && v_cnt <= 8 && v_cnt >= 5)
              {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
        else if(h_cnt <= 30+2*`difference && h_cnt >= 27+2*`difference && v_cnt <= 28 && v_cnt >= 8)
              {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
        else if(h_cnt <= 30+2*`difference && h_cnt >= 27+2*`difference && v_cnt <= 48 && v_cnt >= 28  )
              {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
        else if(h_cnt <= 30+2*`difference   && h_cnt >= 10+2*`difference  && v_cnt <= 51   && v_cnt >=  48  )
              {vgaRed, vgaGreen, vgaBlue} = 12'hfff;              
        else if(h_cnt <= 13+2*`difference  && h_cnt >= 10+2*`difference  && v_cnt <= 48  && v_cnt >= 28   )
              {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
        else if(h_cnt <= 13+2*`difference  && h_cnt >= 10+2*`difference  && v_cnt <= 28  && v_cnt >=  8  )
              {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
        else if(h_cnt <= 30+2*`difference && h_cnt >= 10+2*`difference && v_cnt <= 28 && v_cnt >=  25 )
              {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
        else
              {vgaRed, vgaGreen, vgaBlue} = 12'h000;
        end    
    4'd9: 
        begin 
        if(h_cnt <= 30+2*`difference && h_cnt >= 10+2*`difference && v_cnt <= 8 && v_cnt >= 5)
              {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
        else if(h_cnt <= 30+2*`difference && h_cnt >= 27+2*`difference && v_cnt <= 28 && v_cnt >= 8)
              {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
        else if(h_cnt <= 30+2*`difference && h_cnt >= 27+2*`difference && v_cnt <= 48 && v_cnt >= 28  )
              {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
        else if(h_cnt <= 30+2*`difference   && h_cnt >= 10+2*`difference  && v_cnt <= 51   && v_cnt >=  48 )
              {vgaRed, vgaGreen, vgaBlue} = 12'hfff;              
        else if(h_cnt <= 13+2*`difference  && h_cnt >= 10+2*`difference  && v_cnt <= 48  && v_cnt >= 28   )
              {vgaRed, vgaGreen, vgaBlue} = 12'h000;
        else if(h_cnt <= 13+2*`difference  && h_cnt >= 10+2*`difference  && v_cnt <= 28  && v_cnt >=  8  )
              {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
        else if(h_cnt <= 30+2*`difference && h_cnt >= 10+2*`difference && v_cnt <= 28 && v_cnt >=  25 )
              {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
        else
              {vgaRed, vgaGreen, vgaBlue} = 12'h000;
       end 
endcase
end

2'b11:
begin
  case (digit0)
    4'd0:
    begin
        if(h_cnt <= 30+3*`difference && h_cnt >= 10+3*`difference && v_cnt <= 8 && v_cnt >= 5)
             {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
        else if(h_cnt <= 30+3*`difference && h_cnt >= 27+3*`difference && v_cnt <= 28 && v_cnt >= 8)
             {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
        else if(h_cnt <= 30+3*`difference && h_cnt >= 27+3*`difference && v_cnt <= 48 && v_cnt >= 28  )
             {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
        else if(h_cnt <= 30+3*`difference   && h_cnt >= 10+3*`difference  && v_cnt <= 51   && v_cnt >=  48  )
             {vgaRed, vgaGreen, vgaBlue} = 12'hfff;              
        else if(h_cnt <= 13+3*`difference  && h_cnt >= 10+3*`difference  && v_cnt <= 48  && v_cnt >= 28   )
             {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
        else if(h_cnt <= 13+3*`difference  && h_cnt >= 10+3*`difference  && v_cnt <= 28  && v_cnt >=  8  )
             {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
        else if(h_cnt <= 30+3*`difference && h_cnt >= 10+3*`difference && v_cnt <= 28 && v_cnt >=  25 )
             {vgaRed, vgaGreen, vgaBlue} = 12'h000;      
        else
             {vgaRed, vgaGreen, vgaBlue} = 12'h0;
      end
     4'd1: 
      begin 
         if(h_cnt <= 30+3*`difference && h_cnt >= 10+3*`difference && v_cnt <= 8 && v_cnt >= 5)
              {vgaRed, vgaGreen, vgaBlue} = 12'h000;
         else if(h_cnt <= 30+3*`difference && h_cnt >= 27+3*`difference && v_cnt <= 28 && v_cnt >= 8)
              {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
         else if(h_cnt <= 30+3*`difference && h_cnt >= 27+3*`difference && v_cnt <= 48 && v_cnt >= 28 )
              {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
         else if(h_cnt <= 30+3*`difference   && h_cnt >= 10+3*`difference  && v_cnt <= 51   && v_cnt >=  48  )
              {vgaRed, vgaGreen, vgaBlue} = 12'h000;              
         else if(h_cnt <= 13+3*`difference  && h_cnt >= 10+3*`difference  && v_cnt <= 48  && v_cnt >= 28   )
              {vgaRed, vgaGreen, vgaBlue} = 12'h000;
         else if(h_cnt <= 13+3*`difference  && h_cnt >= 10+3*`difference  && v_cnt <= 28  && v_cnt >=  8  )
              {vgaRed, vgaGreen, vgaBlue} = 12'h000;
         else if(h_cnt <= 30+3*`difference && h_cnt >= 10+3*`difference && v_cnt <= 28 && v_cnt >=  25)
              {vgaRed, vgaGreen, vgaBlue} = 12'h000; 
         else
              {vgaRed, vgaGreen, vgaBlue} = 12'h0;
       end
     4'd2: 
      begin 
         if(h_cnt <= 30+3*`difference && h_cnt >= 10+3*`difference && v_cnt <= 8 && v_cnt >= 5)
               {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
         else if(h_cnt <= 30+3*`difference && h_cnt >= 27+3*`difference && v_cnt <= 28 && v_cnt >= 8)
               {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
         else if(h_cnt <= 30+3*`difference && h_cnt >= 27+3*`difference && v_cnt <= 48 && v_cnt >= 28  )
               {vgaRed, vgaGreen, vgaBlue} = 12'h000;
         else if(h_cnt <= 30+3*`difference   && h_cnt >= 10+3*`difference  && v_cnt <= 51   && v_cnt >=  48  )
               {vgaRed, vgaGreen, vgaBlue} = 12'hfff;              
         else if(h_cnt <= 13+3*`difference  && h_cnt >= 10+3*`difference  && v_cnt <= 48  && v_cnt >= 28   )
               {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
         else if(h_cnt <= 13+3*`difference  && h_cnt >= 10+3*`difference  && v_cnt <= 28  && v_cnt >=  8  )
               {vgaRed, vgaGreen, vgaBlue} = 12'h000;
         else if(h_cnt <= 30+3*`difference && h_cnt >= 10+3*`difference && v_cnt <= 28 && v_cnt >=  25 )
               {vgaRed, vgaGreen, vgaBlue} = 12'hfff; 
         else
               {vgaRed, vgaGreen, vgaBlue} = 12'h0;
         end
     4'd3: 
        begin 
         if(h_cnt <= 30+3*`difference && h_cnt >= 10+3*`difference && v_cnt <= 8 && v_cnt >= 5)
               {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
         else if(h_cnt <= 30+3*`difference && h_cnt >= 27+3*`difference && v_cnt <= 28 && v_cnt >= 8)
               {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
         else if(h_cnt <= 30+3*`difference && h_cnt >= 27+3*`difference && v_cnt <= 48 && v_cnt >= 28  )
               {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
         else if(h_cnt <= 30+3*`difference   && h_cnt >= 10+3*`difference  && v_cnt <= 51   && v_cnt >=  48  )
               {vgaRed, vgaGreen, vgaBlue} = 12'hfff;              
         else if(h_cnt <= 13+3*`difference  && h_cnt >= 10+3*`difference  && v_cnt <= 48  && v_cnt >= 28   )
               {vgaRed, vgaGreen, vgaBlue} = 12'h000;
         else if(h_cnt <= 13+3*`difference  && h_cnt >= 10+3*`difference  && v_cnt <= 28  && v_cnt >=  8  )
               {vgaRed, vgaGreen, vgaBlue} = 12'h000;
         else if(h_cnt <= 30+3*`difference && h_cnt >= 10+3*`difference && v_cnt <= 28 && v_cnt >=  25 )
               {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
         else
               {vgaRed, vgaGreen, vgaBlue} = 12'h000;
         end
     4'd4: 
         begin 
         if(h_cnt <= 30+3*`difference && h_cnt >= 10+3*`difference && v_cnt <= 8 && v_cnt >= 5)
               {vgaRed, vgaGreen, vgaBlue} = 12'h000;
         else if(h_cnt <= 30+3*`difference && h_cnt >= 27+3*`difference && v_cnt <= 28 && v_cnt >= 8)
               {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
         else if(h_cnt <= 30+3*`difference && h_cnt >= 27+3*`difference && v_cnt <= 48 && v_cnt >= 28  )
               {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
         else if(h_cnt <= 30+3*`difference   && h_cnt >= 10+3*`difference  && v_cnt <= 51   && v_cnt >=  48  )
               {vgaRed, vgaGreen, vgaBlue} = 12'h000;              
         else if(h_cnt <= 13+3*`difference  && h_cnt >= 10+3*`difference  && v_cnt <= 48  && v_cnt >= 28   )
               {vgaRed, vgaGreen, vgaBlue} = 12'h000;
         else if(h_cnt <= 13+3*`difference  && h_cnt >= 10+3*`difference  && v_cnt <= 28  && v_cnt >=  8  )
               {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
         else if(h_cnt <= 30+3*`difference && h_cnt >= 10+3*`difference && v_cnt <= 28 && v_cnt >=  25 )
               {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
         else
               {vgaRed, vgaGreen, vgaBlue} = 12'h000;
         end
     4'd5: 
         begin 
         if(h_cnt <= 30+3*`difference && h_cnt >= 10+3*`difference && v_cnt <= 8 && v_cnt >= 5)
               {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
         else if(h_cnt <= 30+3*`difference && h_cnt >= 27+3*`difference && v_cnt <= 28 && v_cnt >= 8)
               {vgaRed, vgaGreen, vgaBlue} = 12'h000;
         else if(h_cnt <= 30+3*`difference && h_cnt >= 27+3*`difference && v_cnt <= 48 && v_cnt >= 28  )
               {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
         else if(h_cnt <= 30+3*`difference   && h_cnt >= 10+3*`difference  && v_cnt <= 51   && v_cnt >=  48  )
               {vgaRed, vgaGreen, vgaBlue} = 12'hfff;              
         else if(h_cnt <= 13+3*`difference  && h_cnt >= 10+3*`difference  && v_cnt <= 48  && v_cnt >= 28  )
               {vgaRed, vgaGreen, vgaBlue} = 12'h000;
         else if(h_cnt <= 13+3*`difference  && h_cnt >= 10+3*`difference  && v_cnt <= 28  && v_cnt >=  8  )
               {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
         else if(h_cnt <= 30+3*`difference && h_cnt >= 10+3*`difference && v_cnt <= 28 && v_cnt >=  25 )
               {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
         else
               {vgaRed, vgaGreen, vgaBlue} = 12'h000;
         end
     4'd6: 
         begin 
         if(h_cnt <= 30+3*`difference && h_cnt >= 10+3*`difference && v_cnt <= 8 && v_cnt >= 5)
              {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
         else if(h_cnt <= 30+3*`difference && h_cnt >= 27+3*`difference && v_cnt <= 28 && v_cnt >= 8)
              {vgaRed, vgaGreen, vgaBlue} = 12'h000;
         else if(h_cnt <= 30+3*`difference && h_cnt >= 27+3*`difference && v_cnt <= 48 && v_cnt >= 28  )
              {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
         else if(h_cnt <= 30+3*`difference   && h_cnt >= 10+3*`difference  && v_cnt <= 51   && v_cnt >=  48  )
              {vgaRed, vgaGreen, vgaBlue} = 12'hfff;              
         else if(h_cnt <= 13+3*`difference  && h_cnt >= 10+3*`difference  && v_cnt <= 48  && v_cnt >= 28   )
              {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
         else if(h_cnt <= 13+3*`difference  && h_cnt >= 10+3*`difference  && v_cnt <= 28  && v_cnt >=  8  )
              {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
         else if(h_cnt <= 30+3*`difference && h_cnt >= 10+3*`difference && v_cnt <= 28 && v_cnt >=  25 )
              {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
         else
              {vgaRed, vgaGreen, vgaBlue} = 12'h000;
         end 
     4'd7: 
         begin 
         if(h_cnt <= 30+3*`difference && h_cnt >= 10+3*`difference && v_cnt <= 8 && v_cnt >= 5)
               {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
         else if(h_cnt <= 30+3*`difference && h_cnt >= 27+3*`difference && v_cnt <= 28 && v_cnt >= 8)
               {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
         else if(h_cnt <= 30+3*`difference && h_cnt >= 27+3*`difference && v_cnt <= 48 && v_cnt >= 28  )
               {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
         else if(h_cnt <= 30+3*`difference   && h_cnt >= 10+3*`difference  && v_cnt <= 51   && v_cnt >=  48  )
               {vgaRed, vgaGreen, vgaBlue} = 12'h000;              
         else if(h_cnt <= 13+3*`difference  && h_cnt >= 10+3*`difference  && v_cnt <= 48  && v_cnt >= 28   )
               {vgaRed, vgaGreen, vgaBlue} = 12'h000;
         else if(h_cnt <= 13+3*`difference  && h_cnt >= 10+3*`difference  && v_cnt <= 28  && v_cnt >=  8  )
               {vgaRed, vgaGreen, vgaBlue} = 12'h000;
         else if(h_cnt <= 30+3*`difference && h_cnt >= 10+3*`difference && v_cnt <= 28 && v_cnt >=  25 )
               {vgaRed, vgaGreen, vgaBlue} = 12'h000;
         else
               {vgaRed, vgaGreen, vgaBlue} = 12'h000;
         end 
     4'd8: 
         begin 
         if(h_cnt <= 30+3*`difference && h_cnt >= 10+3*`difference && v_cnt <= 8 && v_cnt >= 5)
               {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
         else if(h_cnt <= 30+3*`difference && h_cnt >= 27+3*`difference && v_cnt <= 28 && v_cnt >= 8)
               {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
         else if(h_cnt <= 30+3*`difference && h_cnt >= 27+3*`difference && v_cnt <= 48&& v_cnt >= 28  )
               {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
         else if(h_cnt <= 30+3*`difference   && h_cnt >= 10+3*`difference  && v_cnt <= 51   && v_cnt >=  48  )
               {vgaRed, vgaGreen, vgaBlue} = 12'hfff;              
         else if(h_cnt <= 13+3*`difference  && h_cnt >= 10+3*`difference  && v_cnt <= 48  && v_cnt >= 28   )
               {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
         else if(h_cnt <= 13+3*`difference  && h_cnt >= 10+3*`difference  && v_cnt <= 28  && v_cnt >=  8  )
               {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
         else if(h_cnt <= 30+3*`difference && h_cnt >= 10+3*`difference && v_cnt <= 28 && v_cnt >=  25 )
               {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
         else
               {vgaRed, vgaGreen, vgaBlue} = 12'h000;
         end    
     4'd9: 
         begin 
         if(h_cnt <= 30+3*`difference && h_cnt >= 10+3*`difference && v_cnt <= 8 && v_cnt >= 5)
               {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
         else if(h_cnt <= 30+3*`difference && h_cnt >= 27+3*`difference && v_cnt <= 28 && v_cnt >= 8)
               {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
         else if(h_cnt <= 30+3*`difference && h_cnt >= 27+3*`difference && v_cnt <= 48 && v_cnt >= 28 )
               {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
         else if(h_cnt <= 30+3*`difference   && h_cnt >= 10+3*`difference  && v_cnt <= 51  && v_cnt >=  48)
               {vgaRed, vgaGreen, vgaBlue} = 12'hfff;              
         else if(h_cnt <= 13+3*`difference  && h_cnt >= 10+3*`difference  && v_cnt <= 48  && v_cnt >= 28 )
               {vgaRed, vgaGreen, vgaBlue} = 12'h000;
         else if(h_cnt <= 13+3*`difference  && h_cnt >= 10+3*`difference  && v_cnt <= 28  && v_cnt >=  8  )
               {vgaRed, vgaGreen, vgaBlue} = 12'hfff;
         else if(h_cnt <= 30+3*`difference && h_cnt >= 10+3*`difference && v_cnt <= 28 && v_cnt >=  25)
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
    else if(h_cnt <= 30)
      en = 2'b00;
    else if(h_cnt <= 70)
      en = 2'b01;
    else if(h_cnt <= 110)
      en = 2'b10;
    else if(h_cnt <= 150)
      en = 2'b11;       
    else
       en = 2'b00;
  end


endmodule
