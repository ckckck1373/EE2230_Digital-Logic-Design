`timescale 1ns / 1ps
module one_pulse(
  input clk,  // clock input
  input rst_n, //active low reset
  input in_trig, // input trigger
  output reg out_pulse // output one pulse 
);

reg in_trig_delay;

// Buffer input 
always @(posedge clk or negedge rst_n)
  if (~rst_n)
    in_trig_delay <= 1'b0; 
  else
    in_trig_delay <= in_trig;

// Pulse generation
assign out_pulse_next = in_trig & (~in_trig_delay);

always @(posedge clk or negedge rst_n)
  if (~rst_n)
    out_pulse <=1'b0;
  else
    out_pulse <= out_pulse_next;

endmodule