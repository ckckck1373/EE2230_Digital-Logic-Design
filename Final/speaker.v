`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/04/28 15:05:42
// Design Name: 
// Module Name: speaker
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


module speaker(
    output mclk, //
    output lrclk, // right_left clk
    output sclk,//serial clk
    output reg sdin, 
    input [15:0] audio_l,
    input [15:0] audio_r, 
    input clk,
    input rst_n
    );
    
    reg [8:0] cnt;
    wire [8:0] next_cnt;
    
    //for all the clk speaker need
    assign mclk = cnt[1]; // master clk's frequency is 100Mhz/4
    assign sclk = cnt[3]; // serial clk's frequency is 100Mh/4/4
    assign lrclk = cnt[8]; // Left-Right clk's frequency is 100Mhz/4/128
     
    always@ (posedge clk or negedge rst_n)
    begin
        if(rst_n == 1'b0)
        begin
            cnt <= 9'd0;
        end
        else
        begin
            cnt <= next_cnt;
        end
    end
    
     assign next_cnt = cnt + 9'd1;
    
    
    //for parallel  to serial 
    always @*
    begin
        case(cnt[8:4])
            5'd0: sdin = audio_r[0];
            5'd1: sdin = audio_l[15];
            5'd2: sdin = audio_l[14];
            5'd3: sdin = audio_l[13];
            5'd4: sdin = audio_l[12];
            5'd5: sdin = audio_l[11];
            5'd6: sdin = audio_l[10];
            5'd7: sdin = audio_l[9];
            5'd8: sdin = audio_l[8];
            5'd9: sdin = audio_l[7];
            5'd10: sdin = audio_l[6];
            5'd11: sdin = audio_l[5];
            5'd12: sdin = audio_l[4];
            5'd13: sdin = audio_l[3];
            5'd14: sdin = audio_l[2];
            5'd15: sdin = audio_l[1];
            5'd16: sdin = audio_l[0];
            5'd17: sdin = audio_r[15];
            5'd18: sdin = audio_r[14];
            5'd19: sdin = audio_r[13];
            5'd20: sdin = audio_r[12];
            5'd21: sdin = audio_r[11];
            5'd22: sdin = audio_r[10];
            5'd23: sdin = audio_r[9];
            5'd24: sdin = audio_r[8];
            5'd25: sdin = audio_r[7];
            5'd26: sdin = audio_r[6];
            5'd27: sdin = audio_r[5];
            5'd28: sdin = audio_r[4];
            5'd29: sdin = audio_r[3];
            5'd30: sdin = audio_r[2];
            5'd31: sdin = audio_r[1];
        endcase
    end       
    
endmodule
