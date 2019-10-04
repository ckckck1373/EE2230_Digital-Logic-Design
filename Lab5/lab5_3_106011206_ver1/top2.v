`timescale 1ns / 1ps
module top2(
  clk, // Clock from crystal
  rst_n, //active low reset
  pb_in, //push button input
  led_pb, // LED display output (push button)
  led_1pulse, // LED display output (1 pulse)
  clk_1,
  clk_100
);

// Declare I/Os
input clk; // Clock from crystal
input rst_n; //active low reset
input pb_in; //push button input
output led_pb; // LED display output (push button)
output led_1pulse; // LED display output (1 pulse)
output clk_1;
output clk_100;
// Declare internal nodes
wire pb_debounced; // push button debounced output
wire clk_100;
// Clock generator module
clock_generator U_cg(
  .clk(clk), // clock from crystal
  .rst_n(rst_n), // active low reset
  .clk_1(clk_1), // generated 1 Hz clock
  .clk_100(clk_100) // generated 100 Hz clock
);

// debounce circuit
debounce_circuit U_dc(
  .clk(clk_1), // clock control
  .rst_n(rst_n), // reset
  .pb_in(pb_in), //push button input
  .pb_debounced(led_pb) // debounced push button output
);

// 1 pulse generation circuit
one_pulse U_op(
  .clk(clk_1),  // clock input
  .rst_n(rst_n), //active low reset
  .in_trig(led_pb), // input trigger
  .out_pulse(led_1pulse) // output one pulse 
);

endmodule
