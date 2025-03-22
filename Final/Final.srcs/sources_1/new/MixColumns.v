`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/20/2025 06:44:00 PM
// Design Name: 
// Module Name: MixColumns
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


module MixColumns(
    input [127:0] in_data,
    output reg [127:0] out_data
);
    wire [7:0] temp [15:0];
    ColumnProcess ColumnProcess_0(
        .in_data0(in_data[127:120]),
        .in_data1(in_data[119:112]),
        .in_data2(in_data[111:104]),
        .in_data3(in_data[103:96]),
        .col(0),
        .out_data0(temp[0]),
        .out_data1(temp[1]),
        .out_data2(temp[2]),
        .out_data3(temp[3])
    );
    ColumnProcess ColumnProcess_1(
        .in_data0(in_data[95:88]),
        .in_data1(in_data[87:80]),
        .in_data2(in_data[79:72]),
        .in_data3(in_data[71:64]),
        .col(1),
        .out_data0(temp[4]),
        .out_data1(temp[5]),
        .out_data2(temp[6]),
        .out_data3(temp[7])
    );
    ColumnProcess ColumnProcess_2(
        .in_data0(in_data[63:56]),
        .in_data1(in_data[55:48]),
        .in_data2(in_data[47:40]),
        .in_data3(in_data[39:32]),
        .col(2),
        .out_data0(temp[8]),
        .out_data1(temp[9]),
        .out_data2(temp[10]),
        .out_data3(temp[11])
    );
    ColumnProcess ColumnProcess_3(
        .in_data0(in_data[31:24]),
        .in_data1(in_data[23:16]),
        .in_data2(in_data[15:8]),
        .in_data3(in_data[7:0]),
        .col(3),
        .out_data0(temp[12]),
        .out_data1(temp[13]),
        .out_data2(temp[14]),
        .out_data3(temp[15])
    );
    always @(*) begin
        out_data[127:120] = temp[0];
        out_data[119:112] = temp[1];
        out_data[111:104] = temp[2];
        out_data[103:96] = temp[3];
        out_data[95:88] = temp[4];
        out_data[87:80] = temp[5];
        out_data[79:72] = temp[6];
        out_data[71:64] = temp[7];
        out_data[63:56] = temp[8];
        out_data[55:48] = temp[9];
        out_data[47:40] = temp[10];
        out_data[39:32] = temp[11];
        out_data[31:24] = temp[12];
        out_data[23:16] = temp[13];
        out_data[15:8] = temp[14];
        out_data[7:0] = temp[15];
    end
endmodule
