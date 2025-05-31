`timescale 1ns / 1ps

module ShiftRow_tb;

    // Inputs
    reg [31:0] S0_in;
    reg [31:0] S1_in;
    reg [31:0] S2_in;
    reg [31:0] S3_in;

    // Outputs
    wire [31:0] D0_out;
    wire [31:0] D1_out;
    wire [31:0] D2_out;
    wire [31:0] D3_out;

    // Instantiate the Unit Under Test (UUT)
    ShiftRow uut (
        .S0_in(S0_in),
        .S1_in(S1_in),
        .S2_in(S2_in),
        .S3_in(S3_in),
        .D0_out(D0_out),
        .D1_out(D1_out),
        .D2_out(D2_out),
        .D3_out(D3_out)
    );

    initial begin
        $display("===== Testing ShiftRow Module =====");

        // Test case: Nh?p c?c gi? tr? r? r?ng ?? d? quan s?t
        // D? li?u ??u v?o ban ??u (theo column-major)
        // Gi? s? matrix tr??c ShiftRows:
        // [00 01 02 03]
        // [10 11 12 13]
        // [20 21 22 23]
        // [30 31 32 33]
        // => m? h?a theo column-major:
        // Col0 = {00,10,20,30} => S0_in = 32'h00102030
        // Col1 = {01,11,21,31} => S1_in = 32'h01112131
        // Col2 = {02,12,22,32} => S2_in = 32'h02122232
        // Col3 = {03,13,23,33} => S3_in = 32'h03132333

        S0_in = 32'h00102030;
        S1_in = 32'h01112131;
        S2_in = 32'h02122232;
        S3_in = 32'h03132333;

        #10;

        // In k?t qu?
        $display("D0_out = %h", D0_out);
        $display("D1_out = %h", D1_out);
        $display("D2_out = %h", D2_out);
        $display("D3_out = %h", D3_out);

        // K?t qu? mong ??i sau ShiftRows:
        // [00 01 02 03]
        // [11 12 13 10]
        // [22 23 20 21]
        // [33 30 31 32]
        // => m? h?a l?i theo column-major:
        // D0_out = {00,11,22,33}
        // D1_out = {01,12,23,30}
        // D2_out = {02,13,20,31}
        // D3_out = {03,10,21,32}

        $finish;
    end

endmodule
