`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/22/2025 03:10:00 AM
// Design Name: 
// Module Name: TopModule
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


module Encoding(
    input [127:0] data_input, secret_key,
    input rst,clk,
    output reg [127:0] data_output,
    output reg [127:0] key_output
);
    reg [127:0] data [10:0];
    reg [127:0] key [10:0];
    wire [127:0] data_out[10:0];
    wire [127:0] key_out[10:0];
    integer i;
    always @(posedge clk) // Change to always @(*) if dont want to use clock
    begin
        if(rst)
        begin
            data[0] <= 128'h0;
            data[1] <= 128'h0;
            data[2] <= 128'h0;
            data[3] <= 128'h0;
            data[4] <= 128'h0;
            data[5] <= 128'h0;
            data[6] <= 128'h0;
            data[7] <= 128'h0;
            data[8] <= 128'h0;
            data[9] <= 128'h0;
            data[10] <= 128'h0;
            data[11] <= 128'h0;
            key[0] <= 128'h0;
            key[1] <= 128'h0;
            key[2] <= 128'h0;
            key[3] <= 128'h0;
            key[4] <= 128'h0;
            key[5] <= 128'h0;
            key[6] <= 128'h0;
            key[7] <= 128'h0;
            key[8] <= 128'h0;
            key[9] <= 128'h0;
            key[10] <= 128'h0;
            key[11] <= 128'h0;
        end
        else
        begin
            data[0] <= data_input;
            data[1] <= data_out[0];
            data[2] <= data_out[1];
            data[3] <= data_out[2];
            data[4] <= data_out[3];
            data[5] <= data_out[4];
            data[6] <= data_out[5];
            data[7] <= data_out[6];
            data[8] <= data_out[7];
            data[9] <= data_out[8];
            data[10] <= data_out[9];
            key[0] <= secret_key;
            key[1] <= key_out[0];
            key[2] <= key_out[1];
            key[3] <= key_out[2];
            key[4] <= key_out[3];
            key[5] <= key_out[4];
            key[6] <= key_out[5];
            key[7] <= key_out[6];
            key[8] <= key_out[7];
            key[9] <= key_out[8];
            key[10] <= key_out[9];
        end
        data_output <= data_out[10];
        key_output <= key_out[10];
    end

    genvar j;
    generate
        for(j=0;j<11;j=j+1)
        begin
            Round Round_0(
                .in_data(data[j]),
                .old_key(key[j]),
                .round(j),
                .rst(rst),
                .out_data(data_out[j]),
                .new_key(key_out[j])
            );
        end
    endgenerate
endmodule
