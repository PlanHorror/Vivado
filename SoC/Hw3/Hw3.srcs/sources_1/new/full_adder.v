`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/17/2025 12:56:38 AM
// Design Name: 
// Module Name: full_adder
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


module full_adder(
input a,b,c_in,
output x,c_out
    );
wire y,z,t,r;
// Part of sum
xor(y,a,b);
xor(x,y,c_in);
// Part of c out
and(z,c_in,y);
and(t,a,b);
or(c_out,z,t);
endmodule
