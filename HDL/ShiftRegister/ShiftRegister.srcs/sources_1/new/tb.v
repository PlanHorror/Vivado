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
        // Initialize inputs
        Ir = 0;
        Il = 0;
        I = 4'b1010;
        clk = 0;
        sel = 2'b00;

        // Apply test cases
        #10 sel = 2'b01; I = 4'b1100; // Test shift left
        #10 sel = 2'b10; Ir = 1;      // Test shift right with Ir=1
        #10 sel = 2'b11; Il = 1;      // Test parallel load with Il=1
        #10 sel = 2'b00;              // Test hold state
        #10 I = 4'b0011;              // Change input while holding
        #10 sel = 2'b01;              // Shift left again
        #10 sel = 2'b10; Ir = 0;      // Shift right with Ir=0
        #10 sel = 2'b11; Il = 0;      // Parallel load with Il=0

        // End simulation
        #50 $finish;
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
