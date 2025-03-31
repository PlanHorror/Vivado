`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/31/2025 08:27:59 AM
// Design Name: 
// Module Name: Moore
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


module Moore(
    input wire clk,
    input wire rst,
    input wire inData,
    output wire found
);
    // Detect the sequence 1101
    // State encoding
    parameter reset = 3'b000;
    parameter got1 = 3'b001;
    parameter got11 = 3'b010;
    parameter got110 = 3'b011;
    parameter got1101 = 3'b100;
    reg [2:0] state, next_state;
    // State transition
    always @(posedge clk)
    begin
        if (rst)
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
                    next_state = got1101;
                else
                    next_state = reset;
            end
            got1101: begin
                if (inData)
                    next_state = got11;
                else
                    next_state = reset;
            end
            default: next_state = reset;
        endcase
    end
    // Output logic
    assign found = (state == got1101) ? 1 : 0;
endmodule
