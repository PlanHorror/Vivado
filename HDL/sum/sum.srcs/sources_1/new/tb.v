`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/14/2025 09:46:19 AM
// Design Name: 
// Module Name: tb
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


module tb;
    parameter MEM_DEPTH = 50;
    reg [31:0] mem_array [0:MEM_DEPTH-1];
    reg [31:0] expected_result_array [0:MEM_DEPTH-1];
    reg [31:0] a;
    wire [31:0] result;

    integer i;
    integer error_count;

    sum ddt (
        .a(a),
        .result(result)
    );

    initial begin
        error_count = 0;

        // Read input data (a values)
        $readmemh("data.mem", mem_array);
        
        // Read expected results
        $readmemh("expected_results.mem", expected_result_array);

        for (i = 0; i < MEM_DEPTH; i = i + 1) begin
            a = mem_array[i];
            #10;
            // Compare the actual result with the expected result
            if (result != expected_result_array[i]) begin
                $display("Error: For a = %d, expected %d, but got %d", a, expected_result_array[i], result);
                error_count = error_count + 1;
            end else begin
                $display("Pass: For a = %d, result = %d", a, result);
            end
        end

        // Report final result
        if (error_count == 0) begin
            $display("Test passed successfully!");
        end else begin
            $display("Test failed with %d errors.", error_count);
        end

        $finish;
    end
endmodule


