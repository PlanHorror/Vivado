`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/21/2025 03:21:29 AM
// Design Name: 
// Module Name: MatrixMultiplication
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


module Multiplication(
    input [7:0] in_data,
    input [7:0] sel,
    output reg [7:0] out_data
);
    reg [7:0] temp_multiplication2, temp_multiplication4;
    always @(*) begin
        if(sel==8'h01)
        begin
            out_data = in_data;
        end
        else if(sel==8'h02)
        begin
            out_data = in_data << 1;
            if(in_data[7]==1)
            begin
                out_data = out_data^8'h1b;
            end
        end
        else if(sel==8'h03)
        begin
            out_data = in_data << 1;
            if(in_data[7]==1)
            begin
                out_data = out_data^8'h1b;
            end
            out_data = out_data^in_data;
        end
        else if (sel==8'h09)
        begin
            temp_multiplication2 = in_data << 1;
            if(in_data[7]==1)
            begin
                out_data = out_data^8'h1b;
            end
            temp_multiplication4 = temp_multiplication2 << 1;
            if(temp_multiplication2[7]==1)
            begin
                temp_multiplication4 = temp_multiplication4^8'h1b;
            end
            out_data = temp_multiplication4 << 1;
            if(temp_multiplication4[7]==1)
            begin
                out_data = out_data^8'h1b;
            end
            out_data = out_data^in_data;
        end
        else if (sel==8'h0b)
        begin
            temp_multiplication2 = in_data << 1;
            if(in_data[7]==1)
            begin
                out_data = out_data^8'h1b;
            end
            temp_multiplication4 = temp_multiplication2 << 1;
            if(temp_multiplication2[7]==1)
            begin
                temp_multiplication4 = temp_multiplication4^8'h1b;
            end
            out_data = temp_multiplication4 << 1;
            if(temp_multiplication4[7]==1)
            begin
                out_data = out_data^8'h1b;
            end
            out_data = out_data^temp_multiplication2^in_data;
        end
        else if (sel==8'h0d)
        begin
            temp_multiplication2 = in_data << 1;
            if(in_data[7]==1)
            begin
                out_data = out_data^8'h1b;
            end
            temp_multiplication4 = temp_multiplication2 << 1;
            if(temp_multiplication2[7]==1)
            begin
                temp_multiplication4 = temp_multiplication4^8'h1b;
            end
            out_data = temp_multiplication4 << 1;
            if(temp_multiplication4[7]==1)
            begin
                out_data = out_data^8'h1b;
            end
            out_data = out_data^temp_multiplication4^in_data;
        end
        else if (sel==8'h0e)
        begin
            temp_multiplication2 = in_data << 1;
            if(in_data[7]==1)
            begin
                out_data = out_data^8'h1b;
            end
            temp_multiplication4 = temp_multiplication2 << 1;
            if(temp_multiplication2[7]==1)
            begin
                temp_multiplication4 = temp_multiplication4^8'h1b;
            end
            out_data = temp_multiplication4 << 1;
            if(temp_multiplication4[7]==1)
            begin
                out_data = out_data^8'h1b;
            end
            out_data = out_data^temp_multiplication4^temp_multiplication2;
        end
    end
endmodule
