`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/04/13 21:52:38
// Design Name: 
// Module Name: top
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


module top(
    output [7:0]ssd_ctl,
    output [3:0]scan_ctl,
    output mode,
    output test,
    input switch_year,
    input switch_sec,
    input rst_n,
    input clk,
    input pb_mode  
    );
 wire clk_100000Hz;
 wire clk_1000Hz;
 wire clk_100Hz;
 wire clk_10Hz;
 wire clk_1Hz;
 wire [1:0]clk_ctl;
 reg [3:0]digit3;
 reg [3:0]digit2;
 reg [3:0]digit1;
 reg [3:0]digit0;
 reg leapyear;
 wire pb_mode_debounced;
 wire pb_mode_onepulse;
 wire [3:0] digit1_sec;
 wire [3:0] digit0_sec;
 wire carry_sec;
 wire [3:0] digit3_24;
 wire [3:0] digit2_24;
 wire [3:0] digit1_24;
 wire [3:0] digit0_24;
 wire [3:0] digit3_12;
 wire [3:0] digit2_12;
 wire [3:0] digit1_12;
 wire [3:0] digit0_12;
 wire carry_hour_24;
 wire carry_hour_12;
 wire [3:0] digit3_year;
 wire [3:0] digit2_year;
 wire [3:0] digit1_year;
 wire [3:0] digit0_year;
 wire [3:0] digit3_month;
 wire [3:0] digit2_month;
 wire [3:0] digit1_day;
 wire [3:0] digit0_day;
 wire carry_month;
 wire [3:0] ssd_in;
 wire  pm_counter_mode;
 
 
always@*
     begin
     if(switch_year==1'b1 && switch_sec==1'b0 )
     begin
         digit3 = digit3_year;
         digit2 = digit2_year;
         digit1 = digit1_year;
         digit0 = digit0_year;
     end
     else if (switch_year==1'b0 && switch_sec ==1'b1)
     begin
         digit3 = 4'd0;
         digit2 = 4'd0;
         digit1 = digit1_sec;
         digit0 = digit0_sec;
     end
     else if (switch_year==1'b0 && switch_sec ==1'b0 && mode ==1'b1)
     begin
         digit3 = digit3_24;
         digit2 = digit2_24;
         digit1 = digit1_24;
         digit0 = digit0_24;
      end
      else if (switch_year==1'b0 && switch_sec ==1'b0 && mode ==1'b0)
      begin
         digit3 = digit3_12;
         digit2 = digit2_12;
         digit1 = digit1_12;
         digit0 = digit0_12;
       end
       else if (switch_year==1'b1 && switch_sec==1'b1 )
       begin
         digit3 = digit3_month;
         digit2 = digit2_month;
         digit1 = digit1_day;
         digit0 = digit0_day;
       end
       else
       begin
         digit3 = digit3_month;
         digit2 = digit2_month;
         digit1 = digit1_day;
         digit0 = digit0_day; 
       end
     end
       
always @*
     begin
     if((digit1_year * 4'd10+digit0_year)%4'd4 != 4'd0)
         leapyear = 1'd0;
     else if(digit1_year != 4'd0 || digit0_year != 4'd0)
         leapyear = 1'd1;
     else if((digit3_year * 4'd10 + digit2_year )%4'd4 != 4'd0)
         leapyear = 1'd0;
     else
         leapyear = 1'd1;
     end
          
          
 assign  pm_counter_mode = ({digit3_24,digit2_24,digit1_24,digit0_24}>16'b0001_0010_0000_0000)?1:0;
       
Frequency_Divider U0(
  .clk_100000Hz(clk_100000Hz),
  .clk_1000Hz(clk_1000Hz),
  .clk_100Hz(clk_100Hz),
  .clk_10Hz(clk_10Hz),
  .clk_1Hz(clk_1Hz), 
  .clk_ctl(clk_ctl), 
  .clk(clk), 
  .rst_n(rst_n) 
);


debounce_circuit U1(
  .clk(clk_100Hz), 
  .rst_n(rst_n), 
  .pb_in(pb_mode), 
  .pb_debounced(pb_mode_debounced)
);

one_pulse U2(
  .clk(clk_100Hz), 
  .rst_n(rst_n),
  .in_trig(pb_mode_debounced), 
  .out_pulse(pb_mode_onepulse) 
);

fsm_2state U3(
  .clk(clk_100Hz), 
  .rst_n(rst_n),  
  .in(pb_mode_onepulse),
  .mode_enable(mode)
);

UpCounter_2d Usec(
    .digit1(digit1_sec),
    .digit0(digit0_sec),
    .carry_out(carry_sec),
    .carry_in(4'd1),
    .initial1(4'd0),
    .initial0(4'd0),
    .clk(clk_100000Hz),
    .rst_n(rst_n),
    .limit1(4'd5),
    .limit0(4'd9)
    );

Upocounter_4d U24(
    .digit3(digit3_24),
    .digit2(digit2_24),
    .digit1(digit1_24),  
    .digit0(digit0_24),  
    .clk(clk_100000Hz),  
    .rst_n(rst_n), 
    .carry_in(carry_sec),
    .carry_out(carry_hour_24),
    .initial_3(4'd0),
    .initial_2(4'd0),
    .initial_1(4'd0),
    .initial_0(4'd0),
    .restart_value3(4'd0),
    .restart_value2(4'd0),
    .restart_value1(4'd0),
    .restart_value0(4'd0),
    .limit3(4'd2),
    .limit2(4'd3),
    .limit1(4'd5),
    .limit0(4'd9)
    );
    
 Upocounter_4d U12(
      .digit3(digit3_12),
      .digit2(digit2_12),
      .digit1(digit1_12),  
      .digit0(digit0_12),  
      .clk(clk_100000Hz),  
      .rst_n(rst_n), 
      .carry_in(carry_sec),
      .carry_out(carry_hour_12),
      .initial_3(4'd1),
      .initial_2(4'd2),
      .initial_1(4'd0),
      .initial_0(4'd0),
      .restart_value3(4'd0),
      .restart_value2(4'd1),
      .restart_value1(4'd0),
      .restart_value0(4'd0),
      .limit3(4'd1),
      .limit2(4'd2),
      .limit1(4'd5),
      .limit0(4'd9)
    );   
    
date U4(
       .digit3_month(digit3_month),
       .digit2_month(digit2_month),
       .digit1_day(digit1_day),
       .digit0_day(digit0_day),
       .carry_out(carry_month),
       .carry_in(carry_hour_24),
       .carry_day(test),
       .leapyear(leapyear),
       .clk(clk_100000Hz),
       .rst_n(rst_n)
     );
           
Upocounter_4d Uyear(
      .digit3(digit3_year),
      .digit2(digit2_year),
      .digit1(digit1_year),  
      .digit0(digit0_year),  
      .carry_out(carry_year),
      .carry_in(carry_month),
      .clk(clk_100000Hz),
      .rst_n(rst_n), 
      .initial_3(4'd2),
      .initial_2(4'd0),
      .initial_1(4'd0),
      .initial_0(4'd0),
      .limit3(4'd2), //Total limit but not individual limit 
      .limit2(4'd2),
      .limit1(4'd0),
      .limit0(4'd0)
    );  
    
scan_ctl U5(
    .scan_ctl(scan_ctl), 
    .ssd_in(ssd_in),
    .in0(digit3), 
    .in1(digit2), 
    .in2(digit1), 
    .in3(digit0),  
    .ssd_ctl_en(clk_ctl)  
    );



Display U6(
    .ssd_in(ssd_in),
    .am_pm(pm_counter_mode),
    .ssd_ctl(ssd_ctl)
    );
         
endmodule
