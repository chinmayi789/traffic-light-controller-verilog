`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.05.2026 14:02:39
// Design Name: 
// Module Name: traffic_light_controller
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


module traffic_light_controller(
    input clk,
    input reset,
    output reg roadA_red,
output reg roadB_yellow,
output reg roadA_green,
output reg roadB_red,
output reg roadA_yellow,
output reg roadB_green
    );
    reg [1:0] state;
    reg [3:0] counter;
    always @(posedge clk or posedge reset)
begin
    if (reset)
    begin
        state <= 2'b00;
        counter <= 4'b0000;
    end
else
    begin
       if (counter == 4'd5)
begin
    counter <= 4'd0;
    state <= state + 1;
end
else
begin
    counter <= counter + 1;
end
    end
    end
    always @(*)
begin
    case(state)

        2'b00:
        begin
            roadA_green = 1;
            roadA_yellow = 0;
            roadA_red = 0;

            roadB_green = 0;
            roadB_yellow = 0;
            roadB_red = 1;
        end

        2'b01:
        begin
            roadA_green = 0;
            roadA_yellow = 1;
            roadA_red = 0;

            roadB_green = 0;
            roadB_yellow = 0;
            roadB_red = 1;
        end

        2'b10:
        begin
            roadA_green = 0;
            roadA_yellow = 0;
            roadA_red = 1;

            roadB_green = 1;
            roadB_yellow = 0;
            roadB_red = 0;
        end

        2'b11:
        begin
            roadA_green = 0;
            roadA_yellow = 0;
            roadA_red = 1;

            roadB_green = 0;
            roadB_yellow = 1;
            roadB_red = 0;
        end
default:
begin
    roadA_green = 0;
    roadA_yellow = 0;
    roadA_red = 1;

    roadB_green = 0;
    roadB_yellow = 0;
    roadB_red = 1;
end
    endcase
end

endmodule
