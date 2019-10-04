`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/04/20 09:31:58
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
    input pb_start_stop_min,
    input pb_pause_resume_hour,
    input switch_mode,
    input clk,
    input rst_n,
    output reg [15:0]LEDs,
    output [7:0]ssd_ctl,
    output [3:0]scan_ctl
    );
    
    wire pb_start_stop_min_foronepulse; //try to not change the mode when modifing the initial value
    wire pb_pause_resume_hour_foronepulse;
    
    reg [3:0]digit3;
    reg [3:0]digit2;
    reg [3:0]digit1;
    reg [3:0]digit0;
    wire [3:0]digit3_display;
    wire [3:0]digit2_display;
    wire [3:0]digit1_display;
    wire [3:0]digit0_display;
    wire clk_100Hz;
    wire clk_10Hz;
    wire clk_1Hz;
    wire [1:0]clk_ctl;
    wire [3:0]digit3_hr_set;
    wire [3:0]digit2_hr_set;
    wire [3:0]digit1_min_set;
    wire [3:0]digit0_min_set;
    wire pb_start_stop_min_debounced;
    wire pb_start_stop_min_onepulse;
    wire pb_pause_resume_hour_debounced;
    wire pb_pause_resume_hour_onepulse;
    wire mode;
    wire [3:0]ssd_in;

    assign pb_start_stop_min_foronepulse = pb_start_stop_min_debounced & ~switch_mode;
    assign pb_pause_resume_hour_foronepulse = pb_pause_resume_hour_debounced  & ~switch_mode;
    
    always@*
        begin 
        if(digit3_display==0 && digit2_display==0 && digit1_display==0 && digit0_display==0)
          begin
            LEDs = 16'b1111111111111111;
          end
        else
          begin 
            LEDs = 16'b0000000000000000;
          end
        end
     
    always@*
         begin
         if(switch_mode==1'b1)
           begin
             digit3 = digit3_hr_set;
             digit2 = digit2_hr_set;
             digit1 = digit1_min_set;
             digit0 = digit0_min_set;
            end
          else
            begin
             digit3 = digit3_display;
             digit2 = digit2_display;
             digit1 = digit1_display;
             digit0 = digit0_display; 
             end
           end
         
         
Frequency_Divider U0(
      .clk_100Hz(clk_100Hz),
      .clk_10Hz(clk_10Hz),
      .clk_1Hz(clk_1Hz), 
      .clk_ctl(clk_ctl), 
      .clk(clk), 
      .rst_n(rst_n)
    );
    
debounce_circuit Upb_start0(
    .clk(clk_100Hz), 
    .rst_n(rst_n), 
    .pb_in(pb_start_stop_min), 
    .pb_debounced(pb_start_stop_min_debounced)
    );
 
one_pulse Upb_start1(
     .clk(clk_100Hz), 
     .rst_n(rst_n),
     .in_trig(pb_start_stop_min_foronepulse), 
     .out_pulse(pb_start_stop_min_onepulse) 
    );  

debounce_circuit Upause0(
    .clk(clk_100Hz), 
    .rst_n(rst_n), 
    .pb_in(pb_pause_resume_hour), 
    .pb_debounced(pb_pause_resume_hour_debounced)
    );
 
one_pulse Upb_pause1(
     .clk(clk_100Hz), 
     .rst_n(rst_n),
     .in_trig(pb_pause_resume_hour_foronepulse), 
     .out_pulse(pb_pause_resume_hour_onepulse) 
    );  
  
fsm_2state Upause(
    .mode_enable(mode),  
    .in(pb_start_stop_min_onepulse),
    .clk(clk_100Hz), 
    .rst_n(rst_n)  
    );  
    
Upocounter_2d Uhr(
      .digit1(digit3_hr_set),  
      .digit0(digit2_hr_set),  
      .carry_in(pb_pause_resume_hour_debounced&switch_mode),
      .clk(clk_100Hz),  
      .rst_n(rst_n), 
      .initial_1(4'd0),
      .initial_0(4'd0),
      .limit1_individual(4'd2),
      .limit0_individual(4'd9),
      .limit1_whole(4'd2),
      .limit0_whole(4'd3)
       );  
       
Upocounter_2d Umin(
      .digit1(digit1_min_set),  
      .digit0(digit0_min_set),  
      .carry_in(pb_start_stop_min_debounced&switch_mode),
      .clk(clk_100Hz),  
      .rst_n(rst_n), 
      .initial_1(4'd0),
      .initial_0(4'd0),
      .limit1_individual(4'd5),
      .limit0_individual(4'd9),
      .limit1_whole(4'd5),
      .limit0_whole(4'd9)
       );  
       
Downcountercounter_4d Ucount(
      .digit3(digit3_display),
      .digit2(digit2_display),
      .digit1(digit1_display),  
      .digit0(digit0_display),  
      .clk(clk_100Hz),  
      .rst_n(rst_n), 
      .restart(pb_pause_resume_hour_onepulse),
      .borrow_in(mode), 
      .initial_3(digit3_hr_set),
      .initial_2(digit2_hr_set),
      .initial_1(digit1_min_set),
      .initial_0(digit0_min_set)
      );      
      
scan_ctl U11(
      .scan_ctl(scan_ctl), 
      .ssd_in(ssd_in),
      .in0(digit0), 
      .in1(digit1), 
      .in2(digit2), 
      .in3(digit3),  
      .ssd_ctl_en(clk_ctl) 
      ); 
      
Display U12(
      .ssd_in(ssd_in),
      .ssd_ctl(ssd_ctl)
       );     
endmodule
