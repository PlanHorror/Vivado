`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/24/2025 03:49:39 PM
// Design Name: 
// Module Name: mux4_1
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


module mux4_1(
    input [1:0] sel,
    input a0,a1,a2,a3,
    output o
);
    wire t0,t1,t2,t3;
    and(t0,a0,~sel[1],~sel[0]);
    and(t1,a1,~sel[1],sel[0]);
    and(t2,a2,sel[1],~sel[0]);
    and(t3,a3,sel[1],sel[0]);
    or(o,t0,t1,t2,t3);
endmodule
