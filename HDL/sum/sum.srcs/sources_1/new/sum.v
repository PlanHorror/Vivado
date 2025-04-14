`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/14/2025 09:46:19 AM
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
//////////////////////////////////////////////////////  ////////////////////////////


module sum(
    input wire [31:0] a,
    output reg [31:0] result
);
    integer i;

    // Define the task
    task calculate_sum;
        input [31:0] x;
        output [31:0] sum_out;
        integer j;
        begin
            sum_out = 0;
            for (j = 0; j <= x; j = j + 1) begin
                sum_out = sum_out + j;
            end
        end
    endtask

    // Call the task in always block
    always @(*) begin
        calculate_sum(a, result);
    end
endmodule

