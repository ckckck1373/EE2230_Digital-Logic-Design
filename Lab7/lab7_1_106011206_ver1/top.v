`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/04/15 21:05:35
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
    input pb_stop,
    input pb_lap,
    input rst_n,
    input clk
    );

    wire clk_100Hz;
    wire clk_10Hz;
    wire clk_1Hz;
    wire [1:0]clk_ctl;
    wire pb_stop_debounced;
    wire pb_lap_debounced;
    wire pb_stop_onepulse;
    wire pb_lap_onepulse;
    wire [3:0]sec1,sec0;
    wire [3:0]min1,min0;
    wire carry_sec;
    wire carry_min;
    wire stop;
    wire lap;
    wire [3:0]digit0,digit1,digit2,digit3;
    wire [3:0]ssd_in;
    reg pb_rst_debounced;
    
 
    always@(posedge clk_1Hz or negedge rst_n)
        if(~rst_n)
          begin
            pb_rst_debounced <= 1'b0;
          end
        else
          begin
             pb_rst_debounced <= pb_rst_debounced_tmp;
          end

        
Frequency_Divider U0(
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
    .pb_in(pb_stop), 
    .pb_debounced(pb_stop_debounced)
    );

debounce_circuit U2(
    .clk(clk_100Hz), 
    .rst_n(rst_n), 
    .pb_in(pb_lap), 
    .pb_debounced(pb_lap_debounced)
    );

debounce_circuit U3(
    .clk(clk_100Hz), 
    .rst_n(rst_n), 
    .pb_in(pb_lap), 
    .pb_debounced(pb_rst_debounced_tmp)
    );
    
one_pulse U4(
  .clk(clk_100Hz), 
  .rst_n(rst_n),
  .in_trig(pb_stop_debounced), 
  .out_pulse(pb_stop_onepulse) 
);

one_pulse U5(
  .clk(clk_100Hz), 
  .rst_n(rst_n),
  .in_trig(pb_lap_debounced), 
  .out_pulse(pb_lap_onepulse) 
);  

fsm_2state U6(
  .mode_enable(stop),  
  .in(pb_stop_onepulse),
  .clk(clk_100Hz), 
  .rst_n(rst_n)  
);

fsm_2state U7(
  .mode_enable(lap),  
  .in(pb_lap_onepulse),
  .clk(clk_100Hz), 
  .rst_n(rst_n)  
);

UpCounter_2d U8(
  .digit1(sec1),  
  .digit0(sec0),  
  .carry_out(carry_sec),
  .carry_in(4'd1),
  .clk(clk_1Hz),  
  .rst_n(rst_n), 
  .pb_rst_debounced(pb_rst_debounced),
  .mode_enable(stop),
  .limit1(4'd5),
  .limit0(4'd9),
  .initial1(4'd0),
  .initial0(4'd0)
);

UpCounter_2d U9(
  .digit1(min1),  
  .digit0(min0),  
  .carry_out(carry_min),
  .carry_in(carry_sec),
  .clk(clk_1Hz),  
  .rst_n(rst_n), 
  .pb_rst_debounced(pb_rst_debounced),
  .mode_enable(stop),
  .limit1(4'd5),
  .limit0(4'd9),
  .initial1(4'd0),
  .initial0(4'd0)
);

load_reg U10(
    .out(digit0),
    .in(sec0),
    .load_n(lap),
    .clk(clk_100Hz),
    .rst_n(rst_n)
    );
    
load_reg U11(
    .out(digit1),
    .in(sec1),
    .load_n(lap),
    .clk(clk_100Hz),
    .rst_n(rst_n)
    );
        
load_reg U12(
    .out(digit2),
    .in(min0),
    .load_n(lap),
    .clk(clk_100Hz),
    .rst_n(rst_n)
    ); 
    
load_reg U13(
    .out(digit3),
    .in(min1),
    .load_n(lap),
    .clk(clk_100Hz),
    .rst_n(rst_n)
    );  
      
scan_ctl U14(
    .scan_ctl(scan_ctl), 
    .ssd_in(ssd_in),
    .in0(digit0), 
    .in1(digit1), 
    .in2(digit2), 
    .in3(digit3),  
    .ssd_ctl_en(clk_ctl) 
    );  

Display U15(
    .ssd_in(ssd_in),
    .ssd_ctl(ssd_ctl)
    );   
           
endmodule
