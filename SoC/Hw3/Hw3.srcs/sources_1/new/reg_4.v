`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/16/2025 01:31:09 PM
// Design Name: 
// Module Name: reg_4
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


module reg_4(
input [3:0] i_data,
input control,
input clk,
output reg [3:0] o_data
    );
wire [3:0] data;
mux2_1_4 dut(i_data,data,control,data);
always @ (posedge clk)
    o_data <= data;
endmodule
