`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/05/2025 05:31:21 PM
// Design Name: 
// Module Name: tb
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


module tb;
reg a0,a1,a2,a3,a4,a5,a6,a7;
reg [0:2]s;
wire f;
mux8_1 mux(a0,a1,a2,a3,a4,a5,a6,a7,s,f);
initial begin
  s = 3'b000;
  a0 = 1'b1;
  a1 = 1'b0;
  a2 = 1'b0;
  a3 = 1'b0;
  a4 = 1'b0;
  a5 = 1'b0;
  a6 = 1'b0;
  a7 = 1'b0;
  #10;
  a0 = 1'b1;
  a1 = 1'b1;
  a3 = 1'b1;
  a7 = 1'b1;
  #10
  a0 = 1'b0;
  a2 = 1'b1;
  a4 = 1'b1;
  a6 = 1'b1;
  #10
  s = 3'b010;
  a5 = 1'b1;
  a0 = 1'b1;
  a2 = 1'b0;
  #10
  s = 3'b100;
  #10
  a0 = 1'b0;
  a1 = 1'b0;
  a2 = 1'b0;
  a3 = 1'b0;
  a5 = 1'b0;
  a6 = 1'b0;
  a7 = 1'b0;
  #10
  s = 3'b111;
  a7 = 1'b1;
  #10
  a4 = 1'b0;
  $finish;

end
endmodule
