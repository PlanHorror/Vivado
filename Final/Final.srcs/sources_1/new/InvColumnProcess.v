`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/24/2025 08:35:10 AM
// Design Name: 
// Module Name: InvColumnProcess
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


module InvColumnProcess(
    input [7:0] in_data0, in_data1, in_data2, in_data3,
    input [1:0] col,
    output reg [7:0] out_data0, out_data1, out_data2, out_data3
);
    InvCellProcess InvCellProcess_0(
        .in_data0(in_data0),
        .in_data1(in_data1),
        .in_data2(in_data2),
        .in_data3(in_data3),
        .col(col),
        .row(0),
        .out_data(out_data0)
    );
    InvCellProcess InvCellProcess_1(
        .in_data0(in_data0),
        .in_data1(in_data1),
        .in_data2(in_data2),
        .in_data3(in_data3),
        .col(col),
        .row(1),
        .out_data(out_data1)
    );
    InvCellProcess InvCellProcess_2(
        .in_data0(in_data0),
        .in_data1(in_data1),
        .in_data2(in_data2),
        .in_data3(in_data3),
        .col(col),
        .row(2),
        .out_data(out_data2)
    );
    InvCellProcess InvCellProcess_3(
        .in_data0(in_data0),
        .in_data1(in_data1),
        .in_data2(in_data2),
        .in_data3(in_data3),
        .col(col),
        .row(3),
        .out_data(out_data3)
    );
endmodule
