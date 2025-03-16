`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/17/2025 01:42:20 AM
// Design Name: 
// Module Name: adder_4
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


module adder_4(
input [3:0] a,
input [3:0] b,
output [4:0] x
    );
wire [3:0] c_out;
full_adder add0(a[0],b[0],0,x[0],c_out[0]);
full_adder add1(a[1],b[1],c_out[0],x[1],c_out[1]);
full_adder add2(a[2],b[2],c_out[1],x[2],c_out[2]);
full_adder add3(a[3],b[3],c_out[2],x[3],c_out[3]);
assign x[4] = c_out[3];

endmodule
