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
input [7:0]a,
input [2:0]s,
output f
);
wire [2:0]s1;
wire [7:0]y;
not not_gate[2:0](s1,s);
and(y[0],a[0],s1[0],s1[1],s1[2]);
and(y[1],a[1],s1[0],s1[1],s[2]);
and(y[2],a[2],s1[0],s[1],s1[2]);
and(y[3],a[3],s1[0],s[1],s[2]);
and(y[4],a[4],s[0],s1[1],s1[2]);
and(y[5],a[5],s[0],s1[1],s[2]);
and(y[6],a[6],s[0],s[1],s1[2]);
and(y[7],a[7],s[0],s[1],s[2]);
or or_gate(f,y[0],y[1],y[2],y[3],y[4],y[5],y[6],y[7]);
endmodule
