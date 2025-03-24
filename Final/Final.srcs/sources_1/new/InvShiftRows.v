`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/24/2025 12:52:08 AM
// Design Name: 
// Module Name: InvShiftRows
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


module InvShiftRows(
    input [127:0] in_data,
    output [127:0] out_data
);
    assign out_data[127:120] = in_data[127:120];
    assign out_data[119:112] = in_data[23:16];
    assign out_data[111:104] = in_data[47:40];
    assign out_data[103:96] = in_data[71:64];
    assign out_data[95:88] = in_data[95:88];
    assign out_data[87:80] = in_data[119:112];
    assign out_data[79:72] = in_data[15:8];
    assign out_data[71:64] = in_data[39:32];
    assign out_data[63:56] = in_data[63:56];
    assign out_data[55:48] = in_data[87:80];
    assign out_data[47:40] = in_data[111:104];
    assign out_data[39:32] = in_data[7:0];
    assign out_data[31:24] = in_data[31:24];
    assign out_data[23:16] = in_data[55:48];
    assign out_data[15:8] = in_data[79:72];
    assign out_data[7:0] = in_data[103:96];
endmodule
