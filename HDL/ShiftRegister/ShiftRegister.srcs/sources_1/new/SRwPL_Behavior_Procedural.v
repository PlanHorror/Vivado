`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/25/2025 03:01:42 PM
// Design Name: 
// Module Name: SRwPL_Behavior_Procedural
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


module SRwPL_Behavior_Procedural(
    input [3:0] I,
    input clk, Il, Ir,
    input [1:0] sel,
    output reg [3:0] Y
);
    always @(posedge clk ) begin
        case (sel)
            2'b00: Y = Y;
            2'b01: Y = I;
            2'b10: Y = {Y[2:0], Ir};
            2'b11: Y = {Il, Y[3:1]};
            default: Y = 4'bXX;
        endcase
    end
endmodule
