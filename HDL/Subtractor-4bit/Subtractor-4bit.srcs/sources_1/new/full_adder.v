`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/03/2025 08:38:59 AM
// Design Name: 
// Module Name: full_adder
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


module full_adder(
    input a, b, cin,
    output sum, cout
    );
    // assign sum = a ^ b ^ cin;
    // Primitive instantiation
    // xor x0(.a(a), .b(b), .y(sum));
    // xor x1(.a(sum), .b(cin), .y(cout));
    // assign cout = (a & b) | (b & cin) | (a & cin);
    // and a0(.a(a), .b(b), .y(cout0));
    // and a1(.a(b), .b(cin), .y(cout1));
    // and a2(.a(a), .b(cin), .y(cout2));
    // or o0(.a(cout0), .b(cout1), .y(cout3));
    // or o1(.a(cout3), .b(cout2), .y(cout));
    
    // assign cout = (a & b) | (b & cin) | (a & cin);
    // I/O port declarations

    // Internal nets
    wire s1, c1, c2;
    // Instantiate logic gate primitives
    xor (s1, a, b);
    and (c1, a, b);
    xor (sum, s1, cin);
    and (c2, s1, cin);
    xor (cout, c2, c1);
endmodule
