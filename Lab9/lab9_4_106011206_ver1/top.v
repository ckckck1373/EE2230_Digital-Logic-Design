`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/05/14 18:29:56
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

`define S0 2'b00
`define S1 2'b01
`define S2 2'b10
`define S3 2'b11

module top(
    inout PS2_DATA,
    inout PS2_CLK,
    input rst,
    input clk,
    output [7:0] segs,
    output [3:0] scan_ctl,
    output reg [6:0] ASCII,
    output caps_lock
    );
    
    wire [511:0]key_down;
    wire [7:0]last_change;
    wire key_valid;
    wire [1:0]clk_ctl;
    wire [3:0]digit2,digit1,digit0;
    wire [3:0]ssd_in;
    reg [1:0]state,next_state;
    
    
    assign caps_lock = state[1];
    assign digit2 = ASCII / 7'd100;
    assign digit1 = (ASCII % 8'd100) / 7'd10;
    assign digit0  = ASCII % 7'd10;
    
    always@(posedge clk or posedge rst)
    begin
        if(rst == 1'b1)
        state <= `S0;
        else 
        state <= next_state;
    end
    
    
    always@*
    begin
        case(state)
            `S0:
                next_state = (key_valid == 1'b1 && last_change == 9'H58)? `S1 : `S0 ;
            `S1:
                next_state = (key_valid == 1'b1 /*&& last_change == 9'H58*/)? `S2 : `S1 ;
            `S2:
                next_state = (key_valid == 1'b1 && last_change == 9'H58)? `S3 : `S2 ;
            `S3:
                next_state = (key_valid == 1'b1 /*&& last_change == 9'H58*/)? `S0 : `S3 ;
             default: next_state = `S0;
         endcase
         
        if(caps_lock  ^ key_down [18] == 1'b1) // low
        begin
            case(last_change)
               9'H1C : ASCII = 7'd65;//a
               9'H32 : ASCII = 7'd66;//b
               9'H21 : ASCII = 7'd67;//c
               9'H23 : ASCII = 7'd68;//d
               9'H24 : ASCII = 7'd69;//e
               9'H2B : ASCII = 7'd70;//f
               9'H34 : ASCII = 7'd71;//g
               9'H33 : ASCII = 7'd72;//h
               9'H43 : ASCII = 7'd73;//i
               9'H3B : ASCII = 7'd74;//j
               9'H42 : ASCII = 7'd75;//k
               9'H4B : ASCII = 7'd76;//l
               9'H3A : ASCII = 7'd77;//m
               9'H31 : ASCII = 7'd78;//n
               9'H44 : ASCII = 7'd79;//o
               9'H4D : ASCII = 7'd80;//p
               9'H15 : ASCII = 7'd81;//q
               9'H2D : ASCII = 7'd82;//r
               9'H1B : ASCII = 7'd83;//s
               9'H2C : ASCII = 7'd84;//t
               9'H3C : ASCII = 7'd85;//u
               9'H2A : ASCII = 7'd86;//v
               9'H1D : ASCII = 7'd87;//w
               9'H22 : ASCII = 7'd88;//x
               9'H35 : ASCII = 7'd89;//y
               9'H1A : ASCII = 7'd90;//z
            endcase
          end
          else
          begin
             case(last_change)
               9'H1C : ASCII = 7'd97;//A
               9'H32 : ASCII = 7'd98;//B
               9'H21 : ASCII = 7'd99;//C
               9'H23 : ASCII = 7'd100;//D
               9'H24 : ASCII = 7'd101;//E
               9'H2B : ASCII = 7'd102;//F
               9'H34 : ASCII = 7'd103;//G
               9'H33 : ASCII = 7'd104;//H
               9'H43 : ASCII = 7'd105;//I
               9'H3B : ASCII = 7'd106;//J
               9'H42 : ASCII = 7'd107;//K
               9'H4B : ASCII = 7'd108;//L
               9'H3A : ASCII = 7'd109;//M
               9'H31 : ASCII = 7'd110;//N
               9'H44 : ASCII = 7'd111;//O
               9'H4D : ASCII = 7'd112;//P
               9'H15 : ASCII = 7'd113;//Q
               9'H2D : ASCII = 7'd114;//R
               9'H1B : ASCII = 7'd115;//S
               9'H2C : ASCII = 7'd116;//T
               9'H3C : ASCII = 7'd117;//U
               9'H2A : ASCII = 7'd118;//V
               9'H1D : ASCII = 7'd119;//W
               9'H22 : ASCII = 7'd120;//X
               9'H35 : ASCII = 7'd121;//Y
               9'H1A : ASCII = 7'd122;//Z
                     endcase            
                end
       end

    
KeyboardDecoder U0(
        .key_down(key_down),
        .last_change(last_change),
        .key_valid(key_valid),
        .PS2_DATA(PS2_DATA),
        .PS2_CLK(PS2_CLK),
        .rst(rst),
        .clk(clk)
        );    
        
        
Frequency_Divider U1(     
          .clk_ctl(clk_ctl), 
          .clk(clk), 
          .rst_n(~rst) 
        );       
        
scan_ctl U2(
        .scan_ctl(scan_ctl), 
        .ssd_in(ssd_in),
        .in0(4'd0), 
        .in1(digit2), 
        .in2(digit1), 
        .in3(digit0),  
        .ssd_ctl_en(clk_ctl) 
        );       
        
Display_for_keyboard U3(
            .ssd_in(ssd_in),
            .ssd_ctl(segs)
            );        
endmodule
