`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/24/2025 09:22:51 AM
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
reg [3:0] A, B;
wire A_greater, A_equal, A_less;
// Structure Structure_0(
//     .A(A),
//     .B(B),
//     .bigger(bigger),
//     .equal(equal),
//     .smaller(smaller)
// );
// Proceduce Proceduce_0(
//     .A(A),
//     .B(B),
//     .bigger(bigger),
//     .equal(equal),
//     .smaller(smaller)
// );
Continuous Continuous_0(
    .A(A),
    .B(B),
    .bigger(A_greater),
    .equal(A_equal),
    .smaller(A_less)
);
initial begin
    repeat (12) begin
        A = $random % 16;
        B = $random % 16;
        #10;
    end
    $finish;
end
// reg bit1, bit2;
// wire bigger, equal, smaller;
// Structure_1bit Structure_1bit_0(
//     .bit1(bit1),
//     .bit2(bit2),
//     .bigger(bigger),
//     .equal(equal),
//     .smaller(smaller)
// );
// initial begin
//     bit1 = 1'b0;
//     bit2 = 1'b0;
//     #10
//     bit1 = 1'b0;
//     bit2 = 1'b1;
//     #10
//     bit1 = 1'b1;
//     bit2 = 1'b0;
//     #10
//     bit1 = 1'b1;
//     bit2 = 1'b1;
//     #10
//     $finish;
// end
endmodule
