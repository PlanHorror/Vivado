`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/03/2025 06:29:54 PM
// Design Name: 
// Module Name: mux8_1
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


module mux8_1(
input a0,a1,a2,a3,a4,a5,a6,a7,
input [2:0]s,
output f
);
wire [2:0]s1;
wire [7:0]y;
not not_gate[2:0](s1,s);
and(y[0],a0,s1[0],s1[1],s1[2]);
and(y[1],a1,s1[0],s1[1],s[2]);
and(y[2],a2,s1[0],s[1],s1[2]);
and(y[3],a3,s1[0],s[1],s[2]);
and(y[4],a4,s[0],s1[1],s1[2]);
and(y[5],a5,s[0],s1[1],s[2]);
and(y[6],a6,s[0],s[1],s1[2]);
and(y[7],a7,s[0],s[1],s[2]);
or or_gate(f,y[0],y[1],y[2],y[3],y[4],y[5],y[6],y[7]);
endmodule
