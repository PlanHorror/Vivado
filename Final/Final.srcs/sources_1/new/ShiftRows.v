`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/20/2025 06:44:00 PM
// Design Name: 
// Module Name: ShiftRows
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


module ShiftRows(
    input [127:0] in_data,
    output reg [127:0] out_data
);
    always @(*) begin
        out_data[127:96] = in_data[127:96];
        out_data[95:64] = {in_data[87:64],in_data[95:88]};
        out_data[63:32] = {in_data[47:32],in_data[63:48]};
        out_data[31:0] = {in_data[7:0],in_data[31:8]};
    end
endmodule
