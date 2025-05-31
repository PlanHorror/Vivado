`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/24/2025 12:14:30 AM
// Design Name: 
// Module Name: MidProcess
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

`include "common.vh"

module MidProcess(
    input [31:0] in_data,           // Single data input for both key and plaintext
    input [`ADDR_WIDTH-1:0] addr,   // Address to determine key (0) or data (1)
    output [31:0] out_data,         // 32-bit output
    input clk,
    input rst,
    input ena_i, wea_i
);

// Address definitions
parameter ADDR_KEY  = `ADDR_WIDTH'h0;    // Address 0: Key input
parameter ADDR_DATA = `ADDR_WIDTH'h1;    // Address 1: Data input

// Signal of buffers 
wire in_data_buffer_full, in_data_buffer_empty;
wire [127:0] in_data_buffer_out, in_key_buffer_out, ciphertext_out;
wire [31:0] output_buffer_out;
wire in_key_buffer_full, in_key_buffer_empty;
wire output_buffer_full, output_buffer_empty;

// Signal of encoding
reg [127:0] plaintext, key;
reg w_ena, out_buffer_ena;
wire encode_ready;

// Buffer enable and control signals
wire data_buffer_ena, key_buffer_ena;
reg data_buffer_consume, key_buffer_consume;  // Signals to consume buffer data

assign data_buffer_ena = (ena_i && wea_i && (addr == ADDR_DATA)) || data_buffer_consume;
assign key_buffer_ena  = (ena_i && wea_i && (addr == ADDR_KEY)) || key_buffer_consume;

// State machine for pipeline control
reg [2:0] state;
parameter IDLE = 3'b000;
parameter BUFFERING = 3'b001;
parameter ENCODING = 3'b010;
parameter OUTPUT = 3'b011;

// Pipeline control signals
reg encoding_busy;
reg output_ready;
reg [3:0] pipeline_count;  // Count data sets in pipeline

// Input data buffer (32-bit to 128-bit) - for plaintext
buffer in_data_buffer(
    .in_data(in_data),
    .ena(data_buffer_ena),      // Enabled when writing to data address OR consuming
    .clk(clk),
    .rst(rst),
    .out_data(in_data_buffer_out),
    .full(in_data_buffer_full),
    .empty(in_data_buffer_empty)
);

// Input key buffer (32-bit to 128-bit) - for key
buffer in_key_buffer(
    .in_data(in_data),
    .ena(key_buffer_ena),       // Enabled when writing to key address OR consuming
    .clk(clk),
    .rst(rst),
    .out_data(in_key_buffer_out),
    .full(in_key_buffer_full),
    .empty(in_key_buffer_empty)
);

// AES Encoding module
Encoding encoding(
    .data_input(plaintext),
    .secret_key(key),
    .rst(rst),
    .clk(clk),
    .w_ena(w_ena),
    .data_output(ciphertext_out),
    .key_output(),
    .ready(encode_ready)
);

// Output buffer (128-bit to 32-bit)
buffer_inv output_buffer(
    .in_data(ciphertext_out),
    .ena(out_buffer_ena),
    .clk(clk),
    .rst(rst),
    .out_data(output_buffer_out),
    .full(output_buffer_full),
    .empty(output_buffer_empty)
);

// Pipeline state machine for continuous operation
always @(posedge clk or negedge rst) begin
    if (!rst) begin
        state <= IDLE;
        w_ena <= 0;
        out_buffer_ena <= 0;
        plaintext <= 0;
        key <= 0;
        encoding_busy <= 0;
        output_ready <= 0;
        pipeline_count <= 0;
        data_buffer_consume <= 0;
        key_buffer_consume <= 0;
    end else begin
        // Reset consume signals by default
        data_buffer_consume <= 0;
        key_buffer_consume <= 0;
        
        case (state)
            IDLE: begin
                encoding_busy <= 0;
                // Start when we have input data
                if (ena_i && wea_i) begin
                    state <= BUFFERING;
                end else begin
                    w_ena <= 0;
                    out_buffer_ena <= 0;
                end
            end
            
            BUFFERING: begin
                // When both buffers are full, start encoding
                if (in_data_buffer_full && in_key_buffer_full) begin
                    state <= ENCODING;
                    plaintext <= in_data_buffer_out;
                    key <= in_key_buffer_out;
                    w_ena <= 1;
                    encoding_busy <= 1;
                    pipeline_count <= pipeline_count + 1;
                    
                    // Consume the buffer data (reset buffers for next data)
                    data_buffer_consume <= 1;
                    key_buffer_consume <= 1;
                end
                // Stay in buffering if we still need more data
                else if (!ena_i || !wea_i) begin
                    // No more input, but buffers not full - wait or go back to IDLE
                    if (!in_data_buffer_full && !in_key_buffer_full) begin
                        state <= IDLE;
                    end
                end
            end
            
            ENCODING: begin
                w_ena <= 0; // Only pulse w_ena for one cycle
                
                // Pipeline can accept new data even while encoding
                if (in_data_buffer_full && in_key_buffer_full && pipeline_count < 4'd10) begin
                    // Send new data to pipeline
                    plaintext <= in_data_buffer_out;
                    key <= in_key_buffer_out;
                    w_ena <= 1;
                    pipeline_count <= pipeline_count + 1;
                    
                    // Consume the buffer data
                    data_buffer_consume <= 1;
                    key_buffer_consume <= 1;
                end
                
                // Wait for encoding to complete
                if (encode_ready) begin
                    state <= OUTPUT;
                    out_buffer_ena <= 1;
                    output_ready <= 1;
                    pipeline_count <= pipeline_count - 1;
                end
            end
            
            OUTPUT: begin
                // Output buffer control based on read enable
                out_buffer_ena <= ena_i && !wea_i ? 1 : 0;
                
                // Pipeline can accept new data during output
                if (in_data_buffer_full && in_key_buffer_full && pipeline_count < 4'd10) begin
                    plaintext <= in_data_buffer_out;
                    key <= in_key_buffer_out;
                    w_ena <= 1;
                    pipeline_count <= pipeline_count + 1;
                    
                    // Consume the buffer data
                    data_buffer_consume <= 1;
                    key_buffer_consume <= 1;
                end
                
                // Check for next ready output
                if (encode_ready && pipeline_count > 0) begin
                    out_buffer_ena <= 1;
                    pipeline_count <= pipeline_count - 1;
                end
                
                // Check if output is complete and determine next state
                if (output_buffer_empty) begin
                    output_ready <= 0;
                    if (pipeline_count > 0 || (in_data_buffer_full && in_key_buffer_full)) begin
                        // Stay in encoding/output mode for pipeline operation
                        state <= ENCODING;
                        encoding_busy <= 1;
                    end else if (ena_i && wea_i) begin
                        // Continue buffering if more data is coming
                        state <= BUFFERING;
                        encoding_busy <= 0;
                    end else begin
                        // No more data, go to idle
                        state <= IDLE;
                        encoding_busy <= 0;
                    end
                end
            end
            
            default: begin
                state <= IDLE;
                w_ena <= 0;
                out_buffer_ena <= 0;
                encoding_busy <= 0;
                output_ready <= 0;
                pipeline_count <= 0;
                data_buffer_consume <= 0;
                key_buffer_consume <= 0;
            end
        endcase
    end
end

// Output assignment
assign out_data = output_buffer_out;

endmodule
