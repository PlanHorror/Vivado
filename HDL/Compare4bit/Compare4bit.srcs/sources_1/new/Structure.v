`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/24/2025 09:17:06 AM
// Design Name: 
// Module Name: Structure
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


module Structure(
    input [3:0] A, B,
    output bigger, equal, smaller
);
    wire bigger1, equal1, smaller1;
    wire bigger2, equal2, smaller2;
    wire bigger3, equal3, smaller3;
    Structure_1bit Structure_1bit_0(
        .bit1(A[3]),
        .bit2(B[3]),
        .bigger_prev(1'b0),
        .equal_prev(1'b1),
        .smaller_prev(1'b0),
        .bigger(bigger1),
        .equal(equal1),
        .smaller(smaller1)
    );
    Structure_1bit Structure_1bit_1(
        .bit1(A[2]),
        .bit2(B[2]),
        .bigger_prev(bigger1),
        .equal_prev(equal1),
        .smaller_prev(smaller1),
        .bigger(bigger2),
        .equal(equal2),
        .smaller(smaller2)
    );
    Structure_1bit Structure_1bit_2(
        .bit1(A[1]),
        .bit2(B[1]),
        .bigger_prev(bigger2),
        .equal_prev(equal2),
        .smaller_prev(smaller2),
        .bigger(bigger3),
        .equal(equal3),
        .smaller(smaller3)
    );
    Structure_1bit Structure_1bit_3(
        .bit1(A[0]),
        .bit2(B[0]),
        .bigger_prev(bigger3),
        .equal_prev(equal3),
        .smaller_prev(smaller3),
        .bigger(bigger),
        .equal(equal),
        .smaller(smaller)
    );

endmodule
