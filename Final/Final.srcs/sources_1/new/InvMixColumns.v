`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/24/2025 12:52:08 AM
// Design Name: 
// Module Name: InvMixColumns
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


module InvMixColumns(
    input [127:0] in_data,
    output [127:0] out_data
);
    InvColumnProcess InvColumnProcess_0(
        .in_data0(in_data[127:120]),
        .in_data1(in_data[119:112]),
        .in_data2(in_data[111:104]),
        .in_data3(in_data[103:96]),
        .col(2'b11),
        .out_data0(out_data[127:120]),
        .out_data1(out_data[119:112]),
        .out_data2(out_data[111:104]),
        .out_data3(out_data[103:96])
    );
    InvColumnProcess InvColumnProcess_1(
        .in_data0(in_data[95:88]),
        .in_data1(in_data[87:80]),
        .in_data2(in_data[79:72]),
        .in_data3(in_data[71:64]),
        .col(2'b10),
        .out_data0(out_data[95:88]),
        .out_data1(out_data[87:80]),
        .out_data2(out_data[79:72]),
        .out_data3(out_data[71:64])
    );
    InvColumnProcess InvColumnProcess_2(
        .in_data0(in_data[63:56]),
        .in_data1(in_data[55:48]),
        .in_data2(in_data[47:40]),
        .in_data3(in_data[39:32]),
        .col(2'b01),
        .out_data0(out_data[63:56]),
        .out_data1(out_data[55:48]),
        .out_data2(out_data[47:40]),
        .out_data3(out_data[39:32])
    );
    InvColumnProcess InvColumnProcess_3(
        .in_data0(in_data[31:24]),
        .in_data1(in_data[23:16]),
        .in_data2(in_data[15:8]),
        .in_data3(in_data[7:0]),
        .col(2'b00),
        .out_data0(out_data[31:24]),
        .out_data1(out_data[23:16]),
        .out_data2(out_data[15:8]),
        .out_data3(out_data[7:0])
    );
endmodule
