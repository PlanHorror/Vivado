`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/24/2025 08:35:10 AM
// Design Name: 
// Module Name: InvCellProcess
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


module InvCellProcess(
    input [7:0] in_data0, in_data1, in_data2, in_data3,
    input [1:0] col, row,
    output reg [7:0] out_data
);
    wire [7:0] temp0, temp1, temp2, temp3;
    reg [7:0] matrix [3:0][3:0];
    initial begin
        // First row of the matrix
        matrix[0][0] = 8'h0e;
        matrix[0][1] = 8'h0b;
        matrix[0][2] = 8'h0d;
        matrix[0][3] = 8'h09;
        // Second row of the matrix
        matrix[1][0] = 8'h09;
        matrix[1][1] = 8'h0e;
        matrix[1][2] = 8'h0b;
        matrix[1][3] = 8'h0d;
        // Third row of the matrix
        matrix[2][0] = 8'h0d;
        matrix[2][1] = 8'h09;
        matrix[2][2] = 8'h0e;
        matrix[2][3] = 8'h0b;
        // Fourth row of the matrix
        matrix[3][0] = 8'h0b;
        matrix[3][1] = 8'h0d;
        matrix[3][2] = 8'h09;
        matrix[3][3] = 8'h0e;
    end
    Multiplication Multiplication_0(
        .in_data(in_data0),
        .sel(matrix[row][0]),
        .out_data(temp0)
    );
    Multiplication Multiplication_1(
        .in_data(in_data1),
        .sel(matrix[row][1]),
        .out_data(temp1)
    );
    Multiplication Multiplication_2(
        .in_data(in_data2),
        .sel(matrix[row][2]),
        .out_data(temp2)
    );
    Multiplication Multiplication_3(
        .in_data(in_data3),
        .sel(matrix[row][3]),
        .out_data(temp3)
    );
    always @(*) begin
        out_data = temp0^temp1^temp2^temp3;
    end
endmodule
