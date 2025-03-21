`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/22/2025 03:10:00 AM
// Design Name: 
// Module Name: Round
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


module Round(
    input [127:0] in_data, old_key,
    input [3:0] round,
    input rst,clk,
    output reg [127:0] out_data, new_key
);
    wire [127:0] add_key_out, shift_rows_out, mix_columns_out, sub_bytes_out, key_temp;
    reg [127:0] temp;
    KeyExpansion KeyExpansion_0(
        .old_key(old_key),
        .round(round),
        .new_key(key_temp)
    );
    SubBytes SubBytes_0(
        .in_data(in_data),
        .out_data(sub_bytes_out)
    );
    ShiftRows ShiftRows_0(
        .in_data(sub_bytes_out),
        .out_data(shift_rows_out)
    );
    MixColumns MixColumns_0(
        .in_data(shift_rows_out),
        .out_data(mix_columns_out)
    );
    AddRoundKey AddRoundKey_0(
        .in_data(temp),
        .key(new_key),
        .out_data(add_key_out)
    );
    always @(posedge clk, negedge rst) begin
        if(!rst) begin
            out_data = 128'h0;
        end
        else 
        begin
            out_data = add_key_out;
        end
    end
    always @(key_temp) begin
        new_key = key_temp;
    end
    always @(round) begin
        if(round==0)
        begin
            temp = in_data;
        end
        else
        if(round==10)
        begin
            temp = shift_rows_out;
        end
        else
        begin
            temp = mix_columns_out;
        end
    end
endmodule
