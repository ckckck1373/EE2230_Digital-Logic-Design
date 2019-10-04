`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/03/24 16:26:51
// Design Name: 
// Module Name: Two_state_Downcounter
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


module Two_state_Downcounter(
    input pb_mode,
    input in, //btn_in
    input clk,
    input rst_n,
    output [7:0]segs,
    output [3:0]ssd_ctl,
    output [14:0]light,
    output mode_enable
    );
    
    
    wire pb_mode_1pulse;
    wire clk_1;
    wire clk_100;
    //wire mode_enable;

btn_one_pulse U0(
      .clk(clk), // Clock from crystal
      .rst_n(rst_n), //active low reset
      .pb_in(pb_mode), //push button input
      .led_1pulse(pb_mode_1pulse)
    );
    
fsm_2state U1(
      .mode_enable(mode_enable),  // if counter is enabled 
      .in(pb_mode_1pulse), //input control
      .clk(clk_100), // global clock signal
      .rst_n(rst_n)  // low active reset
    );
    
stopwatch U3(
      .clk(clk), // clock
      .rst_n(rst_n&(~pb_mode)), // low active reset
      .in(in), // input control for FSM
      .light(light),
      .mode_enable(mode_enable),
      .ssd_ctl(ssd_ctl),
      .segs(segs)
    );
        
clock_generator U_cg(
      .clk(clk), // clock from crystal
      .rst_n(rst_n), // active low reset
      .clk_1(clk_1), // generated 1 Hz clock
      .clk_100(clk_100) // generated 100 Hz clock
    );    
        
endmodule
