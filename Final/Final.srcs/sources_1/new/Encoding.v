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
    output reg [127:0] data_output
);
    reg [127:0] data [11:0];
    reg [127:0] key [11:0];
    wire [127:0] data_out[10:0];
    wire [127:0] key_out[10:0];
    integer i;
    always @(posedge clk) // Change to always @(*) if dont want to use clock
    begin
        if(rst)
        begin
            for(i=0;i<11;i=i+1)
            begin
                data[i] <= 128'h0;
                key[i] <= 128'h0;
            end
        end
        else
        begin
            for(i=0;i<11;i=i+1)
            begin
                data[i+1] <= data_out[i];
                key[i+1] <= key_out[i];
            end
            data[0] <= data_input;
            key[0] <= secret_key;
        end
        data_output <= data_out[10];
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
