`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/20/2025 06:44:00 PM
// Design Name: 
// Module Name: AddRoundKey
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


module AddRoundKey(
    input [127:0] in_data, key,
    output reg [127:0] out_data
);
    always @(*) begin
        out_data = in_data ^ key;
    end
endmodule
