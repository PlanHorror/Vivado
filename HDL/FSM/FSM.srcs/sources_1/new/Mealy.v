`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/31/2025 08:28:13 AM
// Design Name: 
// Module Name: Mealy
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


module Mealy(
    input wire clk,
    input wire rst,
    input wire inData,
    output wire found
);
parameter reset = 2'b00;
parameter got1 = 2'b01;
parameter got11 = 2'b10;
parameter got110 = 2'b11;
reg [1:0] state, next_state;
// State transition
always @(posedge clk)
begin
    if (rst==1)
        state <= reset;
    else
        state <= next_state;
end
// Next state logic
always @(state, inData)
begin
    case (state)
        reset: begin
            if (inData)
                next_state = got1;
            else
                next_state = reset;
        end
        got1: begin
            if (inData)
                next_state = got11;
            else
                next_state = reset;
        end
        got11: begin
            if (~inData)
                next_state = got110;
            else
                next_state = got11;
        end
        got110: begin
            if (inData)
                next_state = got1;
            else
                next_state = reset;
        end
        default: begin
            next_state = reset;
        end
    endcase
end
// Output logic
assign found = (state == got110 && inData) ? 1 : 0;

endmodule
