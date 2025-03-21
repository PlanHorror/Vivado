`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/21/2025 05:08:42 PM
// Design Name: 
// Module Name: CellProcess
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


module ColumnProcess(
    input [7:0] in_data0, in_data1, in_data2, in_data3,
    input [1:0] col,
    output reg [7:0] out_data0, out_data1, out_data2, out_data3
);
    wire [7:0] temp0, temp1, temp2, temp3;
    CellProcess CellProcess_0(
        .in_data0(in_data0),
        .in_data1(in_data1),
        .in_data2(in_data2),
        .in_data3(in_data3),
        .col(col),
        .row(0),
        .out_data(temp0)
    );
    CellProcess CellProcess_1(
        .in_data0(in_data0),
        .in_data1(in_data1),
        .in_data2(in_data2),
        .in_data3(in_data3),
        .col(col),
        .row(1),
        .out_data(temp1)
    );
    CellProcess CellProcess_2(
        .in_data0(in_data0),
        .in_data1(in_data1),
        .in_data2(in_data2),
        .in_data3(in_data3),
        .col(col),
        .row(2),
        .out_data(temp2)
    );
    CellProcess CellProcess_3(
        .in_data0(in_data0),
        .in_data1(in_data1),
        .in_data2(in_data2),
        .in_data3(in_data3),
        .col(col),
        .row(3),
        .out_data(temp3)
    );
    always @(*) begin
        out_data0 = temp0;
        out_data1 = temp1;
        out_data2 = temp2;
        out_data3 = temp3;
    end

endmodule
