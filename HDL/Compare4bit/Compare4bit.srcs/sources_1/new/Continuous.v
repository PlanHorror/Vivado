`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/24/2025 09:17:06 AM
// Design Name: 
// Module Name: Continuous
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


module Continuous(
    input [3:0] A, B,
    output bigger, equal, smaller
);
    assign bigger = A > B;
    assign equal = A == B;
    assign smaller = A < B;
endmodule
