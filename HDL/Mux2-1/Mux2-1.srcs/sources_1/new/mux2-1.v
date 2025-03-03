`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/03/2025 06:17:23 PM
// Design Name: 
// Module Name: mux2-1
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


module mux2_1(
input a,b,s0,
output f
    );
wire s1,y0,y1;
not(s1,s0);
and(y0,a,s1);
and(y1,b,s0);
or(f,y1,y0);
endmodule
