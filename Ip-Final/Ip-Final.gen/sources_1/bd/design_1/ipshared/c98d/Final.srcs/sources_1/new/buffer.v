`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/23/2025 10:25:39 PM
// Design Name: 
// Module Name: buffer
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


module buffer(
    input [31:0] in_data,
    input ena,
    input clk,
    input rst,
    output reg [127:0] out_data,
    output reg full,
    output reg empty
    );
reg [127:0] buffer_data;
parameter EMPTY = 0;
parameter BUFFERDATA1 = 1;
parameter BUFFERDATA2 = 2;
parameter BUFFERDATA3 = 3;
parameter FULL = 4;
reg [2:0] state;

always @(posedge clk or negedge rst) begin
    if (!rst) begin
        state <= EMPTY;
        out_data <= 0;
        full <= 0;
        empty <= 1;
        buffer_data <= 0;
    end else begin
        if (ena) begin  // Only change state when enabled
            case (state)
                EMPTY: begin
                    buffer_data[31:0] <= in_data;  // Store first 32 bits
                    state <= BUFFERDATA1;
                    empty <= 0;  // No longer empty after receiving data
                    full <= 0;
                end
                BUFFERDATA1: begin
                    buffer_data[63:32] <= in_data;  // Store second 32 bits
                    state <= BUFFERDATA2;
                    empty <= 0;
                    full <= 0;
                end
                BUFFERDATA2: begin
                    buffer_data[95:64] <= in_data;  // Store third 32 bits
                    state <= BUFFERDATA3;
                    empty <= 0;
                    full <= 0;
                end
                BUFFERDATA3: begin
                    buffer_data[127:96] <= in_data;  // Store fourth 32 bits
                    state <= FULL;
                    empty <= 0;
                    full <= 1;  // Set full immediately when we receive 4th data
                    out_data <= {in_data, buffer_data[95:0]};  // Output complete data immediately
                end
                FULL: begin
                    // Special handling for FULL state - reset to EMPTY when ena is high
                    // This allows the buffer to be consumed and ready for new data
                    state <= EMPTY;
                    full <= 0;
                    empty <= 1;
                    buffer_data <= 0;
                    out_data <= 0;
                end
                default: begin
                    state <= EMPTY;
                    out_data <= 0;
                    full <= 0;
                    empty <= 1;
                    buffer_data <= 0;
                end
            endcase
        end
        // When ena is not active, hold the current state - no changes
    end
end

endmodule
