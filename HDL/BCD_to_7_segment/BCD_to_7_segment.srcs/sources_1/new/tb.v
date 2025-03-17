`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/17/2025 01:48:37 PM
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
reg [3:0] BCD;
wire [6:0] segment;
wire a,b,c,d,e,f,g;
BCD_to_7_segment dut(.BCD(BCD),.segment(segment),.a(a),.b(b),.c(c),.d(d),.e(e),.f(f),.g(g));
initial begin
    $dumpfile("tb.vcd");
    $dumpvars(0,tb);
    BCD = 4'b0000;
    #10 BCD = 4'b0001;
    #10 BCD = 4'b0010;
    #10 BCD = 4'b0011;
    #10 BCD = 4'b0100;
    #10 BCD = 4'b0101;
    #10 BCD = 4'b0110;
    #10 BCD = 4'b0111;
    #10 BCD = 4'b1000;
    #10 BCD = 4'b1001;
    #10 BCD = 4'b1010;
    #10 BCD = 4'b1011;
    #10 BCD = 4'b1100;
    #10 BCD = 4'b1101;
    #10 BCD = 4'b1110;
    #10 BCD = 4'b1111;
    #10 $finish;
end
endmodule
