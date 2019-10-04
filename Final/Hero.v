`timescale 1ns / 1ps

module Hero(
        input clk_5ms, // 200Hz
        input clk_100ms, // 10Hz
        input reset,
        input enable,
        input jump,
        input down,
        output reg [31:0] y_hero,
        output reg showmode
);
 
    localparam y_initial = 448; //dino's s initial position
    reg [31:0] velocity;    //  we make 70 become 0 here to prevernt negative number here
    
    initial 
    begin
        y_hero = y_initial;
        velocity = 1'b0;
        showmode = 1'b0;
    end
    
    
    always@(posedge clk_100ms)
    begin
        if(reset)
            showmode = 1'b0;
        else 
        begin
            if(enable)
            begin
                if(y_hero == y_initial)
                    showmode = ~showmode;
                    else showmode = 1'b0;                
            end
        end
    end
    
    always@(posedge clk_5ms or posedge jump)
    begin
        if(reset)
        begin
            velocity <= 0;
            y_hero <= y_initial;
        end
        else 
            begin
                if(enable)
                begin
                    if(jump&&(velocity == 0))  
                        begin velocity = 160; end
                    else 
                        begin velocity = velocity; y_hero = y_hero; end                               
                        if(velocity >= 1 && down == 0)
                            begin
                                velocity = velocity - 1'b1;
                               if(velocity >= 80)
                                      y_hero = y_initial - ((6400-(velocity-80)*(velocity-80))/20);
                                else
                                      y_hero = y_initial - ((6400-(80-velocity)*(80-velocity))/20);
                            end
                       else if(velocity >=1 && down == 1)
                           begin
                               velocity = velocity - 4'd2;
                              if(velocity >= 80)
                                      y_hero = y_initial - ((6400-(velocity-80)*(velocity-80))/20);
                              else
                                      y_hero = y_initial - ((6400-(80-velocity)*(80-velocity))/20);
                              end
                          
                 end
             end
    end
 endmodule