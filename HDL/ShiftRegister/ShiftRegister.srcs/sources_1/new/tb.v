`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/25/2025 01:12:22 AM
// Design Name: 
// Module Name: tb
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


module tb;
    reg [3:0] I;
    reg clk, Il, Ir;
    reg [1:0] sel;
    wire [3:0] Y;
    // SRwPL_Structural uut (
    //     .I(I),
    //     .clk(clk),
    //     .Il(Il),
    //     .Ir(Ir),
    //     .sel(sel),
    //     .Y(Y)
    // );
    SRwPL_Behavior_Procedural uut (
        .I(I),
        .clk(clk),
        .Il(Il),
        .Ir(Ir),
        .sel(sel),
        .Y(Y)
    );
    always #5 clk = ~clk;
    initial begin
        I = 4'b0000;
        clk = 0;
        sel = 2'b01;
        #10 I = 4'b0001;
        #10 I = 4'b0010;
        #10 I = 4'b0011;
        #10 I = 4'b0100;
        #10 I = 4'b0101;
        #10 I = 4'b0110;
        #10 I = 4'b0111;
        #10 I = 4'b1000;
        #10 I = 4'b1001;
        #10 I = 4'b1010;
        #10 I = 4'b1011;
        #10 I = 4'b1100;
        #10 I = 4'b1101;
        #10 I = 4'b1110;
        #10 I = 4'b1111;
        #10 sel = 2'b01;
        #10 I = 4'b0000;
        #10 I = 4'b0001;
        #10 I = 4'b0010;
        #10 Ir = 1;
        #10 sel = 2'b10;
        #40 Il = 0;
        sel = 2'b11;
        #40
        $finish;
    end
// reg clk, rst, d;
// wire q, qbar;
// d_ff uut (
//     .q(q),
//     .qbar(qbar),
//     .d(d),
//     .clk(clk),
//     .clear(rst)
// );
// always #5 clk = ~clk;
// initial begin
//     clk = 0;
//     rst = 0;
//     d = 0;
//     #10 rst = 1;
//     #10 d = 1;
//     #10 d = 0;
//     #10 rst = 0;
//     #10 d = 1;
//     #10 d = 0;
//     $finish;
// end
endmodule
