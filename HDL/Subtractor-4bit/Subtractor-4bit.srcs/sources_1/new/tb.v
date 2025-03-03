`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/03/2025 08:45:14 AM
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
    reg [3:0] a, b;
    wire [3:0] diff;
    wire c_out;
    subtractor subtractor0(.a(a), .b(b), .diff(diff), .c_out(c_out));
    initial begin
        $monitor($time, " a=%b b=%b diff=%b c_out=%b", a, b, diff, c_out);
        a = 4'b0000;
        b = 4'b0000;
        #10;
        a = 4'b0000;
        b = 4'b0001;
        #10;
        a = 4'b0001;
        b = 4'b0000;
        #10;
        a = 4'b0001;
        b = 4'b0001;
        #10;
        $finish;
    end


    
endmodule
