`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/16/2025 01:31:09 PM
// Design Name: 
// Module Name: multiple_4
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


module multiple_4(
input [3:0] a,
input [3:0] b,
output [7:0] x
    );
wire [3:0] c3,c2,c1,c0;
wire [4:0] s0,s1,s2;
and (c0[3],a[0],b[3]);
and (c0[2],a[0],b[2]);
and (c0[1],a[0],b[1]);
and (c0[0],a[0],b[0]);
and (c1[3],a[1],b[3]);
and (c1[2],a[1],b[2]);
and (c1[1],a[1],b[1]);
and (c1[0],a[1],b[0]);
and (c2[3],a[2],b[3]);
and (c2[2],a[2],b[2]);
and (c2[1],a[2],b[1]);
and (c2[0],a[2],b[0]);
and (c3[3],a[3],b[3]);
and (c3[2],a[3],b[2]);
and (c3[1],a[3],b[1]);
and (c3[0],a[3],b[0]);
adder_4 adder0({0,c0[3],c0[2],c0[1]},c1,s0);
adder_4 adder1(s0[4:1],c2,s1);
adder_4 adder2(s1[4:1],c3,s2);
assign x = {s2,s1[0],s0[0],c0[0]};
endmodule
