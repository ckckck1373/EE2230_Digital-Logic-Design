`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/06/07 19:04:23
// Design Name: 
// Module Name: top
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



module top(
    input clk,
    input rst_n,
    input pb_volume_up,
    input pb_volume_down,
    input pb_volume_mute,
    input pb_highest_score,
    input switch_mode,
    input switch_undead,
    input switch_clk,
    output reg [3:0] vgaRed,
    output reg [3:0] vgaGreen,
    output reg [3:0] vgaBlue,
    output [7:0] segs,
    output [3:0] scan_ctl,
    output hsync,
    output vsync,
    output mclk,
    output lrclk,
    output sdin,
    output sclk,
    output reg [10:0] LEDs,
    inout PS2_DATA,
    inout PS2_CLK,
    output [3:0]life,
    output dead
    ); 
    
    
    wire [11:0]pixel_num;
always@*
   begin
        begin
            if(N2 % 2 == 1'b0 && xpos > 0  && xpos <= 250 && ypos >0 && ypos <55)
                {vgaRed, vgaGreen, vgaBlue} = ~pixel_num;
            else if(N2 % 2 == 1'b1 && xpos > 0  && xpos <= 250 && ypos >0 && ypos <55)
                {vgaRed, vgaGreen, vgaBlue} = pixel_num;
            else if(N2 % 2 == 1'b0)
                 {vgaRed, vgaGreen, vgaBlue} = (valid==1'b1) ? pixel0:12'h0;
            else 
                {vgaRed, vgaGreen, vgaBlue} = (valid==1'b1) ? ~pixel0:12'h0;
         end
    end
    

    pixel_gen Utest(
      .h_cnt(xpos),
      .v_cnt(ypos),
      .valid(valid),
      .digit3(dis3),
      .digit2(dis2),
      .digit1(dis1),
      .digit0(dis0),
      .clk_ctl(clk_ctl),
      .clk(clk),
      .pixel(pixel_num)
    );

//KEY BOARD module
    wire [511:0] key_down;
    wire [8:0] last_change;
    wire key_valid;
    reg [3:0]BCD;
    wire kp_jump;
    wire kp_down;
    wire kp_pause_resume;
    wire kp_restart;
    
    assign kp_jump = key_down[41]|key_down[117]; // space or number 8
    assign kp_down = key_down[115]/*|key_down[72]*/; // number 5 or down 
    assign kp_pause_resume = key_down [90]; // enter 
    assign kp_restart = key_down [45]; // r 
    
KeyboardDecoder U0(
        .key_down(key_down),
        .last_change(last_change),
        .key_valid(key_valid),
        .PS2_DATA(PS2_DATA),
        .PS2_CLK(PS2_CLK),
        .rst(~rst_n),
        .clk(clk)
         );
            
            
//FREQUENCY     (no done yet)
    wire clk1;
    wire clk_22;
    wire clk_100000Hz;
    wire clk_10000Hz;
    wire clk_1000Hz;
    wire clk_300Hz;
    wire clk_200Hz; //new one
    wire clk_100Hz;
    wire clk_20Hz;
    wire clk_10Hz;
    wire clk_2Hz;
    wire clk_1Hz;
    wire [1:0]clk_ctl;

Frequency_Divider U2( 
           .clk_100000Hz(clk_100000Hz),
           .clk_10000Hz(clk_10000Hz),
           .clk_1000Hz(clk_1000Hz),
           .clk_400Hz(clk_400Hz),
           .clk_200Hz(clk_200Hz),
           .clk_100Hz(clk_100Hz),
           .clk_20Hz(clk_20Hz),
           .clk_10Hz(clk_10Hz),
           .clk_2Hz(clk_2Hz),
           .clk_1Hz(clk_1Hz), 
           .clk1(clk1),
           .clk22(clk22),
           .clk_ctl(clk_ctl), 
           .clk(clk), 
           .rst_n(rst_n) 
         );
   
// FSM to controll 4 different state (initial,playing,pause,hero dead)    

wire enable;
wire reset;

Controll U3(
    .clk(clk), //  input
    .jump(kp_jump),
    .pause(kp_pause_resume),
    .restart(kp_restart),
    .dead(dead),
    .reset(reset), // output
    .enable(enable)
 );
 
//Push Button controll 

    wire pb_volume_up_debounced;
    wire pb_volume_up_onepulse;
    wire pb_volume_down_debounced;
    wire pb_volume_down_onepulse;
    wire pb_volume_mute_debounced;
    wire pb_volume_mute_onepulse;
    wire pb_volume_highest_score_debounced;
    wire pb_volume_highest_score_onepulse;

// volume up

debounce_circuit U4(
    .clk(clk_100Hz), 
    .rst_n(rst_n), 
    .pb_in(pb_volume_up), 
    .pb_debounced(pb_volume_up_debounced)
);

one_pulse U5(
    .clk(clk_100Hz), 
    .rst_n(rst_n),
    .in_trig(pb_volume_up_debounced), 
    .out_pulse(pb_volume_up_onepulse) 
);

//volume down

debounce_circuit U6(
    .clk(clk_100Hz), 
    .rst_n(rst_n), 
    .pb_in(pb_volume_down), 
    .pb_debounced(pb_volume_down_debounced)
);

one_pulse U7(
    .clk(clk_100Hz), 
    .rst_n(rst_n),
    .in_trig(pb_volume_down_debounced), 
    .out_pulse(pb_volume_down_onepulse) 
);

// volume mute

debounce_circuit U8(
    .clk(clk_100Hz), 
    .rst_n(rst_n), 
    .pb_in(pb_volume_mute), 
    .pb_debounced(pb_volume_mute_debounced)
);

one_pulse U9(
    .clk(clk_100Hz), 
    .rst_n(rst_n),
    .in_trig(pb_volume_mute_debounced), 
    .out_pulse(pb_volume_mute_onepulse) 
);

//highest score

debounce_circuit U10(
    .clk(clk_100Hz), 
    .rst_n(rst_n), 
    .pb_in(pb_highest_score), 
    .pb_debounced(pb_volume_highest_score_debounced)
);

one_pulse U11(
    .clk(clk_100Hz), 
    .rst_n(rst_n),
    .in_trig(pb_volume_highest_score_debounced), 
    .out_pulse( pb_volume_highest_score_onepulse) 
);

// Hero postion

    wire [31:0]y_hero;
    wire showmode_hero;

Hero U12(
        .clk_5ms(clk_200Hz), // 200Hz changeeeeee100
        .clk_100ms(clk_10Hz), // 10Hz
        .reset(reset),
        .enable(enable),
        .jump(kp_jump),
        .down(kp_down),
        .y_hero(y_hero), // output
        .showmode(showmode_hero)
);

//Obstacle generation
    wire [31:0]x_obst0,x_obst1,x_obst2;
    wire [31:0]x_bird_obst0,x_bird_obst1;
    wire showmode_bide;
    wire clk_game;
    
Obstacle U13(
        .clk_10000Hz(clk_10000Hz),
        .clk_01ms(clk_1000Hz),
        .clk_10ms(clk_100Hz),
        .clk_100ms(clk_10Hz),
        .reset(reset),
        .enable(enable),
        .switch_clk(switch_clk),
        .x_obst0(x_obst0),
        .x_obst1(x_obst1),
        .x_obst2(x_obst2),
        .x_bird_obst0(x_bird_obst0),
        .x_bird_obst1(x_bird_obst1),
        .showmode(showmode_bird),
        .clk_game(clk_game)
   );
    
// Check module for judging if dino was dead or not

    wire [31:0] current_score;
    wire next_dead;
    
Check U14(
    .clk(clk),
    .clk_1s(clk_1Hz),
    .clk_2Hz(clk_2Hz),
    .reset(reset),
    .enable(enable),
    .kp_down(kp_down),
    .x_obst0(x_obst0),
    .x_obst1(x_obst1), 
    .x_obst2(x_obst2),
    .x_bird_obst0(x_bird_obst0),
    .x_bird_obst1(x_bird_obst1),
    .y_hero(y_hero),
    .life(life),
    .really_dead(dead),
    .current_score(current_score),
    .next_dead(next_dead),
    .undead(switch_undead),
    .clk_game(clk_game)
    );

//highest score and current score
    wire [3:0]N0,N1,N2,N3,N4,N5,N6,N7,N8;

Showscore U15(
      .clk(clk),
      .current_score(current_score),
      .clk_100000Hz(clk_100000Hz),
      .N0(N0),
      .N1(N1),
      .N2(N2),
      .N3(N3),
      .N4(N4),
      .N5(N5),
      .N6(N6),
      .N7(N7)
      );



//Display score
    reg [3:0]dis0,dis1,dis2,dis3;
    wire [3:0]ssd_in;
    wire state;
    
    always@*
    if(state == 1'b0)
      begin
        dis0 = N0;
        dis1 = N1;
        dis2 = N2;
        dis3 = N3;
      end
    else
      begin
        dis0 = N4;
        dis1 = N5;
        dis2 = N6;
        dis3 = N7;
      end
    
FSM_2state U16(
        .clk(clk_100Hz),
        .rst_n(rst_n),
        .in(pb_volume_highest_score_onepulse),
        .state(state)
        );
scan_ctl U17(
      .scan_ctl(scan_ctl), 
      .ssd_in(ssd_in),
      .in0(dis0), 
      .in1(dis1), 
      .in2(dis2), 
      .in3(dis3),  
      .ssd_ctl_en(clk_ctl) 
);

Display U18(
      .ssd_in(ssd_in),
      .ssd_ctl(segs)
    );
 
 //VGA
 wire [31:0]xpos;
 wire [31:0]ypos;
 wire [11:0]pixel0,pixel;
 wire [11:0]data0,data1;
 wire [16:0]pixel_addr;
 
 assign pixel0 = (pixel == 12'h0)? 12'h0   :  pixel;
 
VGA_640_480 U19(
     .clk_vga(clk1),
     .RESET(reset),
     .HS(hsync),
     .VS(vsync),
     .valid(valid),
     .xpos(xpos),
     .ypos(ypos)
     );
     
VGA_Color U20(
         .clk_vga(clk1),
         .valid(valid),
         .xposin(xpos),
         .yposin(ypos),
         .pixel_addr(pixel_addr),
         .X_obst0(x_obst0),
         .X_obst1(x_obst1),
         .X_obst2(x_obst2),
         .X_bird_obst0(x_bird_obst0),
         .X_bird_obst1(x_bird_obst1),
         .Y_hero(y_hero),
         .showmode(showmode_hero),
         .showmode1(showmode_bird),
         .DEAD(dead),
         .kp_down(kp_down),
         .life(life),
         .next_dead(next_dead),
         .clk_100Hz(clk_100Hz),
         .N0(N0),
         .N1(N1),
         .N2(N2),
         .N3(N3),
         .N4(N4),
         .N5(N5),
         .N6(N6),
         .N7(N7)
     );  
     
     
     
 //two memory generator for 2 skills
blk_mem_gen_0 U21(
       .clka(clk1),
       .wea(0),
       .addra(pixel_addr),
       .dina(data0[11:0]),
       .douta(pixel)
     );     
     
//sound   
wire [15:0] audio_l,audio_r;
reg [3:0]note; 
reg [3:0] level; initial begin level = 4'd5;end

always@(posedge clk_100Hz or posedge reset)
    if(reset)
         level <= 4'd5;
    else if(pb_volume_up_onepulse == 1&& level!= 4'd13)
         level <= level+1 ;
    else if(pb_volume_down_onepulse == 1&& level!= 4'd2)
         level <= level-1 ; 
    else if (pb_volume_mute_onepulse == 1  )    
         level <= 4'd2;  
    else 
         level <= level;

always@*
begin
    if(level== 4'd13)
        LEDs = 11'b11111111111;
    else if (level== 4'd12)
        LEDs = 11'b01111111111;  
    else if (level== 4'd11)
        LEDs = 11'b00111111111;
    else if (level== 4'd10)   
        LEDs = 11'b00011111111;
    else if (level== 4'd9)
        LEDs = 11'b00001111111;
    else if (level== 4'd8)
        LEDs = 11'b00000111111;
    else if (level== 4'd7)
        LEDs = 11'b00000011111;
    else if (level== 4'd6)
        LEDs = 11'b00000001111;
    else if (level== 4'd5)
        LEDs = 11'b00000000111;
    else if (level== 4'd4)
        LEDs = 11'b00000000011;
    else if (level== 4'd3)
        LEDs = 11'b00000000001;
    else 
        LEDs = 11'b00000000000;
end

// Music
    
    wire [11:0]note_1,note_2;         
 note U23(
            .audio_l(audio_l),
            .audio_r(audio_r),          
            .note_1(note_1),
            .note_2(note_2),
            .level(level),
            .clk(clk),
            .rst_n(~reset)
            );   
             
             
speaker U24(
            .mclk (mclk), 
            .lrclk(lrclk), // right_left clk
            .sclk(sclk),//serial clk
            .sdin(sdin), 
            .audio_l(audio_l),
            .audio_r(audio_r), 
            .clk(clk),
            .rst_n(~reset)
            );   
                
note_peak U25(
            .clk(clk),
            .clk_20(clk_20Hz),
            .rst_n(~reset),
            .note_1(note_1),
            .note_2(note_2),
            .dead(dead),
            .kp_jump(kp_jump),
            .kp_down(kp_down)
            );         
       
endmodule
