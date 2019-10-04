`timescale 1ns / 1ps

module Top(
  input clk,
  input rst_n,
  input pb_mode,
  input switch_sec,
  output [7:0]ssd_ctl,
  output [3:0]scan_ctl,
  output mode
);

    wire clk_100Hz;
    wire clk_1Hz;
    wire [1:0] clk_ctl;
    wire pb_mode_debounced;
    wire pb_mode_onepulse;
    wire [3:0] digit1_sec;
    wire [3:0] digit0_sec;
    wire [3:0] digit0_24;
    wire [3:0] digit1_24;
    wire [3:0] digit2_24;
    wire [3:0] digit3_24;
    wire [3:0] digit0_12;
    wire [3:0] digit1_12;
    wire [3:0] digit2_12;
    wire [3:0] digit3_12;
    wire carry_min;
    wire  [3:0] ssd_in;
    wire  [3:0] limit3;
    wire  [3:0] limit2;
    wire  [3:0] limit1;
    wire  [3:0] limit0;
    wire  pm_counter_mode;
    
    reg [3:0] digit0;
    reg [3:0] digit1;
    reg [3:0] digit2;
    reg [3:0] digit3;
    reg pm_counter;

    always@*
    if(mode==1'b0 && switch_sec ==1'b0)
    begin
        digit3 = digit3_24;
        digit2 = digit2_24;
        digit1 = digit1_24;
        digit0 = digit0_24;
    end
    else if (mode==1'b1 && switch_sec ==1'b0)
    begin
        digit3 = digit3_12;
        digit2 = digit2_12;
        digit1 = digit1_12;
        digit0 = digit0_12;
    end
    else
    begin
        digit3 = 4'b0000;
        digit2 = 4'b0000;
        digit1 = digit1_sec;
        digit0 = digit0_sec;
     end
     
assign  pm_counter_mode = ({digit3_24,digit2_24,digit1_24,digit0_24}>16'b0001_0010_0000_0000)?1:0;
 
   
Frequency_Divider U0(
  .clk(clk),
  .clk_100Hz(clk_100Hz),
  .clk_1Hz(clk_1Hz), 
  .clk_ctl(clk_ctl), 
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


Upocounter_2d Usec(
  .digit1(digit1_sec),  
  .digit0(digit0_sec),  
  .carry_min(carry_min),
  .clk(clk_100Hz),  
  .rst_n(rst_n),  
  .initial_1(4'd0),
  .initial_0(4'd0)
);

Upocounter_4d U24(
  .digit3(digit3_24),
  .digit2(digit2_24),
  .digit1(digit1_24),  
  .digit0(digit0_24),  
  .clk(clk_100Hz),  
  .rst_n(rst_n), 
  .carry_min(carry_min),
  .initial_3(4'd0),
  .initial_2(4'd0),
  .initial_1(4'd0),
  .initial_0(4'd0),
  .restart_value3(4'd0),
  .restart_value2(4'd0),
  .restart_value1(4'd0),
  .restart_value0(4'd0),
  .limit3(4'd2),
  .limit2(4'd4),
  .limit1(4'd0),
  .limit0(4'd0)
);

Upocounter_4d U12(
  .digit3(digit3_12),
  .digit2(digit2_12),
  .digit1(digit1_12),  
  .digit0(digit0_12),  
  .clk(clk_100Hz),  
  .rst_n(rst_n), 
  .carry_min(carry_min),
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


scan_ctl U4(
    .scan_ctl(scan_ctl), 
    .ssd_in(ssd_in),
    .in3(digit0), 
    .in2(digit1), 
    .in1(digit2), 
    .in0(digit3),  
    .ssd_ctl_en(clk_ctl) 
);

Display U5(
    .ssd_in(ssd_in),
    .am_pm(pm_counter_mode),
    .ssd_ctl(ssd_ctl)
    );

endmodule

