`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/24/2025 12:42:16 AM
// Design Name: 
// Module Name: buffer_inv
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


module buffer_inv(
  input [127:0] in_data,
  input ena,
  input clk,
  input rst,
  output reg [31:0] out_data,
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
    end 
    else begin
        case (state)
            EMPTY: begin
              buffer_data <= in_data;
                if (ena) begin
                    
                    state <= FULL;
                    empty <= 1;
                    full <= 0;
                end
            end
            FULL: begin
                if (ena) begin
                    out_data <= buffer_data[127:96];
                    buffer_data <= {buffer_data[95:0], in_data};
                    state <= BUFFERDATA1;
                    empty <= 0;
                    full <= 1;
                end
            end
            BUFFERDATA1: begin
                if (ena) begin
                    out_data <= buffer_data[95:64];
                    buffer_data <= {buffer_data[63:0], in_data};
                    state <= BUFFERDATA2;
                    full <= 0;
                end
            end
            BUFFERDATA2: begin
                if (ena) begin
                    out_data <= buffer_data[63:32];
                    buffer_data <= {buffer_data[31:0], in_data};
                    state <= BUFFERDATA3;
                end
            end
            BUFFERDATA3: begin
                if (ena) begin
                    out_data <= buffer_data[31:0];
                    state <= EMPTY;
                    
                end
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
end
endmodule
