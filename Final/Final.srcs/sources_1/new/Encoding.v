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

    Round round0 (
        .in_data(data[0]),
        .old_key(key[0]),
        .round(0),
        .rst(rst),
        .out_data(data_out[0]),
        .new_key(key_out[0])
    );
    Round round1 (
        .in_data(data[1]),
        .old_key(key[1]),
        .round(1),
        .rst(rst),
        .out_data(data_out[1]),
        .new_key(key_out[1])
    );
    Round round2 (
        .in_data(data[2]),
        .old_key(key[2]),
        .round(2),
        .rst(rst),
        .out_data(data_out[2]),
        .new_key(key_out[2])
    );
    Round round3 (
        .in_data(data[3]),
        .old_key(key[3]),
        .round(3),
        .rst(rst),
        .out_data(data_out[3]),
        .new_key(key_out[3])
    );
    Round round4 (
        .in_data(data[4]),
        .old_key(key[4]),
        .round(4),
        .rst(rst),
        .out_data(data_out[4]),
        .new_key(key_out[4])
    );
    Round round5 (
        .in_data(data[5]),
        .old_key(key[5]),
        .round(5),
        .rst(rst),
        .out_data(data_out[5]),
        .new_key(key_out[5])
    );
    Round round6 (
        .in_data(data[6]),
        .old_key(key[6]),
        .round(6),
        .rst(rst),
        .out_data(data_out[6]),
        .new_key(key_out[6])
    );
    Round round7 (
        .in_data(data[7]),
        .old_key(key[7]),
        .round(7),
        .rst(rst),
        .out_data(data_out[7]),
        .new_key(key_out[7])
    );
    Round round8 (
        .in_data(data[8]),
        .old_key(key[8]),
        .round(8),
        .rst(rst),
        .out_data(data_out[8]),
        .new_key(key_out[8])
    );
    Round round9 (
        .in_data(data[9]),
        .old_key(key[9]),
        .round(9),
        .rst(rst),
        .out_data(data_out[9]),
        .new_key(key_out[9])
    );
    Round round10 (
        .in_data(data[10]),
        .old_key(key[10]),
        .round(10),
        .rst(rst),
        .out_data(data_out[10]),
        .new_key(key_out[10])
    );
endmodule
