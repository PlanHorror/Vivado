`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/24/2025 03:49:39 PM
// Design Name: 
// Module Name: d_ff
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


module d_ff(
output q, qbar,
input d, clk, clear
);
wire s, sbar, r, rbar, cbar;

not (cbar, clear);  

// Input latches
nand (sbar, rbar, s);
nand (s, sbar, cbar, clk);   
nand (r, rbar, clk, s);
nand (rbar, r, cbar, d);

// Output latch
nand (q, s, qbar);
nand (qbar, q, r, cbar);


endmodule
