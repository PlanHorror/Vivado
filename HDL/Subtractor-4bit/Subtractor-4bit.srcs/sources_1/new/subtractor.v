`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/03/2025 08:42:04 AM
// Design Name: 
// Module Name: subtractor
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


module subtractor(
    input [3:0] a, b,
    output [3:0] diff, c_out

    );
    wire [3:0] b_in;
    assign b_in = ~b;
    full_adder fa0(.a(a[0]), .b(b_in[0]), .cin(0), .sum(diff[0]), .cout(c_out[0]));
    full_adder fa1(.a(a[1]), .b(b_in[1]), .cin(c_out[0]), .sum(diff[1]), .cout(c_out[1]));
    full_adder fa2(.a(a[2]), .b(b_in[2]), .cin(c_out[1]), .sum(diff[2]), .cout(c_out[2]));
    full_adder fa3(.a(a[3]), .b(b_in[3]), .cin(c_out[2]), .sum(diff[3]), .cout(c_out[3]));
    


endmodule
