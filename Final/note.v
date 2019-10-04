`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/04/29 14:24:24
// Design Name: 
// Module Name: note
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
`define a2 19'd454545
`define b2 19'd404956
`define c1 19'd382219
`define d1 19'd340530
`define d2 19'd321543
`define e1 19'd303370
`define f1 19'd286344
`define g1 19'd255102
`define a1 19'd227272
`define b1 19'd202429
`define c 19'd191570
`define d 19'd170648
`define e 19'd151515
`define f 19'd143266
`define g 19'd127551
`define a 19'd113636
`define b 19'd101214
`define C 19'd95419
`define D 19'd85034
`define D1 19'd80353
`define E 19'd75757
`define F 19'd67567
`define G 19'd63775
`define A 19'd56818
`define B 19'd50607
`define D2 19'd40176
`define C0 19'd46707
`define D0 19'd41893
`define E0 19'd37922
`define F0 19'd33311
`define G0 19'd31456
`define A0 19'd28050
`define B0 19'd25012
`define n 19'b0 


module note(
  audio_l,
  audio_r,
  note_1,
  note_2,
  level,
  clk,
  rst_n
    );
    output reg [15:0] audio_l;
    output reg [15:0] audio_r;
    input [11:0] note_1,note_2;
    input [3:0]level;
    input clk;
    input rst_n;  
    reg b_clk, next_b_clk,c_clk, next_c_clk;
    reg [18:0] b_clk_cnt,b_clk_cnt_next,c_clk_cnt,c_clk_cnt_next;
    reg [18:0] b_note_div,c_note_div;
        

    
    
    always@(posedge clk or negedge rst_n)
    begin
        if(rst_n ==1'b0)
        begin
            c_clk <=  1'b0;
            b_clk <=  1'b0;
            b_clk_cnt <= 18'd0;
            c_clk_cnt <= 18'd0;
        end    
        else 
        begin
            c_clk <= next_c_clk;
            b_clk <= next_b_clk;
            b_clk_cnt <= b_clk_cnt_next;
            c_clk_cnt <= c_clk_cnt_next;
        end       
    end
    
    
    always@*
    begin
        if(b_clk_cnt == b_note_div && note_1 != 4'b0)
        begin
            b_clk_cnt_next = 18'd0;
            next_b_clk = ~b_clk;
        end
        else
        begin
            b_clk_cnt_next = b_clk_cnt + 18'd1;
            next_b_clk = b_clk;
        end
        if(c_clk_cnt == c_note_div && note_2 != 4'b0)
        begin
            c_clk_cnt_next = 18'd0;
            next_c_clk = ~c_clk;
        end
        else
        begin
            c_clk_cnt_next = c_clk_cnt + 18'd1;
            next_c_clk = c_clk;
        end
        
        
        
      case(note_1)    //4 note 32case
          12'd1: b_note_div = `G;
          12'd2: b_note_div = `n; 
          12'd3: b_note_div = `G;
          12'd4: b_note_div = `n;
          12'd5: b_note_div = `G;
          12'd6: b_note_div = `n;
          12'd7: b_note_div = `G;
          12'd8: b_note_div = `n;
          12'd9: b_note_div = `G;
          12'd10: b_note_div = `n;
          12'd11: b_note_div = `G;
          12'd12: b_note_div = `n;
          12'd13: b_note_div = `G;
          12'd14: b_note_div = `n;
          12'd15: b_note_div = `F;
          12'd16: b_note_div = `F;
          12'd17: b_note_div = `n;
          12'd18: b_note_div = `n;
          12'd19: b_note_div = `F;
          12'd20: b_note_div = `n;
          12'd21: b_note_div = `F;
          12'd22: b_note_div = `F;
          12'd23: b_note_div = `n;
          12'd24: b_note_div = `n;
          12'd25: b_note_div = `F;
          12'd26: b_note_div = `n;
          12'd27: b_note_div = `F;
          12'd28: b_note_div = `n;
          12'd29: b_note_div = `G;
          12'd30: b_note_div = `G;
          12'd31: b_note_div = `n;
          12'd32: b_note_div = `n;
          12'd33: b_note_div = `G;
          12'd34: b_note_div = `n; 
          12'd35: b_note_div = `G;
          12'd36: b_note_div = `n;
          12'd37: b_note_div = `G;
          12'd38: b_note_div = `n;
          12'd39: b_note_div = `G;
          12'd40: b_note_div = `n;
          12'd41: b_note_div = `G;
          12'd42: b_note_div = `n;
          12'd43: b_note_div = `G;
          12'd44: b_note_div = `n;
          12'd45: b_note_div = `G;
          12'd46: b_note_div = `n;
          12'd47: b_note_div = `F;
          12'd48: b_note_div = `F;
          12'd49: b_note_div = `n;
          12'd50: b_note_div = `n;
          12'd51: b_note_div = `F;
          12'd52: b_note_div = `n;
          12'd53: b_note_div = `F;
          12'd54: b_note_div = `F;
          12'd55: b_note_div = `n;
          12'd56: b_note_div = `n;
          12'd57: b_note_div = `F;
          12'd58: b_note_div = `n;
          12'd59: b_note_div = `F;
          12'd60: b_note_div = `n;
          12'd61: b_note_div = `G;
          12'd62: b_note_div = `G;
          12'd63: b_note_div = `n;
          12'd64: b_note_div = `n;   
          12'd65: b_note_div = `G;
          12'd66: b_note_div = `n; 
          12'd67: b_note_div = `G;
          12'd68: b_note_div = `n;
          12'd69: b_note_div = `G;
          12'd70: b_note_div = `n;
          12'd71: b_note_div = `G;
          12'd72: b_note_div = `n;
          12'd73: b_note_div = `G;
          12'd74: b_note_div = `n;
          12'd75: b_note_div = `G;
          12'd76: b_note_div = `n;
          12'd77: b_note_div = `G;
          12'd78: b_note_div = `n;
          12'd79: b_note_div = `F;
          12'd80: b_note_div = `F;
          12'd81: b_note_div = `n;
          12'd82: b_note_div = `n;
          12'd83: b_note_div = `F;
          12'd84: b_note_div = `n;
          12'd85: b_note_div = `F;
          12'd86: b_note_div = `F;
          12'd87: b_note_div = `n;
          12'd88: b_note_div = `n;
          12'd89: b_note_div = `F;
          12'd90: b_note_div = `n;
          12'd91: b_note_div = `F;
          12'd92: b_note_div = `n;
          12'd93: b_note_div = `G;
          12'd94: b_note_div = `G;
          12'd95: b_note_div = `n;
          12'd96: b_note_div = `n;
          12'd97: b_note_div = `a;
          12'd98: b_note_div = `n; 
          12'd99: b_note_div = `C;
          12'd100: b_note_div = `n;
          12'd101: b_note_div = `E;
          12'd102: b_note_div = `n;
          12'd103: b_note_div = `G;
          12'd104: b_note_div = `n;
          12'd105: b_note_div = `A;
          12'd106: b_note_div = `n;
          12'd107: b_note_div = `G;
          12'd108: b_note_div = `n;
          12'd109: b_note_div = `E;
          12'd110: b_note_div = `n;
          12'd111: b_note_div = `C;
          12'd112: b_note_div = `n;
          12'd113: b_note_div = `b;
          12'd114: b_note_div = `n;
          12'd115: b_note_div = `D;
          12'd116: b_note_div = `n;
          12'd117: b_note_div = `F;
          12'd118: b_note_div = `n;
          12'd119: b_note_div = `A;
          12'd120: b_note_div = `n;
          12'd121: b_note_div = `B;
          12'd122: b_note_div = `n;
          12'd123: b_note_div = `A;
          12'd124: b_note_div = `n;
          12'd125: b_note_div = `F;
          12'd126: b_note_div = `n;
          12'd127: b_note_div = `D;
          12'd128: b_note_div = `n;

          12'd129: b_note_div = `n;
          12'd130: b_note_div = `n; 
          12'd131: b_note_div = `n;
          12'd132: b_note_div = `n;
          12'd133: b_note_div = `n;
          12'd134: b_note_div = `n; 
          12'd135: b_note_div = `n;
          12'd136: b_note_div = `n;          
          12'd137: b_note_div = `G;
          12'd138: b_note_div = `G;
          12'd139: b_note_div = `n;
          12'd140: b_note_div = `n; 
          12'd141: b_note_div = `E;
          12'd142: b_note_div = `E;
          12'd143: b_note_div = `n;
          12'd144: b_note_div = `n;           
          12'd145: b_note_div = `G;
          12'd146: b_note_div = `G;
          12'd147: b_note_div = `n;
          12'd148: b_note_div = `n;           
          12'd149: b_note_div = `B;
          12'd150: b_note_div = `B;
          12'd151: b_note_div = `n;
          12'd152: b_note_div = `n;           
          12'd153: b_note_div = `n;
          12'd154: b_note_div = `n;
          12'd155: b_note_div = `n;
          12'd156: b_note_div = `n;           
          12'd157: b_note_div = `E;
          12'd158: b_note_div = `E;          
          12'd159: b_note_div = `n;
          12'd160: b_note_div = `n; 
          12'd161: b_note_div = `G;
          12'd162: b_note_div = `G;
          12'd163: b_note_div = `n;
          12'd164: b_note_div = `n;           
          12'd165: b_note_div = `E;
          12'd166: b_note_div = `E;
          12'd167: b_note_div = `n;
          12'd168: b_note_div = `n;           
          12'd169: b_note_div = `G;
          12'd170: b_note_div = `G;
          12'd171: b_note_div = `n;
          12'd172: b_note_div = `n;           
          12'd173: b_note_div = `B;
          12'd174: b_note_div = `B;
          12'd175: b_note_div = `n;
          12'd176: b_note_div = `n; 
          12'd177: b_note_div = `n;
          12'd178: b_note_div = `n;                     
          12'd179: b_note_div = `n;
          12'd180: b_note_div = `n;
          12'd181: b_note_div = `B;
          12'd182: b_note_div = `B;
          12'd183: b_note_div = `n;
          12'd184: b_note_div = `n;           
          12'd185: b_note_div = `E;
          12'd186: b_note_div = `E;
          12'd187: b_note_div = `n;
          12'd188: b_note_div = `n;           
          12'd189: b_note_div = `G;
          12'd190: b_note_div = `G;
          12'd191: b_note_div = `n;
          12'd192: b_note_div = `n;  
          
          
          12'd193: b_note_div = `n;
          12'd194: b_note_div = `n; 
          12'd195: b_note_div = `n;
          12'd196: b_note_div = `n;
          12'd197: b_note_div = `n;
          12'd198: b_note_div = `n; 
          12'd199: b_note_div = `n;
          12'd200: b_note_div = `n;          
          12'd201: b_note_div = `G;
          12'd202: b_note_div = `G;
          12'd203: b_note_div = `n;
          12'd204: b_note_div = `n; 
          12'd205: b_note_div = `E;
          12'd206: b_note_div = `E;
          12'd207: b_note_div = `n;
          12'd208: b_note_div = `n;           
          12'd209: b_note_div = `G;
          12'd210: b_note_div = `G;
          12'd211: b_note_div = `n;
          12'd212: b_note_div = `n;           
          12'd213: b_note_div = `B;
          12'd214: b_note_div = `B;
          12'd215: b_note_div = `n;
          12'd216: b_note_div = `n;           
          12'd217: b_note_div = `n;
          12'd218: b_note_div = `n;
          12'd219: b_note_div = `n;
          12'd220: b_note_div = `n;           
          12'd221: b_note_div = `E;
          12'd222: b_note_div = `E;          
          12'd223: b_note_div = `n;
          12'd224: b_note_div = `n; 
          12'd225: b_note_div = `G;
          12'd226: b_note_div = `G;
          12'd227: b_note_div = `n;
          12'd228: b_note_div = `n;           
          12'd229: b_note_div = `E;
          12'd230: b_note_div = `E;
          12'd231: b_note_div = `n;
          12'd232: b_note_div = `n;           
          12'd233: b_note_div = `G;
          12'd234: b_note_div = `G;
          12'd235: b_note_div = `n;
          12'd236: b_note_div = `n;           
          12'd237: b_note_div = `B;
          12'd238: b_note_div = `B;
          12'd239: b_note_div = `n;
          12'd240: b_note_div = `n; 
          12'd241: b_note_div = `n;
          12'd242: b_note_div = `n;                     
          12'd243: b_note_div = `n;
          12'd244: b_note_div = `n;
          12'd245: b_note_div = `B;
          12'd246: b_note_div = `B;
          12'd247: b_note_div = `n;
          12'd248: b_note_div = `n;           
          12'd249: b_note_div = `E;
          12'd250: b_note_div = `E;
          12'd251: b_note_div = `n;
          12'd252: b_note_div = `n;           
          12'd253: b_note_div = `G;
          12'd254: b_note_div = `G;
          12'd255: b_note_div = `n;
          12'd256: b_note_div = `n;           
         
         
         
         
          12'd257: b_note_div = `n;
          12'd258: b_note_div = `n; 
          12'd259: b_note_div = `n;
          12'd260: b_note_div = `n;
          12'd261: b_note_div = `n;
          12'd262: b_note_div = `n; 
          12'd263: b_note_div = `n;
          12'd264: b_note_div = `n;    
          12'd265: b_note_div = `G;
          12'd266: b_note_div = `G;
          12'd267: b_note_div = `n;
          12'd268: b_note_div = `n;           
          12'd269: b_note_div = `a;
          12'd270: b_note_div = `a;
          12'd271: b_note_div = `n;
          12'd272: b_note_div = `n;           
          12'd273: b_note_div = `n;
          12'd274: b_note_div = `n;
          12'd275: b_note_div = `n;
          12'd276: b_note_div = `n;           
          12'd277: b_note_div = `C;
          12'd278: b_note_div = `C;
          12'd279: b_note_div = `n;
          12'd280: b_note_div = `n;           
          12'd281: b_note_div = `E;
          12'd282: b_note_div = `E;
          12'd283: b_note_div = `n;
          12'd284: b_note_div = `n;           
          12'd285: b_note_div = `G;
          12'd286: b_note_div = `G;
          12'd287: b_note_div = `n;
          12'd288: b_note_div = `n;  
          12'd289: b_note_div = `n;
          12'd290: b_note_div = `n;            
          12'd291: b_note_div = `n;
          12'd292: b_note_div = `n;
          12'd293: b_note_div = `n;
          12'd294: b_note_div = `n;
          12'd295: b_note_div = `n;
          12'd296: b_note_div = `n;           
          12'd297: b_note_div = `A;
          12'd298: b_note_div = `A;
          12'd299: b_note_div = `n;
          12'd300: b_note_div = `n;           
          12'd301: b_note_div = `F;
          12'd302: b_note_div = `F;
          12'd303: b_note_div = `n;
          12'd304: b_note_div = `n;           
          12'd305: b_note_div = `n;
          12'd306: b_note_div = `n;
          12'd307: b_note_div = `n;
          12'd308: b_note_div = `n;           
          12'd309: b_note_div = `F;
          12'd310: b_note_div = `F;
          12'd311: b_note_div = `n;
          12'd312: b_note_div = `n;           
          12'd313: b_note_div = `D;
          12'd314: b_note_div = `D;
          12'd315: b_note_div = `n;
          12'd316: b_note_div = `n;           
          12'd317: b_note_div = `F;
          12'd318: b_note_div = `F;
          12'd319: b_note_div = `n;
          12'd320: b_note_div = `n;



          12'd321: b_note_div = `n;
          12'd322: b_note_div = `n; 
          12'd323: b_note_div = `n;
          12'd324: b_note_div = `n;
          12'd325: b_note_div = `n;
          12'd326: b_note_div = `n; 
          12'd327: b_note_div = `n;
          12'd328: b_note_div = `n;          
          12'd329: b_note_div = `G;
          12'd330: b_note_div = `G;
          12'd331: b_note_div = `n;
          12'd332: b_note_div = `n; 
          12'd333: b_note_div = `E;
          12'd334: b_note_div = `E;
          12'd335: b_note_div = `n;
          12'd336: b_note_div = `n;           
          12'd337: b_note_div = `G;
          12'd338: b_note_div = `G;
          12'd339: b_note_div = `n;
          12'd340: b_note_div = `n;           
          12'd341: b_note_div = `B;
          12'd342: b_note_div = `B;
          12'd343: b_note_div = `n;
          12'd344: b_note_div = `n;           
          12'd345: b_note_div = `n;
          12'd346: b_note_div = `n;
          12'd347: b_note_div = `n;
          12'd348: b_note_div = `n;           
          12'd349: b_note_div = `E;
          12'd350: b_note_div = `E;          
          12'd351: b_note_div = `n;
          12'd352: b_note_div = `n; 
          12'd353: b_note_div = `G;
          12'd354: b_note_div = `G;
          12'd355: b_note_div = `n;
          12'd356: b_note_div = `n;           
          12'd357: b_note_div = `E;
          12'd358: b_note_div = `E;
          12'd359: b_note_div = `n;
          12'd360: b_note_div = `n;           
          12'd361: b_note_div = `G;
          12'd362: b_note_div = `G;
          12'd353: b_note_div = `n;
          12'd354: b_note_div = `n;           
          12'd365: b_note_div = `B;
          12'd366: b_note_div = `B;
          12'd367: b_note_div = `n;
          12'd368: b_note_div = `n; 
          12'd369: b_note_div = `n;
          12'd370: b_note_div = `n;                     
          12'd371: b_note_div = `n;
          12'd372: b_note_div = `n;
          12'd373: b_note_div = `B;
          12'd374: b_note_div = `B;
          12'd375: b_note_div = `n;
          12'd376: b_note_div = `n;           
          12'd377: b_note_div = `E;
          12'd378: b_note_div = `E;
          12'd379: b_note_div = `n;
          12'd380: b_note_div = `n;           
          12'd381: b_note_div = `G;
          12'd382: b_note_div = `G;
          12'd383: b_note_div = `n;
          12'd384: b_note_div = `n;                     
 
         
            12'd385: b_note_div = `n;
            12'd386: b_note_div = `n; 
            12'd387: b_note_div = `n;
            12'd388: b_note_div = `n;
            12'd389: b_note_div = `n;
            12'd390: b_note_div = `n; 
            12'd391: b_note_div = `n;
            12'd392: b_note_div = `n;          
            12'd393: b_note_div = `G;
            12'd394: b_note_div = `G;
            12'd395: b_note_div = `n;
            12'd396: b_note_div = `n; 
            12'd397: b_note_div = `E;
            12'd398: b_note_div = `E;
            12'd399: b_note_div = `n;
            12'd400: b_note_div = `n;           
            12'd401: b_note_div = `G;
            12'd402: b_note_div = `G;
            12'd403: b_note_div = `n;
            12'd404: b_note_div = `n;           
            12'd405: b_note_div = `B;
            12'd406: b_note_div = `B;
            12'd407: b_note_div = `n;
            12'd408: b_note_div = `n;           
            12'd409: b_note_div = `n;
            12'd410: b_note_div = `n;
            12'd411: b_note_div = `n;
            12'd412: b_note_div = `n;           
            12'd413: b_note_div = `E;
            12'd414: b_note_div = `E;          
            12'd415: b_note_div = `n;
            12'd416: b_note_div = `n; 
            12'd417: b_note_div = `G;
            12'd418: b_note_div = `G;
            12'd419: b_note_div = `n;
            12'd420: b_note_div = `n;           
            12'd421: b_note_div = `E;
            12'd422: b_note_div = `E;
            12'd423: b_note_div = `n;
            12'd424: b_note_div = `n;           
            12'd425: b_note_div = `G;
            12'd426: b_note_div = `G;
            12'd427: b_note_div = `n;
            12'd428: b_note_div = `n;           
            12'd429: b_note_div = `B;
            12'd430: b_note_div = `B;
            12'd431: b_note_div = `n;
            12'd432: b_note_div = `n; 
            12'd433: b_note_div = `n;
            12'd434: b_note_div = `n;                     
            12'd435: b_note_div = `n;
            12'd436: b_note_div = `n;
            12'd437: b_note_div = `B;
            12'd438: b_note_div = `B;
            12'd439: b_note_div = `n;
            12'd440: b_note_div = `n;           
            12'd441: b_note_div = `E;
            12'd442: b_note_div = `E;
            12'd443: b_note_div = `n;
            12'd444: b_note_div = `n;           
            12'd445: b_note_div = `G;
            12'd446: b_note_div = `G;
            12'd447: b_note_div = `n;
            12'd448: b_note_div = `n;           
           
           
            12'd449: b_note_div = `n;
            12'd450: b_note_div = `n; 
            12'd451: b_note_div = `n;
            12'd452: b_note_div = `n;
            12'd453: b_note_div = `n;
            12'd454: b_note_div = `n; 
            12'd455: b_note_div = `n;
            12'd456: b_note_div = `n;          
            12'd457: b_note_div = `G;
            12'd458: b_note_div = `G;
            12'd459: b_note_div = `n;
            12'd460: b_note_div = `n; 
            12'd461: b_note_div = `E;
            12'd462: b_note_div = `E;
            12'd463: b_note_div = `n;
            12'd464: b_note_div = `n;           
            12'd465: b_note_div = `G;
            12'd466: b_note_div = `G;
            12'd467: b_note_div = `n;
            12'd468: b_note_div = `n;           
            12'd469: b_note_div = `B;
            12'd470: b_note_div = `B;
            12'd471: b_note_div = `n;
            12'd472: b_note_div = `n;           
            12'd473: b_note_div = `n;
            12'd474: b_note_div = `n;
            12'd475: b_note_div = `n;
            12'd476: b_note_div = `n;           
            12'd477: b_note_div = `E;
            12'd478: b_note_div = `E;          
            12'd479: b_note_div = `n;
            12'd480: b_note_div = `n; 
            12'd481: b_note_div = `G;
            12'd482: b_note_div = `G;
            12'd483: b_note_div = `n;
            12'd484: b_note_div = `n;           
            12'd485: b_note_div = `E;
            12'd486: b_note_div = `E;
            12'd487: b_note_div = `n;
            12'd488: b_note_div = `n;           
            12'd489: b_note_div = `G;
            12'd490: b_note_div = `G;
            12'd491: b_note_div = `n;
            12'd492: b_note_div = `n;           
            12'd493: b_note_div = `B;
            12'd494: b_note_div = `B;
            12'd495: b_note_div = `n;
            12'd496: b_note_div = `n; 
            12'd497: b_note_div = `n;
            12'd498: b_note_div = `n;                     
            12'd499: b_note_div = `n;
            12'd500: b_note_div = `n;
            12'd501: b_note_div = `B;
            12'd502: b_note_div = `B;
            12'd503: b_note_div = `n;
            12'd504: b_note_div = `n;           
            12'd505: b_note_div = `E;
            12'd506: b_note_div = `E;
            12'd507: b_note_div = `n;
            12'd508: b_note_div = `n;           
            12'd509: b_note_div = `G;
            12'd510: b_note_div = `G;
            12'd511: b_note_div = `n;
            12'd512: b_note_div = `n;   
  
  
  
            12'd513: b_note_div = `n;
            12'd514: b_note_div = `n; 
            12'd515: b_note_div = `n;
            12'd516: b_note_div = `n;
            12'd517: b_note_div = `n;
            12'd518: b_note_div = `n; 
            12'd519: b_note_div = `n;
            12'd520: b_note_div = `n;          
            12'd521: b_note_div = `G;
            12'd522: b_note_div = `G;
            12'd523: b_note_div = `n;
            12'd524: b_note_div = `n; 
            12'd525: b_note_div = `a;
            12'd526: b_note_div = `a;
            12'd527: b_note_div = `n;
            12'd528: b_note_div = `n;           
            12'd529: b_note_div = `n;
            12'd530: b_note_div = `n;
            12'd531: b_note_div = `n;
            12'd532: b_note_div = `n;           
            12'd533: b_note_div = `C;
            12'd534: b_note_div = `C;
            12'd535: b_note_div = `n;
            12'd536: b_note_div = `n;           
            12'd537: b_note_div = `E;
            12'd538: b_note_div = `E;
            12'd539: b_note_div = `n;
            12'd540: b_note_div = `n;           
            12'd541: b_note_div = `G;
            12'd542: b_note_div = `G;          
            12'd543: b_note_div = `n;
            12'd544: b_note_div = `n; 
            12'd545: b_note_div = `n;
            12'd546: b_note_div = `n;
            12'd547: b_note_div = `n;
            12'd548: b_note_div = `n;           
            12'd549: b_note_div = `n;
            12'd550: b_note_div = `n;
            12'd551: b_note_div = `n;
            12'd552: b_note_div = `n;           
            12'd553: b_note_div = `A;
            12'd554: b_note_div = `A;
            12'd555: b_note_div = `n;
            12'd556: b_note_div = `n;           
            12'd557: b_note_div = `F;
            12'd558: b_note_div = `F;
            12'd559: b_note_div = `n;
            12'd560: b_note_div = `n; 
            12'd561: b_note_div = `n;
            12'd562: b_note_div = `n;                     
            12'd563: b_note_div = `n;
            12'd564: b_note_div = `n;
            12'd565: b_note_div = `F;
            12'd566: b_note_div = `F;
            12'd567: b_note_div = `n;
            12'd568: b_note_div = `n;           
            12'd569: b_note_div = `D;
            12'd570: b_note_div = `D;
            12'd571: b_note_div = `n;
            12'd572: b_note_div = `n;           
            12'd573: b_note_div = `F;
            12'd574: b_note_div = `F;
            12'd575: b_note_div = `n;
            12'd576: b_note_div = `n;                                  
                                
            12'd577: b_note_div = `n;
            12'd578: b_note_div = `n; 
            12'd579: b_note_div = `n;
            12'd580: b_note_div = `n;
            12'd581: b_note_div = `n;
            12'd582: b_note_div = `n; 
            12'd583: b_note_div = `n;
            12'd584: b_note_div = `n;          
            12'd585: b_note_div = `G;
            12'd586: b_note_div = `G;
            12'd587: b_note_div = `n;
            12'd588: b_note_div = `n; 
            12'd589: b_note_div = `E;
            12'd590: b_note_div = `E;
            12'd591: b_note_div = `n;
            12'd592: b_note_div = `n;           
            12'd593: b_note_div = `G;
            12'd594: b_note_div = `G;
            12'd595: b_note_div = `n;
            12'd596: b_note_div = `n;           
            12'd597: b_note_div = `B;
            12'd598: b_note_div = `B;
            12'd599: b_note_div = `n;
            12'd600: b_note_div = `n;           
            12'd601: b_note_div = `n;
            12'd602: b_note_div = `n;
            12'd603: b_note_div = `n;
            12'd604: b_note_div = `n;           
            12'd605: b_note_div = `E;
            12'd606: b_note_div = `E;          
            12'd607: b_note_div = `n;
            12'd608: b_note_div = `n; 
            12'd609: b_note_div = `G;
            12'd610: b_note_div = `G;
            12'd611: b_note_div = `n;
            12'd612: b_note_div = `n;           
            12'd613: b_note_div = `E;
            12'd614: b_note_div = `E;
            12'd615: b_note_div = `n;
            12'd616: b_note_div = `n;           
            12'd617: b_note_div = `G;
            12'd618: b_note_div = `G;
            12'd619: b_note_div = `n;
            12'd620: b_note_div = `n;           
            12'd621: b_note_div = `B;
            12'd622: b_note_div = `B;
            12'd623: b_note_div = `n;
            12'd624: b_note_div = `n; 
            12'd625: b_note_div = `n;
            12'd626: b_note_div = `n;                     
            12'd627: b_note_div = `n;
            12'd628: b_note_div = `n;
            12'd629: b_note_div = `B;
            12'd630: b_note_div = `B;
            12'd631: b_note_div = `n;
            12'd632: b_note_div = `n;           
            12'd633: b_note_div = `E;
            12'd634: b_note_div = `E;
            12'd635: b_note_div = `n;
            12'd636: b_note_div = `n;           
            12'd637: b_note_div = `G;
            12'd638: b_note_div = `G;
            12'd639: b_note_div = `n;
            12'd640: b_note_div = `n;  

////jump
            12'd642: b_note_div = `g;
            12'd643: b_note_div = `g;
            12'd644: b_note_div = `n;
            12'd645: b_note_div = `n;  
            
////down
            12'd646: b_note_div = `e;
            12'd647: b_note_div = `e;
            12'd648: b_note_div = `n;
            12'd649: b_note_div = `n;                                   
            
////dead            
            12'd650: b_note_div = `n;
            12'd651: b_note_div = `c;
            12'd652: b_note_div = `n;
            12'd653: b_note_div = `c;
                                                 
                               
                                
                                
          default: b_note_div = 18'd0000;
      endcase
      case(note_2)    //4 note 32case
          12'd1: c_note_div = `E;
          12'd2: c_note_div = `n; 
          12'd3: c_note_div = `E;
          12'd4: c_note_div = `n;
          12'd5: c_note_div = `E;
          12'd6: c_note_div = `n;
          12'd7: c_note_div = `E;
          12'd8: c_note_div = `n;
          12'd9: c_note_div = `E;
          12'd10: c_note_div = `n;
          12'd11: c_note_div = `E;
          12'd12: c_note_div = `n;
          12'd13: c_note_div = `E;
          12'd14: c_note_div = `n;
          12'd15: c_note_div = `D;
          12'd16: c_note_div = `D;
          12'd17: c_note_div = `n;
          12'd18: c_note_div = `n;
          12'd19: c_note_div = `D;
          12'd20: c_note_div = `n;
          12'd21: c_note_div = `D;
          12'd22: c_note_div = `D;
          12'd23: c_note_div = `n;
          12'd24: c_note_div = `n;
          12'd25: c_note_div = `D;
          12'd26: c_note_div = `n;
          12'd27: c_note_div = `D;
          12'd28: c_note_div = `n;
          12'd29: c_note_div = `E;
          12'd30: c_note_div = `E;
          12'd31: c_note_div = `n;
          12'd32: c_note_div = `n;
          12'd33: c_note_div = `E;
          12'd34: c_note_div = `n; 
          12'd35: c_note_div = `E;
          12'd36: c_note_div = `n;
          12'd37: c_note_div = `E;
          12'd38: c_note_div = `n;
          12'd39: c_note_div = `E;
          12'd40: c_note_div = `n;
          12'd41: c_note_div = `E;
          12'd42: c_note_div = `n;
          12'd43: c_note_div = `E;
          12'd44: c_note_div = `n;
          12'd45: c_note_div = `E;
          12'd46: c_note_div = `n;
          12'd47: c_note_div = `D;
          12'd48: c_note_div = `D;
          12'd49: c_note_div = `n;
          12'd50: c_note_div = `n;
          12'd51: c_note_div = `D;
          12'd52: c_note_div = `n;
          12'd53: c_note_div = `D;
          12'd54: c_note_div = `D;
          12'd55: c_note_div = `n;
          12'd56: c_note_div = `n;
          12'd57: c_note_div = `D;
          12'd58: c_note_div = `n;
          12'd59: c_note_div = `D;
          12'd60: c_note_div = `n;
          12'd61: c_note_div = `E;
          12'd62: c_note_div = `E;
          12'd63: c_note_div = `n;
          12'd64: c_note_div = `n;   
          12'd65: c_note_div = `E;
          12'd66: c_note_div = `n; 
          12'd67: c_note_div = `E;
          12'd68: c_note_div = `n;
          12'd69: c_note_div = `E;
          12'd70: c_note_div = `n;
          12'd71: c_note_div = `E;
          12'd72: c_note_div = `n;
          12'd73: c_note_div = `E;
          12'd74: c_note_div = `n;
          12'd75: c_note_div = `E;
          12'd76: c_note_div = `n;
          12'd77: c_note_div = `E;
          12'd78: c_note_div = `n;
          12'd79: c_note_div = `D;
          12'd80: c_note_div = `D;
          12'd81: c_note_div = `n;
          12'd82: c_note_div = `n;
          12'd83: c_note_div = `D;
          12'd84: c_note_div = `n;
          12'd85: c_note_div = `D;
          12'd86: c_note_div = `D;
          12'd87: c_note_div = `n;
          12'd88: c_note_div = `n;
          12'd89: c_note_div = `D;
          12'd90: c_note_div = `n;
          12'd91: c_note_div = `D;
          12'd92: c_note_div = `n;
          12'd93: c_note_div = `E;
          12'd94: c_note_div = `E;
          12'd95: c_note_div = `n;
          12'd96: c_note_div = `n;
          12'd97: c_note_div = `a;
          12'd98: c_note_div = `n; 
          12'd99: c_note_div = `C;
          12'd100: c_note_div = `n;
          12'd101: c_note_div = `E;
          12'd102: c_note_div = `n;
          12'd103: c_note_div = `G;
          12'd104: c_note_div = `n;
          12'd105: c_note_div = `A;
          12'd106: c_note_div = `n;
          12'd107: c_note_div = `G;
          12'd108: c_note_div = `n;
          12'd109: c_note_div = `E;
          12'd110: c_note_div = `n;
          12'd111: c_note_div = `C;
          12'd112: c_note_div = `n;
          12'd113: c_note_div = `b;
          12'd114: c_note_div = `n;
          12'd115: c_note_div = `D;
          12'd116: c_note_div = `n;
          12'd117: c_note_div = `F;
          12'd118: c_note_div = `n;
          12'd119: c_note_div = `A;
          12'd120: c_note_div = `n;
          12'd121: c_note_div = `B;
          12'd122: c_note_div = `n;
          12'd123: c_note_div = `A;
          12'd124: c_note_div = `n;
          12'd125: c_note_div = `F;
          12'd126: c_note_div = `n;
          12'd127: c_note_div = `D;
          12'd128: c_note_div = `n; 
         
         
         
          
          12'd129: c_note_div = `e1;
          12'd130: c_note_div = `e1; 
          12'd131: c_note_div = `n;
          12'd132: c_note_div = `n;
          12'd133: c_note_div = `g;
          12'd134: c_note_div = `g;
          12'd135: c_note_div = `n;
          12'd136: c_note_div = `n;
          12'd137: c_note_div = `e1;
          12'd138: c_note_div = `e1; 
          12'd139: c_note_div = `n;
          12'd140: c_note_div = `n;
          12'd141: c_note_div = `g;
          12'd142: c_note_div = `g;
          12'd143: c_note_div = `n;
          12'd144: c_note_div = `n;
          12'd145: c_note_div = `e1;
          12'd146: c_note_div = `e1; 
          12'd147: c_note_div = `n;
          12'd148: c_note_div = `n;
          12'd149: c_note_div = `g;
          12'd150: c_note_div = `g;
          12'd151: c_note_div = `n;
          12'd152: c_note_div = `n;
          12'd153: c_note_div = `e1;
          12'd154: c_note_div = `e1; 
          12'd155: c_note_div = `n;
          12'd156: c_note_div = `n;
          12'd157: c_note_div = `g;
          12'd158: c_note_div = `g;
          12'd159: c_note_div = `n;
          12'd160: c_note_div = `n;   
          
          12'd161: c_note_div = `e1;
          12'd162: c_note_div = `e1; 
          12'd163: c_note_div = `n;
          12'd164: c_note_div = `n;
          12'd165: c_note_div = `g;
          12'd166: c_note_div = `g;
          12'd167: c_note_div = `n;
          12'd168: c_note_div = `n;
          12'd169: c_note_div = `e1;
          12'd170: c_note_div = `e1; 
          12'd171: c_note_div = `n;
          12'd172: c_note_div = `n;
          12'd173: c_note_div = `g;
          12'd174: c_note_div = `g;
          12'd175: c_note_div = `n;
          12'd176: c_note_div = `n;
          12'd177: c_note_div = `e1;
          12'd178: c_note_div = `e1; 
          12'd179: c_note_div = `n;
          12'd180: c_note_div = `n;
          12'd181: c_note_div = `g;
          12'd182: c_note_div = `g;
          12'd183: c_note_div = `n;
          12'd184: c_note_div = `n;
          12'd185: c_note_div = `e1;
          12'd186: c_note_div = `e1; 
          12'd187: c_note_div = `n;
          12'd188: c_note_div = `n;
          12'd189: c_note_div = `g;
          12'd190: c_note_div = `g;
          12'd191: c_note_div = `n;
          12'd192: c_note_div = `n; 
          
          
          12'd193: c_note_div = `c1;
          12'd194: c_note_div = `c1; 
          12'd195: c_note_div = `n;
          12'd196: c_note_div = `n;
          12'd197: c_note_div = `g;
          12'd198: c_note_div = `g;
          12'd199: c_note_div = `n;
          12'd200: c_note_div = `n;
          12'd201: c_note_div = `c1;
          12'd202: c_note_div = `c1; 
          12'd203: c_note_div = `n;
          12'd204: c_note_div = `n;
          12'd205: c_note_div = `g;
          12'd206: c_note_div = `g;
          12'd207: c_note_div = `n;
          12'd208: c_note_div = `n;
          12'd209: c_note_div = `c1;
          12'd210: c_note_div = `c1; 
          12'd211: c_note_div = `n;
          12'd212: c_note_div = `n;
          12'd213: c_note_div = `g;
          12'd214: c_note_div = `g;
          12'd215: c_note_div = `n;
          12'd216: c_note_div = `n;
          12'd217: c_note_div = `c1;
          12'd218: c_note_div = `c1; 
          12'd219: c_note_div = `n;
          12'd220: c_note_div = `n;
          12'd221: c_note_div = `g;
          12'd222: c_note_div = `g;
          12'd223: c_note_div = `n;
          12'd224: c_note_div = `n;
          
          12'd225: c_note_div = `c1;
          12'd226: c_note_div = `c1; 
          12'd227: c_note_div = `n;
          12'd228: c_note_div = `n;
          12'd229: c_note_div = `g;
          12'd230: c_note_div = `g;
          12'd231: c_note_div = `n;
          12'd232: c_note_div = `n;
          12'd233: c_note_div = `c1;
          12'd234: c_note_div = `c1; 
          12'd235: c_note_div = `n;
          12'd236: c_note_div = `n;
          12'd237: c_note_div = `g;
          12'd238: c_note_div = `g;
          12'd239: c_note_div = `n;
          12'd240: c_note_div = `n;
          12'd241: c_note_div = `c1;
          12'd242: c_note_div = `c1; 
          12'd243: c_note_div = `n;
          12'd244: c_note_div = `n;
          12'd245: c_note_div = `g;
          12'd246: c_note_div = `g;
          12'd247: c_note_div = `n;
          12'd248: c_note_div = `n;
          12'd249: c_note_div = `c1;
          12'd250: c_note_div = `c1; 
          12'd251: c_note_div = `n;
          12'd252: c_note_div = `n;
          12'd253: c_note_div = `g;
          12'd254: c_note_div = `g;
          12'd255: c_note_div = `n;
          12'd256: c_note_div = `n;
          
          12'd257: c_note_div = `a1;
          12'd258: c_note_div = `a1; 
          12'd259: c_note_div = `n;
          12'd260: c_note_div = `n;
          12'd261: c_note_div = `c;
          12'd262: c_note_div = `c;
          12'd263: c_note_div = `n;
          12'd264: c_note_div = `n;
          12'd265: c_note_div = `a1;
          12'd266: c_note_div = `a1; 
          12'd267: c_note_div = `n;
          12'd268: c_note_div = `n;
          12'd269: c_note_div = `c;
          12'd270: c_note_div = `c;
          12'd271: c_note_div = `n;
          12'd272: c_note_div = `n;
          12'd273: c_note_div = `a1;
          12'd274: c_note_div = `a1; 
          12'd275: c_note_div = `n;
          12'd276: c_note_div = `n;
          12'd277: c_note_div = `c;
          12'd278: c_note_div = `c;
          12'd279: c_note_div = `n;
          12'd280: c_note_div = `n;
          12'd281: c_note_div = `a1;
          12'd282: c_note_div = `a1; 
          12'd283: c_note_div = `n;
          12'd284: c_note_div = `n;
          12'd285: c_note_div = `c;
          12'd286: c_note_div = `c;
          12'd287: c_note_div = `n;
          12'd288: c_note_div = `n;                 
 
          12'd289: c_note_div = `b1;
          12'd290: c_note_div = `b1; 
          12'd291: c_note_div = `n;
          12'd292: c_note_div = `n;
          12'd293: c_note_div = `d;
          12'd294: c_note_div = `d;
          12'd295: c_note_div = `n;
          12'd296: c_note_div = `n;
          12'd297: c_note_div = `b1;
          12'd298: c_note_div = `b1; 
          12'd299: c_note_div = `n;
          12'd300: c_note_div = `n;
          12'd301: c_note_div = `d;
          12'd302: c_note_div = `d;
          12'd303: c_note_div = `n;
          12'd304: c_note_div = `n;
          12'd305: c_note_div = `b1;
          12'd306: c_note_div = `b1; 
          12'd307: c_note_div = `n;
          12'd308: c_note_div = `n;
          12'd309: c_note_div = `d;
          12'd310: c_note_div = `d;
          12'd311: c_note_div = `n;
          12'd312: c_note_div = `n;
          12'd313: c_note_div = `b1;
          12'd314: c_note_div = `b1; 
          12'd315: c_note_div = `n;
          12'd316: c_note_div = `n;
          12'd317: c_note_div = `d;
          12'd318: c_note_div = `d;
          12'd319: c_note_div = `n;
          12'd320: c_note_div = `n;      
          
          12'd321: c_note_div = `e;
          12'd322: c_note_div = `e; 
          12'd323: c_note_div = `n;
          12'd324: c_note_div = `n;
          12'd325: c_note_div = `g;
          12'd326: c_note_div = `g;
          12'd327: c_note_div = `n;
          12'd328: c_note_div = `n;
          12'd329: c_note_div = `e;
          12'd330: c_note_div = `e; 
          12'd331: c_note_div = `n;
          12'd332: c_note_div = `n;
          12'd333: c_note_div = `g;
          12'd334: c_note_div = `g;
          12'd335: c_note_div = `n;
          12'd336: c_note_div = `n;
          12'd337: c_note_div = `e;
          12'd338: c_note_div = `e; 
          12'd339: c_note_div = `n;
          12'd340: c_note_div = `n;
          12'd341: c_note_div = `g;
          12'd342: c_note_div = `g;
          12'd343: c_note_div = `n;
          12'd344: c_note_div = `n;
          12'd345: c_note_div = `e;
          12'd346: c_note_div = `e; 
          12'd347: c_note_div = `n;
          12'd348: c_note_div = `n;
          12'd349: c_note_div = `g;
          12'd350: c_note_div = `g;
          12'd351: c_note_div = `n;
          12'd352: c_note_div = `n;                
          
          12'd353: c_note_div = `b;
          12'd354: c_note_div = `n; 
          12'd355: c_note_div = `f;
          12'd356: c_note_div = `n;
          12'd357: c_note_div = `b;
          12'd358: c_note_div = `n;
          12'd359: c_note_div = `D1;
          12'd360: c_note_div = `n;
          12'd361: c_note_div = `F;
          12'd362: c_note_div = `n; 
          12'd363: c_note_div = `b;
          12'd364: c_note_div = `n;
          12'd365: c_note_div = `D1;
          12'd366: c_note_div = `n;
          12'd367: c_note_div = `F;
          12'd368: c_note_div = `n;
          12'd369: c_note_div = `B;
          12'd370: c_note_div = `n; 
          12'd371: c_note_div = `D1;
          12'd372: c_note_div = `n;
          12'd373: c_note_div = `F;
          12'd374: c_note_div = `n;
          12'd375: c_note_div = `B;
          12'd376: c_note_div = `n;
          12'd377: c_note_div = `D1;
          12'd378: c_note_div = `n; 
          12'd379: c_note_div = `f;
          12'd380: c_note_div = `n;
          12'd381: c_note_div = `b;
          12'd382: c_note_div = `n;
          12'd383: c_note_div = `D1;
          12'd384: c_note_div = `n;   
                                        
          12'd385: c_note_div = `c1;
          12'd368: c_note_div = `n;
          12'd387: c_note_div = `c1;
          12'd388: c_note_div = `n;
          12'd389: c_note_div = `c1;
          12'd390: c_note_div = `c1;
          12'd391: c_note_div = `n;
          12'd392: c_note_div = `n;
          12'd393: c_note_div = `c1;
          12'd394: c_note_div = `n;
          12'd395: c_note_div = `c1;
          12'd396: c_note_div = `n;
          12'd397: c_note_div = `c1;
          12'd398: c_note_div = `c1;
          12'd399: c_note_div = `n;
          12'd400: c_note_div = `n;
          12'd401: c_note_div = `c1;
          12'd402: c_note_div = `n;
          12'd403: c_note_div = `c1;
          12'd404: c_note_div = `n;
          12'd405: c_note_div = `c1;
          12'd406: c_note_div = `c1;
          12'd407: c_note_div = `n;
          12'd408: c_note_div = `n;
          12'd409: c_note_div = `c1;
          12'd410: c_note_div = `n;
          12'd411: c_note_div = `c1;
          12'd412: c_note_div = `n;
          12'd413: c_note_div = `c1;
          12'd414: c_note_div = `c1;
          12'd415: c_note_div = `n;
          12'd416: c_note_div = `n;            
          
          12'd417: c_note_div = `d1;
          12'd418: c_note_div = `n;
          12'd419: c_note_div = `d1;
          12'd420: c_note_div = `n;
          12'd421: c_note_div = `d1;
          12'd422: c_note_div = `d1;
          12'd423: c_note_div = `n;
          12'd424: c_note_div = `n;
          12'd425: c_note_div = `d1;
          12'd426: c_note_div = `n;
          12'd427: c_note_div = `d1;
          12'd428: c_note_div = `n;
          12'd429: c_note_div = `d1;
          12'd430: c_note_div = `d1;
          12'd431: c_note_div = `n;
          12'd432: c_note_div = `n;
          12'd433: c_note_div = `d1;
          12'd434: c_note_div = `n;
          12'd435: c_note_div = `d1;
          12'd436: c_note_div = `n;
          12'd437: c_note_div = `d1;
          12'd438: c_note_div = `d1;
          12'd439: c_note_div = `n;
          12'd440: c_note_div = `n;
          12'd441: c_note_div = `d1;
          12'd442: c_note_div = `n;
          12'd443: c_note_div = `d1;
          12'd444: c_note_div = `n;
          12'd445: c_note_div = `d1;
          12'd446: c_note_div = `d1;
          12'd447: c_note_div = `n;
          12'd448: c_note_div = `n;
          
          12'd449: c_note_div = `b2;
          12'd450: c_note_div = `n;
          12'd451: c_note_div = `b2;
          12'd452: c_note_div = `n;
          12'd453: c_note_div = `b2;
          12'd454: c_note_div = `b2;
          12'd455: c_note_div = `n;
          12'd456: c_note_div = `n;
          12'd457: c_note_div = `b2;
          12'd458: c_note_div = `n;
          12'd459: c_note_div = `b2;
          12'd460: c_note_div = `n;
          12'd461: c_note_div = `b2;
          12'd462: c_note_div = `b2;
          12'd463: c_note_div = `n;
          12'd464: c_note_div = `n;
          12'd465: c_note_div = `b2;
          12'd466: c_note_div = `n;
          12'd467: c_note_div = `b2;
          12'd468: c_note_div = `n;
          12'd469: c_note_div = `b2;
          12'd470: c_note_div = `b2;
          12'd471: c_note_div = `n;
          12'd472: c_note_div = `n;
          12'd473: c_note_div = `b2;
          12'd474: c_note_div = `n;
          12'd475: c_note_div = `b2;
          12'd476: c_note_div = `n;
          12'd477: c_note_div = `b2;
          12'd478: c_note_div = `b2;
          12'd479: c_note_div = `n;
          12'd480: c_note_div = `n;
          
          12'd481: c_note_div = `c1;
          12'd482: c_note_div = `n;
          12'd483: c_note_div = `c1;
          12'd484: c_note_div = `n;
          12'd485: c_note_div = `c1;
          12'd486: c_note_div = `c1;
          12'd487: c_note_div = `n;
          12'd488: c_note_div = `n;
          12'd489: c_note_div = `c1;
          12'd490: c_note_div = `n;
          12'd491: c_note_div = `c1;
          12'd492: c_note_div = `n;
          12'd493: c_note_div = `c1;
          12'd494: c_note_div = `c1;
          12'd495: c_note_div = `n;
          12'd496: c_note_div = `n;
          12'd497: c_note_div = `c1;
          12'd498: c_note_div = `n;
          12'd499: c_note_div = `c1;
          12'd500: c_note_div = `n;
          12'd501: c_note_div = `c1;
          12'd502: c_note_div = `c1;
          12'd503: c_note_div = `n;
          12'd504: c_note_div = `n;
          12'd505: c_note_div = `c1;
          12'd506: c_note_div = `n;
          12'd507: c_note_div = `c1;
          12'd508: c_note_div = `n;
          12'd509: c_note_div = `c1;
          12'd510: c_note_div = `c1;
          12'd511: c_note_div = `n;
          12'd512: c_note_div = `n; 
          
          12'd513: c_note_div = `c1;
          12'd514: c_note_div = `n;
          12'd515: c_note_div = `c1;
          12'd516: c_note_div = `n;
          12'd517: c_note_div = `c1;
          12'd518: c_note_div = `c1;
          12'd519: c_note_div = `n;
          12'd520: c_note_div = `n;
          12'd521: c_note_div = `c1;
          12'd522: c_note_div = `n;
          12'd523: c_note_div = `c1;
          12'd524: c_note_div = `n;
          12'd525: c_note_div = `c1;
          12'd526: c_note_div = `c1;
          12'd527: c_note_div = `n;
          12'd528: c_note_div = `n;
          12'd529: c_note_div = `c1;
          12'd530: c_note_div = `n;
          12'd531: c_note_div = `c1;
          12'd532: c_note_div = `n;
          12'd533: c_note_div = `c1;
          12'd534: c_note_div = `c1;
          12'd535: c_note_div = `n;
          12'd536: c_note_div = `n;
          12'd537: c_note_div = `c1;
          12'd538: c_note_div = `n;
          12'd539: c_note_div = `c1;
          12'd540: c_note_div = `n;
          12'd541: c_note_div = `c1;
          12'd542: c_note_div = `c1;
          12'd543: c_note_div = `n;
          12'd544: c_note_div = `n;
          
          12'd545: c_note_div = `a2;
          12'd546: c_note_div = `n;
          12'd547: c_note_div = `a2;
          12'd548: c_note_div = `n;
          12'd549: c_note_div = `a2;
          12'd550: c_note_div = `a2;
          12'd551: c_note_div = `n;
          12'd552: c_note_div = `n; 
          12'd553: c_note_div = `a2;
          12'd554: c_note_div = `n;
          12'd555: c_note_div = `a2;
          12'd556: c_note_div = `n;
          12'd557: c_note_div = `a2;
          12'd558: c_note_div = `a2;
          12'd559: c_note_div = `n;
          12'd560: c_note_div = `n;
          12'd561: c_note_div = `a2;
          12'd562: c_note_div = `n;
          12'd563: c_note_div = `a2;
          12'd564: c_note_div = `n;
          12'd565: c_note_div = `a2;
          12'd566: c_note_div = `a2;
          12'd567: c_note_div = `n;
          12'd568: c_note_div = `n;
          12'd569: c_note_div = `a2;
          12'd570: c_note_div = `n;
          12'd571: c_note_div = `a2;
          12'd572: c_note_div = `n;
          12'd573: c_note_div = `a2;
          12'd574: c_note_div = `a2;
          12'd575: c_note_div = `n;
          12'd576: c_note_div = `n;
          
          12'd577: c_note_div = `d2;
          12'd578: c_note_div = `n;
          12'd579: c_note_div = `d2;
          12'd580: c_note_div = `n;
          12'd581: c_note_div = `d2;
          12'd582: c_note_div = `d2;
          12'd583: c_note_div = `n;
          12'd584: c_note_div = `n;
          12'd585: c_note_div = `d2;
          12'd586: c_note_div = `n;
          12'd587: c_note_div = `d2;
          12'd588: c_note_div = `n;
          12'd589: c_note_div = `d2;
          12'd590: c_note_div = `d2;
          12'd591: c_note_div = `n;
          12'd592: c_note_div = `n;
          12'd593: c_note_div = `d2;
          12'd594: c_note_div = `n;
          12'd595: c_note_div = `d2;
          12'd596: c_note_div = `n;
          12'd597: c_note_div = `d2;
          12'd598: c_note_div = `d2;
          12'd599: c_note_div = `n;
          12'd600: c_note_div = `n;
          12'd601: c_note_div = `d2;
          12'd602: c_note_div = `n;
          12'd603: c_note_div = `d2;
          12'd604: c_note_div = `n;
          12'd605: c_note_div = `d2;
          12'd606: c_note_div = `d2;
          12'd607: c_note_div = `n;
          12'd608: c_note_div = `n;
          
          12'd609: c_note_div = `b;
          12'd610: c_note_div = `n; 
          12'd611: c_note_div = `f;
          12'd612: c_note_div = `n;
          12'd613: c_note_div = `b;
          12'd614: c_note_div = `n;
          12'd615: c_note_div = `D1;
          12'd616: c_note_div = `n;
          12'd617: c_note_div = `F;
          12'd618: c_note_div = `n; 
          12'd619: c_note_div = `b;
          12'd620: c_note_div = `n;
          12'd621: c_note_div = `D1;
          12'd622: c_note_div = `n;
          12'd623: c_note_div = `F;
          12'd624: c_note_div = `n;
          12'd625: c_note_div = `B;
          12'd626: c_note_div = `n; 
          12'd627: c_note_div = `D1;
          12'd628: c_note_div = `n;
          12'd629: c_note_div = `F;
          12'd630: c_note_div = `n;
          12'd631: c_note_div = `B;
          12'd632: c_note_div = `n;
          12'd633: c_note_div = `D2;
          12'd634: c_note_div = `n; 
          12'd635: c_note_div = `F;
          12'd636: c_note_div = `n;
          12'd637: c_note_div = `B;
          12'd638: c_note_div = `n;
          12'd639: c_note_div = `D2;
          12'd640: c_note_div = `n; 

////jump
          12'd642: c_note_div = `g;
          12'd643: c_note_div = `g;
          12'd644: c_note_div = `n;
          12'd645: c_note_div = `n;  
                      
////down
          12'd646: c_note_div = `e;
          12'd647: c_note_div = `e;
          12'd648: c_note_div = `n;
          12'd649: c_note_div = `n;                                   
                      
////dead            
          12'd650: c_note_div = `n;
          12'd651: c_note_div = `c;
          12'd652: c_note_div = `n;
          12'd653: c_note_div = `c;
          
                                    
          default: c_note_div = 18'd0000;
      endcase
      
    case(level)
            4'd15, 4'd14, 4'd13:
            begin
                audio_l = (b_clk == 1'b0) ? 16'hB000 : 16'h5FFF;
                audio_r = (c_clk == 1'b0) ? 16'hB000 : 16'h5FFF;
            end
            4'd12:
            begin
                audio_l = (b_clk == 1'b0) ? 16'hB800 : 16'h57FF;
                audio_r = (c_clk == 1'b0) ? 16'hB800 : 16'h57FF;
            end
            4'd11:
            begin
                audio_l = (b_clk == 1'b0) ? 16'hC000 : 16'h4FFF;
                audio_r = (c_clk == 1'b0) ? 16'hC000 : 16'h4FFF;
            end
            4'd10:
            begin
                audio_l = (b_clk == 1'b0) ? 16'hC800 : 16'h47FF;
                audio_r = (c_clk == 1'b0) ? 16'hC800 : 16'h47FF;
            end
            4'd9:
            begin
                audio_l = (b_clk == 1'b0) ? 16'hD000 : 16'h3FFF;
                audio_r = (c_clk == 1'b0) ? 16'hD000 : 16'h3FFF;
            end
            4'd8:
            begin
                audio_l = (b_clk == 1'b0) ? 16'hD800 : 16'h37FF;
                audio_r = (c_clk == 1'b0) ? 16'hD800 : 16'h37FF;
            end
            4'd7:
            begin
                audio_l = (b_clk == 1'b0) ? 16'hE000 : 16'h2FFF;
                audio_r = (c_clk == 1'b0) ? 16'hE000 : 16'h2FFF;
            end
            4'd6:
            begin
                audio_l = (b_clk == 1'b0) ? 16'hE800 : 16'h27FF;
                audio_r = (c_clk == 1'b0) ? 16'hE800 : 16'h27FF;
            end
            4'd5:
            begin
                audio_l = (b_clk == 1'b0) ? 16'hF000 : 16'h1FFF;
                audio_r = (c_clk == 1'b0) ? 16'hF000 : 16'h1FFF;
            end
            4'd4:
            begin
                audio_l = (b_clk == 1'b0) ? 16'hF800 : 16'h17FF;
                audio_r = (c_clk == 1'b0) ? 16'hF800 : 16'h17FF;
            end
            4'd3:
            begin
                audio_l = (b_clk == 1'b0) ? 16'h0000 : 16'h0FFF;
                audio_r = (c_clk == 1'b0) ? 16'h0000 : 16'h0FFF;
            end
            4'd2, 4'd1, 4'd0:
            begin
                audio_l = (b_clk == 1'b0) ? 16'h0000 : 16'h0000;
                audio_r = (c_clk == 1'b0) ? 16'h0000 : 16'h0000;
            end                                                      
        endcase 

 

    end
    
    
    

    
endmodule
