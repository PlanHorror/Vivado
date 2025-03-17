`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/17/2025 09:19:04 AM
// Design Name: 
// Module Name: mux_8_1
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


module mux_8_1(
input [7:0] a7,a6,a5,a4,a3,a2,a1,a0,
input [2:0] sel,
output reg [7:0] x
    );
always @(a7 or a6 or a5 or a4 or a3 or a2 or a1 or a0 or sel) begin
    x = (sel == 3'b000) ? a0 :
        (sel == 3'b001) ? a1 :
        (sel == 3'b010) ? a2 :
        (sel == 3'b011) ? a3 :
        (sel == 3'b100) ? a4 :
        (sel == 3'b101) ? a5 :
        (sel == 3'b110) ? a6 :
        (sel == 3'b111) ? a7 : 8'b0;
end

endmodule
