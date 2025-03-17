`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/17/2025 08:39:46 AM
// Design Name: 
// Module Name: adder_delay
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

module adder_delay(
input ain,bin,carryin,
output carryout,sum
    );
assign #(3,5) sum = ain ^ bin ^ carryin;
assign #(4,8) carryout = (ain&bin)|(bin&carryin)|(ain&carryin);
endmodule
