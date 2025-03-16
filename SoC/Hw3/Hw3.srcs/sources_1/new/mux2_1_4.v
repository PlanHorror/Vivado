`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/16/2025 01:55:30 PM
// Design Name: 
// Module Name: mux2_1_4
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


module mux2_1_4(
input [3:0] a,
input [3:0] b,
input s,
output [3:0] x
    );
wire s_cnv;
wire [3:0] a1,b1;

not(s_cnv,s);
and(a1[3],s_cnv,a[3]);
and(a1[2],s_cnv,a[2]);
and(a1[1],s_cnv,a[1]);
and(a1[0],s_cnv,a[0]);
and(b1[3],s,b[3]);
and(b1[2],s,b[2]);
and(b1[1],s,b[1]);
and(b1[0],s,b[0]);
or(x[3],a1[3],b1[3]);
or(x[2],a1[2],b1[2]);
or(x[1],a1[1],b1[1]);
or(x[0],a1[0],b1[0]);
endmodule
