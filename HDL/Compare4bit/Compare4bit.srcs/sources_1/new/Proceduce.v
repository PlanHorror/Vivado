`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/24/2025 09:17:06 AM
// Design Name: 
// Module Name: Proceduce
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


module Proceduce(
    input [3:0] A, B,
    output reg bigger, equal, smaller
);
    always @(A,B) begin
        bigger =  A > B;
        equal = A == B;
        smaller = A < B;
    end
endmodule
