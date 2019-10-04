`timescale 1ns / 1ps
module top1(
  clk, // Clock from crystal
  rst_n, //active low reset
  pb_in, //push button input
  pb_debounced
);

// Declare I/Os
input clk; // Clock from crystal
input rst_n; //active low reset
input pb_in; //push button input
output pb_debounced; // LED display output (1 pulse)

// Declare internal nodes
reg pb_debounced; // push button debounced output
wire pb_debounced_tmp;
wire led_1;
// Clock generator module
clock_generator U_cg(
  .clk(clk), // clock from crystal
  .rst_n(rst_n), // active low reset
  .clk_1(led_1), // generated 1 Hz clock
  .clk_100(clk_100) // generated 100 Hz clock
);

// debounce circuit
debounce_circuit U_dc(
  .clk(clk_100), // clock control
  .rst_n(rst_n), // reset
  .pb_in(pb_in), //push button input
  .pb_debounced(pb_debounced_tmp) // debounced push button output
);

always@(posedge led_1 or negedge rst_n)
if(~rst_n)
begin
    pb_debounced <= 1'b0;
end
else
begin
    pb_debounced<=pb_debounced_tmp;
end


endmodule
