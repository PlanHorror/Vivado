`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/20/2025 11:10:46 AM
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
    output reg [127:0] out_data
    );
    wire end_process;
    wire [127:0] data;
    genvar i;
    assign end_process = 0;
    for(i=0;i<16;i=i+1)
    begin
        s_box s_box_0(in_data[i*8+7:i*8],data[i*8+7:i*8]);
        if (i==15)
        begin
            assign end_process = 1;
        end
    end
    // assign end_process = 1;
    always @(end_process)
    begin
        if(end_process)
        out_data = data;
    end
    
    
    

endmodule
