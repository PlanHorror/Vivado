`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/17/2025 01:22:24 AM
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
reg [3:0] a,b;
wire [7:0] x;
multiple_4 uut(
.a(a),
.b(b),
.x(x)
);
initial begin
a = 4'b0100;
b = 4'b0010;
#10;
a = 4'b1111;
b = 4'b0001;
#10;
a = 4'b1111;
b = 4'b1111;
#10
a = 4'b0000;
b = 4'b0000;
end
endmodule
