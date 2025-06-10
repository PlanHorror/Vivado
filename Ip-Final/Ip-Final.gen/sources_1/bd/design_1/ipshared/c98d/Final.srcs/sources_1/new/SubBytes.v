`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/20/2025 05:57:00 PM
// Design Name: 
// Module Name: SubBytes
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


module SubBytes(    
    input [127:0] in_data,
    output [127:0] out_data
);
    wire [127:0] data;
    genvar i;
    generate
        for(i=0;i<16;i=i+1)
        begin
            SBox s_box_0(in_data[i*8+7:i*8],out_data[i*8+7:i*8]);
        end
    endgenerate
endmodule
