`timescale 1ns / 1ps
module Frequency_Divider(
  output reg clk_100000Hz,
  output reg clk_1000Hz,
  output reg clk_100Hz,
  output reg clk_10Hz,
  output reg clk_2Hz,
  output reg clk_1Hz, 
  output reg [1:0] clk_ctl, 
  input clk, 
  input rst_n 
);

reg clk_out;
reg [14:0] cnt_l; 
reg [8:0] cnt_h; 
reg [26:0] cnt_tmp; 
reg [26:0] count_50M, count_50M_next;
reg [26:0] count_25M, count_25M_next;
reg [24:0]count_5M,count_5M_next;
reg [19:0] count_500K, count_500K_next;
reg [15:0] count_50K, count_50K_next;
reg [9:0] count_500,count_500_next;
reg clk_1Hz_next;
reg clk_2Hz_next;
reg clk_10Hz_next;
reg clk_100Hz_next;
reg clk_1000Hz_next;
reg clk_100000Hz_next;

//Clock divider for clk_ctl
 always@*
 cnt_tmp = {clk_out,cnt_h,clk_ctl,cnt_l} + 1'b1;
 
 always @(posedge clk or negedge rst_n)
 if(~rst_n) {clk_out,cnt_h,clk_ctl,cnt_l} <= 27'b0;
 else {clk_out,cnt_h,clk_ctl,cnt_l} <=cnt_tmp;
    

    
// Clock divider for 1 Hz
always @*
  if (count_50M == 27'd49_999_999)
  begin
    count_50M_next = 27'b0;
    clk_1Hz_next = ~clk_1Hz;
  end
  else
  begin
    count_50M_next = count_50M + 1'b1;
    clk_1Hz_next = clk_1Hz;
  end

// Counter flip-flops
always @(posedge clk or negedge rst_n)
  if (~rst_n)
  begin
    count_50M <=27'b0;
    clk_1Hz <=1'b0;
  end
  else
  begin
    count_50M <= count_50M_next;
    clk_1Hz <= clk_1Hz_next;
  end
  
// Clock divider for 2 Hz
   always @*
     if (count_25M == 27'd24_999_999)
     begin
       count_25M_next = 27'b0;
       clk_2Hz_next = ~clk_2Hz;
     end
     else
     begin
       count_25M_next = count_25M + 1'b1;
       clk_2Hz_next = clk_2Hz;
     end
   
   // Counter flip-flops
   always @(posedge clk or negedge rst_n)
     if (~rst_n)
     begin
       count_25M <=27'b0;
       clk_2Hz <=1'b0;
     end
     else
     begin
       count_25M <= count_25M_next;
       clk_2Hz <= clk_2Hz_next;
     end
//Clock divider for 10Hz
always @*
  if (count_5M == 27'd4_999_999)
  begin
    count_5M_next = 27'b0;
    clk_10Hz_next = ~clk_10Hz;
  end
  else
  begin
    count_5M_next = count_5M + 1'b1;
    clk_10Hz_next = clk_10Hz;
  end

// Counter flip-flops
always @(posedge clk or negedge rst_n)
  if (~rst_n)
  begin
    count_5M <=27'b0;
    clk_10Hz <=1'b0;
  end
  else
  begin
    count_5M <= count_5M_next;
    clk_10Hz <= clk_10Hz_next;
  end

// Clock divider for 100 Hz
always @*
  if (count_500K == 20'd499_999)
  begin
    count_500K_next = 20'd0;
    clk_100Hz_next = ~clk_100Hz;
  end
  else
  begin
    count_500K_next = count_500K + 1'b1;
    clk_100Hz_next = clk_100Hz;
  end

// Counter flip-flops
always @(posedge clk or negedge rst_n)
  if (~rst_n)
  begin
    count_500K <= 20'b0;
    clk_100Hz <=1'b0;
  end
  else
  begin
    count_500K <= count_500K_next;
    clk_100Hz <= clk_100Hz_next;
  end

// Clock divider for 1000 Hz
always @*
  if (count_50K == 16'd49_999)
  begin
    count_50K_next = 16'd0;
    clk_1000Hz_next = ~clk_1000Hz;
  end
  else
  begin
    count_50K_next = count_50K+ 1'b1;
    clk_1000Hz_next = clk_1000Hz;
  end

// Counter flip-flops
always @(posedge clk or negedge rst_n)
  if (~rst_n)
  begin
    count_50K <= 16'b0;
    clk_1000Hz <= 1'b0;
  end
  else
  begin
    count_50K <= count_50K_next;
    clk_1000Hz <= clk_1000Hz_next;
  end
  
// Clock divider for 100000 Hz
  always @*
    if (count_500 == 10'd499)
    begin
      count_500_next = 10'd0;
      clk_100000Hz_next = ~clk_100000Hz;
    end
    else
    begin
      count_500_next = count_500+ 1'b1;
      clk_100000Hz_next = clk_100000Hz;
    end
  
  // Counter flip-flops
  always @(posedge clk or negedge rst_n)
    if (~rst_n)
    begin
      count_500 <= 10'b0;
      clk_100000Hz <= 1'b0;
    end
    else
    begin
      count_500 <= count_500_next;
      clk_100000Hz <= clk_100000Hz_next;
    end

endmodule
