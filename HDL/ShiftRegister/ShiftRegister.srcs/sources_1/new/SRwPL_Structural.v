`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/25/2025 01:19:20 AM
// Design Name: 
// Module Name: SRwPL_Structural
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


module SRwPL_Structural(
input [3:0] I,
input clk, Il, Ir,
input [1:0] sel,
output [3:0] Y
);
    wire m_3, m_2, m_1, m_0;
    mux4_1 m3(
        .sel(sel),
        .a3(Il),
        .a2(Y[2]),
        .a1(I[3]),
        .a0(Y[3]),
        .o(m_3)
    );
    mux4_1 m2(
        .sel(sel),
        .a3(Y[3]),
        .a2(Y[1]),
        .a1(I[2]),
        .a0(Y[2]),
        .o(m_2)
    );
    mux4_1 m1(
        .sel(sel),
        .a3(Y[2]),
        .a2(Y[0]),
        .a1(I[1]),
        .a0(Y[1]),
        .o(m_1)
    );
    mux4_1 m0(
        .sel(sel),
        .a3(Y[1]),
        .a2(Ir),
        .a1(I[0]),
        .a0(Y[0]),
        .o(m_0)
    );
    d_ff d3(
        .q(Y[3]),
        .qbar(),
        .d(m_3),
        .clk(clk),
        .clear(1'b0)
    );
    d_ff d2(
        .q(Y[2]),
        .qbar(),
        .d(m_2),
        .clk(clk),
        .clear(1'b0)
    );
    d_ff d1(
        .q(Y[1]),
        .qbar(),
        .d(m_1),
        .clk(clk),
        .clear(1'b0)
    );
    d_ff d0(
        .q(Y[0]),
        .qbar(),
        .d(m_0),
        .clk(clk),
        .clear(1'b0)
    );
endmodule
