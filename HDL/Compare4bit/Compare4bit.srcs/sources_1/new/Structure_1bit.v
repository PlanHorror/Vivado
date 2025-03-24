`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/24/2025 09:20:25 AM
// Design Name: 
// Module Name: Structure_1bit
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


module Structure_1bit(
    input bit1, bit2,
    input bigger_prev, equal_prev, smaller_prev,
    output bigger, equal, smaller
);
    assign bigger = bigger_prev | (bit1 & ~bit2);
    assign equal = equal_prev & (bit1 == bit2);
    assign smaller = smaller_prev | (~bit1 & bit2);

endmodule
