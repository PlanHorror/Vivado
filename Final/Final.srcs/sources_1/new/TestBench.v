`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/20/2025 05:57:00 PM
// Design Name: 
// Module Name: TestBench
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


module TestBench;
    reg [127:0] in_data;
    wire [127:0] out_data;
    MixColumns MixColumns_0(
    .in_data(in_data),
    .out_data(out_data)
    );

    initial begin
        in_data = 128'hd4e0b81ebfb441275d52119830aef1e5;
    end
    // 
    // ColumnProcess testbench
    //
    // reg [7:0] in_data0, in_data1, in_data2, in_data3;
    // reg [1:0] col;
    // wire [7:0] out_data0, out_data1, out_data2, out_data3;
    // ColumnProcess ColumnProcess_0(
    // .in_data0(in_data0),
    // .in_data1(in_data1),
    // .in_data2(in_data2),
    // .in_data3(in_data3),
    // .col(col),
    // .out_data0(out_data0),
    // .out_data1(out_data1),
    // .out_data2(out_data2),
    // .out_data3(out_data3)
    // );
    // initial begin
    //     in_data0 = 8'hd4;
    //     in_data1 = 8'hbf;
    //     in_data2 = 8'h5d;
    //     in_data3 = 8'h30;
    //     col = 2'b00;
    //     #10;
    //     in_data0 = 8'he0;
    //     in_data1 = 8'hb4;
    //     in_data2 = 8'h52;
    //     in_data3 = 8'hae;
    //     col = 2'b01;
    //     #10;
    //     in_data0=8'hXX;
    //     in_data1=8'hXX;
    //     in_data2=8'hXX;
    //     in_data3=8'hXX;
    //     col = 2'b10;
    //     #20 $finish;
    // end
    // 
    // Multiplication testbench
    // 
    // reg [7:0] in_data;
    // reg [1:0] sel;
    // wire [7:0] out_data;
    // Multiplication Multiplication_0(
    // .in_data(in_data),
    // .sel(sel),
    // .out_data(out_data)
    // );
    // initial begin
    //     // Define the input data for test case 0
    //     in_data = 8'h32;
    //     sel = 2'b01;
    //     #10;
    //     in_data = 8'h19;
    //     sel = 2'b10;
    //     #10;
    //     in_data=8'hd4;
    //     sel = 2'b10;
    //     #10;
    //     in_data=8'hbf;
    //     sel = 2'b11;
    //     #20 $finish;
    // end
    // 
    // SubBytes and ShiftRows testbench
    // 
    // reg [127:0] in_data0, in_data1;
    // wire [127:0] out_data0, out_data1;
    // SubBytes SubBytes_0(
    // .in_data(in_data0),
    // .out_data(out_data0)
    // );
    // ShiftRows ShiftRows_0(
    // .in_data(in_data1),
    // .out_data(out_data1)
    // );
    // initial begin
        // Define the input data for test case 0
        // in_data0 = 128'h32a2f3c4a5f6e7d8b9a8b7c6d5e4f3;
        // in_data1 = out_data0;
        // #10;
        // in_data0 = 128'h19a09ae93df4c6f8e3e28d48be2b2a08;
        // in_data1 = out_data0;
        // #10;
        // in_data0=128'hXX;
        // in_data1 = out_data0;
        // #20 $finish;
    // end
endmodule
