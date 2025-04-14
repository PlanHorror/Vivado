`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/14/2025 04:03:52 PM
// Design Name: 
// Module Name: sum
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


module sum(
    input wire [`DATA_WIDTH-1:0] n,
    output reg [`DATA_WIDTH-1:0] sum
);

always @(n) begin
    sum = n * (n + 1) / 2;
end
endmodule
