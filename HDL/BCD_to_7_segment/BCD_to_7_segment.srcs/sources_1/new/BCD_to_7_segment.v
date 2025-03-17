`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/17/2025 12:57:13 PM
// Design Name: 
// Module Name: BCD_to_7_segment
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


module BCD_to_7_segment(
input [3:0] BCD,
output reg [6:0] segment,
output reg a,b,c,d,e,f,g
    );
always @(BCD) begin
    case(BCD)
        4'b0000: segment = 7'b1111110;
        4'b0001: segment = 7'b0110000;
        4'b0010: segment = 7'b1101101;
        4'b0011: segment = 7'b1111001;
        4'b0100: segment = 7'b0110011;
        4'b0101: segment = 7'b1011011;
        4'b0110: segment = 7'b1011111;
        4'b0111: segment = 7'b1110000;
        4'b1000: segment = 7'b1111111;
        4'b1001: segment = 7'b1111011;
        default: segment = 7'bx;
    endcase
    a = segment[6];
    b = segment[5];
    c = segment[4];
    d = segment[3];
    e = segment[2];
    f = segment[1];
    g = segment[0];
end

endmodule
