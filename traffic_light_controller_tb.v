`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.05.2026 15:34:11
// Design Name: 
// Module Name: traffic_light_controller_tb
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


`timescale 1ns / 1ps

module traffic_light_controller_tb;

    reg clk;
    reg reset;

    wire roadA_red;
    wire roadA_yellow;
    wire roadA_green;
    wire roadB_red;
    wire roadB_yellow;
    wire roadB_green;

    traffic_light_controller uut (
        .clk(clk),
        .reset(reset),
        .roadA_red(roadA_red),
        .roadA_yellow(roadA_yellow),
        .roadA_green(roadA_green),
        .roadB_red(roadB_red),
        .roadB_yellow(roadB_yellow),
        .roadB_green(roadB_green)
    );

    always #5 clk = ~clk;

    initial
    begin
        clk = 0;
        reset = 1;

        #10;
        reset = 0;

        #200;

        $finish;
    end

endmodule