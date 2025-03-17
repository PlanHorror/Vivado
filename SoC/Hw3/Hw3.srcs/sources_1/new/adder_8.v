`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/16/2025 01:31:09 PM
// Design Name: 
// Module Name: adder_8
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


module adder_8(
input [7:0] a,
input [7:0] b,
output [8:0] x
    );
wire [7:0] c_out;
full_adder add0(a[0],b[0],0,x[0],c_out[0]);
full_adder add1(a[1],b[1],c_out[0],x[1],c_out[1]);
full_adder add2(a[2],b[2],c_out[1],x[2],c_out[2]);
full_adder add3(a[3],b[3],c_out[2],x[3],c_out[3]);
full_adder add4(a[4],b[4],c_out[3],x[4],c_out[4]);
full_adder add5(a[5],b[5],c_out[4],x[5],c_out[5]);
full_adder add6(a[6],b[6],c_out[5],x[6],c_out[6]);
full_adder add7(a[7],b[7],c_out[6],x[7],c_out[7]);
assign x[8] = c_out[7];

endmodule
