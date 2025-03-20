`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/20/2025 03:48:46 PM
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

    reg [127:0] in_data;
    wire [127:0] out_data;
    SubBytes SubBytes_0(
    .in_data(in_data),
    .out_data(out_data)
    );
    initial begin
        // Define the input data for test case 0
        in_data = 128'h32a2f3c4a5f6e7d8b9a8b7c6d5e4f3;
        #10;
        // Define the input data for test case 1
        // in_data[0] = 8'h19; in_data[1] = 8'ha0; in_data[2] = 8'h9a; in_data[3] = 8'he9; in_data[4] = 8'h3d; in_data[5] = 8'hf4; in_data[6] = 8'hc6; in_data[7] = 8'hf8; in_data[8] = 8'he3; in_data[9] = 8'he2; in_data[10] = 8'h8d; in_data[11] = 8'h48; in_data[12] = 8'hbe; in_data[13] = 8'h2b; in_data[14] = 8'h2a; in_data[15] = 8'h08;
        in_data = 128'h19a09ae93d2c6f8e3e28d48be2b2a08;
        #10 $finish;
    end
endmodule
