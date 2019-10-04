//************************************************************************
// Filename      : stopwatch_disp.v
// Author        : hp
// Function      : stopwatch display unit
// Last Modified : Date: 2009-03-10
// Revision      : Revision: 1
// Copyright (c), Laboratory for Reliable Computing (LaRC), EE, NTHU
// All rights reserved
//************************************************************************
`include "global.v"
module stopwatch(
  segs, // 7 segment display control
  ssd_ctl, // scan control for 7-segment display
  clk, // clock
  rst_n, // low active reset
  in, // input control for FSM
  light,
  mode_enable
);

output [14:0] light;

output [3:0]ssd_ctl;
output [7:0]segs;
input clk; // clock
input rst_n; // low active reset
input in; // input control for FSM
input mode_enable;

wire [`SSD_SCAN_CTL_BIT_WIDTH-1:0] ssd_ctl_en; // divided output for ssd scan control
wire clk_1; // divided clock
wire clk_100;

wire count_enable; // if count is enabled

wire [`BCD_BIT_WIDTH-1:0] dig0,dig1,dig2; // second counter output
wire [`BCD_BIT_WIDTH-1:0] ssd_in; // input to 7-segment display decoder

//**************************************************************
// Functional block
//**************************************************************
wire pb_in_1pulse;
wire pb_rst_debounced;

reg [3:0] initial_0;
reg [3:0] initial_1;
reg [3:0] initial_2;


always@*
begin
    if(mode_enable==1'b0)
    begin
        initial_0 = 4'd0;
        initial_1 = 4'd3;
        initial_2 = 4'd0;
    end
    else
    begin
        initial_0 = 4'd0;
        initial_1 = 4'd0;
        initial_2 = 4'd1;
    end
end

btn_one_pulse U0(
  .clk(clk), // Clock from crystal
  .rst_n(rst_n), //active low reset
  .pb_in(in), //push button input
  //led_1, // 1Hz divided clock
  //led_pb, // LED display output (push button)
  .led_1pulse(pb_in_1pulse), // LED display output (1 pulse)
  .clk_100(clk_100)
);


btn_rst U1(
  .clk(clk), // Clock from crystal
  .rst_n(rst_n), //active low reset
  .pb_in(in), //push button input
  //led_1, // 1Hz divided clock
  //led_pb, // LED display output (push button)
  .pb_debounced(pb_rst_debounced)
);

// frequency divider 1/(2^27)
freqdiv27 U_FD(
  .clk_out(clk_1), // divided clock
  .clk_ctl(ssd_ctl_en), // divided clock for scan control 
  .clk(clk), // clock from the crystal
  .rst_n(rst_n) // low active reset
);

// finite state machine
fsm_2state U_fsm(
  .mode_enable(count_enable),  // if counter is enabled 
  .in(pb_in_1pulse), //input control
  .clk(clk_100), // global clock signal
  .rst_n(rst_n)  // low active reset
);

// stopwatch module
downcounter_3d U_sw(
  .digit2(dig2),
  .digit1(dig1),  // 2nd digit of the down counter
  .digit0(dig0),  // 1st digit of the down counter
  .clk(clk_1),  // global clock
  .rst_n(rst_n),  // low active reset
  .en(count_enable), // enable/disable for the stopwatch
  .pb_rst_debounced(pb_rst_debounced),
  .light(light),
  .mode_enable(mode_enable),
  .initial_0(initial_0),
  .initial_1(initial_1),
  .initial_2(initial_2)
);

scan_ctl U_SC(
   .ssd_ctl(ssd_ctl), // ssd display control signal 
   .ssd_in(ssd_in), // output to ssd display
   .in0(4'b1111), // 1st input
   .in1(dig2), // 2nd input
   .in2(dig1), // 3rd input
   .in3(dig0),  // 4th input
   .ssd_ctl_en(ssd_ctl_en)// divided clock for scan control
   );
        

display U_display(
   .segs(segs), // 7-segment display output
   .bin(ssd_in)  // BCD number input
    );       

endmodule
