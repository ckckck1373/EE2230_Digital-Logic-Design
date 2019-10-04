`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/06/07 22:07:46
// Design Name: 
// Module Name: VGA_640_480
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


module VGA_640_480(
    input wire clk_vga,//分?的??，?率?25mhz
	input wire RESET,
	output HS,
	output VS,
	output valid,
    output [31:0] xpos,
    output [31:0] ypos
    );
    
    reg [31:0]h_count;
        reg [31:0]v_count;    
        
        //行??：h_count(0-639+8+8+96+40+8 = 799)
        always@(posedge clk_vga )begin
            if(h_count == 10'd799)
                h_count <= 10'h0;
            else
                h_count <= h_count + 10'h1;
        end
    
        assign xpos = h_count - 10'd143;
        assign HS = (h_count >= 10'd96);
    
        //???：v_count(0-524)
        always@(posedge clk_vga )begin
            if(h_count == 10'd799)begin        
                if(v_count == 10'd524)v_count <= 10'h0;
                else v_count <= v_count + 10'h1;
            end
        end
    
        assign ypos = v_count - 10'd35;
        assign VS = (v_count >= 10'd2);
        assign valid = (((h_count >= 10'd143)&&(h_count < 10'd783)) && ((v_count >= 10'd35) && (v_count < 10'd515)));    
            
        
endmodule
