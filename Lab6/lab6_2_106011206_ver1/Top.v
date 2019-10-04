`timescale 1ns / 1ps

module Top(
  input clk,
  input rst_n,
  input switch_year,
  output [3:0]state,
  output [7:0]ssd_ctl,
  output [3:0]scan_ctl
);

    wire clk_100Hz;
    wire clk_10Hz;
    wire clk_1Hz;
    wire [1:0] clk_ctl;
    wire [3:0] digit3_year;
    wire [3:0] digit2_year;
    wire [3:0] digit0_day;
    wire [3:0] digit1_day;
    wire [3:0] digit2_month;
    wire [3:0] digit3_month;
    wire carry_month;
    wire [3:0] mode1;
    wire [3:0] mode0;
    wire carry_day_test;
    wire [3:0] ssd_in;

    
    reg [3:0] digit0;
    reg [3:0] digit1;
    reg [3:0] digit2;
    reg [3:0] digit3;
    reg restart_24;
    reg restart_12;
    
    always@*
    if(switch_year==1'b1)
    begin
        digit3 = digit3_year;
        digit2 = digit2_year;
        digit1 = 4'd0;
        digit0 = 4'd0;
    end
    else
    begin
        digit3 =  digit3_month;
        digit2 =  digit2_month;
        digit1 =  digit1_day;
        digit0 =  digit0_day;
     end
                  
Frequency_Divider U0(
  .clk(clk),
  .clk_100Hz(clk_100Hz),
  .clk_10Hz(clk_10Hz),
  .clk_1Hz(clk_1Hz), 
  .clk_ctl(clk_ctl), 
  .rst_n(rst_n) 
);

fsm_2state U3(
  .clk(clk_10Hz), 
  .rst_n(rst_n),  
  .in(carry_day_test),
  .state(state),
  .mode_enable1(mode1),
  .mode_enable0(mode0)
);

Upocounter_2d Uyear(
  .digit1(digit3_year),  
  .digit0(digit2_year),  
  .carry_out(carry_year),
  .carry_in(carry_month),
  .clk(clk_10Hz),  
  .rst_n(rst_n),  
  .initial_1(4'd0),
  .initial_0(4'd0)
);

Upocounter_4d UMonth_Day(
  .digit3(digit3_month),
  .digit2(digit2_month),
  .digit1(digit1_day),  
  .digit0(digit0_day),  
  .clk(clk_10Hz),  
  .rst_n(rst_n), 
  .carry_month(carry_month),
  .carry_day_test(carry_day_test),
  .initial_3(4'd0),
  .initial_2(4'd1),
  .initial_1(4'd0),
  .initial_0(4'd1),
  .limit1(mode1),
  .limit0(mode0)
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
    .ssd_ctl(ssd_ctl)
    );

endmodule

