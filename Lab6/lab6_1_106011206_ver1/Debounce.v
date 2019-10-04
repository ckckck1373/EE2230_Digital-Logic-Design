`timescale 1ns / 1ps
module debounce_circuit(
input  clk, 
input  rst_n, 
input  pb_in, 
output reg pb_debounced
);

reg [3:0] debounce_window; 
reg pb_debounced_next; 

always @(posedge clk or negedge rst_n)
  if (~rst_n)
    debounce_window <= 3'd0;
  else
    debounce_window <= {debounce_window[2:0],pb_in}; 


always @*
  if (debounce_window == 4'b1111) 
    pb_debounced_next = 1'b1;
  else
    pb_debounced_next = 1'b0;

always @(posedge clk or negedge rst_n)
  if (~rst_n)
    pb_debounced <= 1'b0;
  else
    pb_debounced <= pb_debounced_next;
	 
endmodule
