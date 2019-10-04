`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/04/20 13:54:39
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
    input clk,
    input rst_n,
    input pb1_rst_n,
    input pb2_start_hour,
    input pb3_reset_min,
    input pb4_mode_lap,
    output [7:0] ssd_ctl,
    output [3:0] scan_ctl,
    output reg  LEDs,
    output [1:0]mode_4state
    );
    
    reg [3:0] digit3,digit2,digit1,digit0;
    wire [3:0] digit5_hr_display,digit4_hr_display,digit3_min_display,digit2_min_display,digit1_sec_display,digit0_sec_display;
    wire [3:0] digit3_hr_set,digit2_hr_set,digit1_min_set,digit0_min_set;
    wire [3:0] digit2_min_display_lap,digit3_min_display_lap,digit4_hr_display_lap,digit5_hr_display_lap;
    wire clk_100Hz;
    wire clk_10Hz;
    wire clk_1Hz;
    wire [1:0]clk_ctl;
    wire pb1_rst_n_debounced;
    wire pb1_rst_n_onepulse;
    wire pb2_start_hour_debounced;
    wire pb2_start_hour_onepulse;
    wire pb3_reset_min_debounced;
    wire pb3_reset_min_onepulse;
    wire pb4_mode_lap_debounced;
    wire pb4_mode_lap_onepulse;
    wire pb4_mode_longpush;   
    wire pb4_mode_longpush_debounced;
    wire pb4_mode_longpush_onepulse;
    wire mode_lap;
    wire mode_start;
    wire  [1:0]mode_4state;
    wire pb3_reset_min_foronepulse;
    wire pb2_start_hour_foronepulse;
    wire [3:0]ssd_in;
    
   always@*
            begin 
            if(digit5_hr_display==0&&digit4_hr_display==0&&digit3_min_display==0 && digit2_min_display==0 && digit1_sec_display==0 && digit0_sec_display==0)
              begin
                LEDs = 1'b1;
              end
            else
              begin 
                LEDs = 1'b0;
              end
            end 
            
            
    always@*
            begin
            if(mode_4state == 2'b00)
             begin
                digit3 = digit3_hr_set;
                digit2 = digit2_hr_set;
                digit1 = digit1_min_set;
                digit0 = digit0_min_set;
               end
            else if(mode_4state == 2'b01)
              begin
               
                digit3 = digit5_hr_display_lap;
                digit2 = digit4_hr_display_lap;
                digit1 = digit3_min_display_lap;
                digit0 = digit2_min_display_lap;
              end
            else
              begin
                digit3 = 4'd0;
                digit2 = 4'd0;
                digit1 = digit1_sec_display;
                digit0 = digit0_sec_display;
              end
            end    
            
            //make button more functions
            assign pb3_reset_min_foronepulse = pb3_reset_min_debounced & (mode_4state == 2'b00);
            assign pb2_start_hour_foronepulse = pb2_start_hour_debounced  & (mode_4state == 2'b00) ;
    

Frequency_Divider U0(
     .clk_100Hz(clk_100Hz),
     .clk_10Hz(clk_10Hz),
     .clk_1Hz(clk_1Hz), 
     .clk_ctl(clk_ctl), 
     .clk(clk), 
     .rst_n(rst_n)
   );
   
//pb1  for rst_n(need fsm)       
debounce_circuit Upb1_debounce(
       .clk(clk_100Hz), 
       .rst_n(rst_n),  
       .pb_in(pb1_rst_n), 
       .pb_debounced(pb1_rst_n_debounced)
       ); 
       
one_pulse Upb1_onepulse(
       .clk(clk_100Hz), 
       .rst_n(rst_n),
       .in_trig(pb1_rst_n_debounced), 
       .out_pulse(pb1_rst_n_onepulse) 
         );         
           
fsm_2state Upb1_fsm(
       .clk(clk_100Hz),
       .rst_n(rst_n),  
       .in(pb1_rst_n_onepulse),
       .mode_enable(rst_mode)

        );      
        
//pb2  for start/srop and hour controll
debounce_circuit Upb2_debounce(
       .clk(clk_100Hz), 
       .rst_n(rst_mode),  
       .pb_in(pb2_start_hour), 
       .pb_debounced(pb2_start_hour_debounced)
       );         

one_pulse Upb2_onepulse(
       .clk(clk_100Hz), 
       .rst_n(rst_mode),
       .in_trig(pb2_start_hour_debounced), 
       .out_pulse(pb2_start_hour_onepulse) 
         );   
         
fsm_2state Upb2_start(
       .mode_enable(mode_start),  
       .in(pb2_start_hour_onepulse),
       .clk(clk_100Hz), 
       .rst_n(rst_n)  
       );  
                      
//pb3 for reset and min/sec controll
debounce_circuit Upb3_debounce(
       .clk(clk_100Hz), 
       .rst_n(rst_mode),  
       .pb_in(pb3_reset_min), 
       .pb_debounced(pb3_reset_min_debounced)
       );         

one_pulse Upb3_onepulse(
       .clk(clk_100Hz), 
       .rst_n(rst_mode),
       .in_trig(pb3_reset_min_debounced), 
       .out_pulse(pb3_reset_min_onepulse) 
        );    
        
//pb4 long press for change; short press for lapping (need fsm)
debounce_circuit Upb4_debounce(
       .clk(clk_100Hz), 
       .rst_n(rst_mode),  
       .pb_in(pb4_mode_lap), 
       .pb_debounced(pb4_mode_lap_debounced)
       );         

one_pulse Upb4_onepulse(
       .clk(clk_100Hz), 
       .rst_n(rst_mode),
       .in_trig(pb4_mode_lap_debounced), 
       .out_pulse(pb4_mode_lap_onepulse) 
        ); 

fsm_2state Upb4_lap(
       .clk(clk_100Hz), 
       .rst_n(rst_mode),
       .mode_enable(mode_lap),  
       .in(pb4_mode_lap_onepulse)

       ); 
//long reg for lapping       
load_reg U00(
       .out(digit2_min_display_lap),
       .in(digit2_min_display),
       .load_n(mode_lap),
       .clk(clk_100Hz),
       .rst_n(rst_mode)
       );
              
load_reg U01(
        .out(digit3_min_display_lap),
        .in(digit3_min_display),
        .load_n(mode_lap),
        .clk(clk_100Hz),
        .rst_n(rst_mode)
        );
       
load_reg U02(
         .out(digit4_hr_display_lap),
         .in(digit4_hr_display),
         .load_n(mode_lap),
         .clk(clk_100Hz),
         .rst_n(rst_mode)
        );
              
load_reg U03(
          .out(digit5_hr_display_lap),
          .in(digit5_hr_display),
          .load_n(mode_lap),
          .clk(clk_100Hz),
          .rst_n(rst_mode)
         );        
// for pb4_mode  longpush
longpush UQQ(
       .clk(clk_1Hz),
       .rst_n(rst_mode),
       .button(pb4_mode_lap),
       .longpush(pb4_mode_longpush)
       );
       
debounce_circuit Upb4_longpush_debounce(
         .clk(clk_100Hz), 
         .rst_n(rst_mode),  
         .pb_in(pb4_mode_longpush), 
         .pb_debounced(pb4_mode_longpush_debounced)
         );       
 
one_pulse Upb4_longpush_onepulse(
         .clk(clk_100Hz), 
         .rst_n(rst_mode),
         .in_trig(pb4_mode_longpush_debounced), 
         .out_pulse(pb4_mode_longpush_onepulse) 
         ); 
                                                   
fsm_4state Upb4_longpush_fsm(
       .mode_enable(mode_4state),  
       .in(pb4_mode_longpush_onepulse),
       .clk(clk_100Hz), 
       .rst_n(rst_mode)  
        );  
        
   
                           
// upcounter_2d *2  for set up initial numbers
Upocounter_2d Uhr(
      .digit1(digit3_hr_set),  
      .digit0(digit2_hr_set),  
      .carry_in(pb2_start_hour_debounced & (mode_4state ==2'b00)),
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
      .carry_in(pb3_reset_min_debounced & (mode_4state ==2'b00)),
      .clk(clk_100Hz),  
      .rst_n(rst_n), 
      .initial_1(4'd0),
      .initial_0(4'd0),
      .limit1_individual(4'd5),
      .limit0_individual(4'd9),
      .limit1_whole(4'd5),
      .limit0_whole(4'd9)
       );  
       
// Downcounter_6d for displaying
Downcounter_6d Udisplay(
      .digit5(digit5_hr_display),
      .digit4(digit4_hr_display),
      .digit3(digit3_min_display),
      .digit2(digit2_min_display),
      .digit1(digit1_sec_display),  
      .digit0(digit0_sec_display),  
      .clk(clk_100Hz),  
      .rst_n(rst_mode), 
      .restart(pb3_reset_min_onepulse),
      .borrow_in(mode_start), 
      .initial_5(digit3_hr_set),
      .initial_4(digit2_hr_set),
      .initial_3(digit1_min_set),
      .initial_2(digit0_min_set),
      .initial_1(4'd0),
      .initial_0(4'd0)
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
