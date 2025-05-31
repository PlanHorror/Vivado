`timescale 1ns / 1ps

module SubWord_tb;

    reg  [7:0] S0_in_r;
    reg  [7:0] S1_in_r;
    reg  [7:0] S2_in_r;
    reg  [7:0] S3_in_r;

    wire [7:0] D0_out_w;
    wire [7:0] D1_out_w;
    wire [7:0] D2_out_w;
    wire [7:0] D3_out_w;

    integer test_num;
    integer fail_count;

    SubWord dut (
        .S0_in(S0_in_r),
        .S1_in(S1_in_r),
        .S2_in(S2_in_r),
        .S3_in(S3_in_r),
        .D0_out(D0_out_w),
        .D1_out(D1_out_w),
        .D2_out(D2_out_w),
        .D3_out(D3_out_w)
    );

    initial begin
        test_num = 0;
        fail_count = 0;

        $display("--- B?t ??u Testbench SubWord ---");

        // Test Case 1: Giá tr? c? b?n 0x00-0x03
        test_num = test_num + 1;
        S0_in_r = 8'h00; S1_in_r = 8'h01; S2_in_r = 8'h02; S3_in_r = 8'h03;
        #10; 
        $display("--- Test Case %0d: Input = %h %h %h %h ---", test_num, S0_in_r, S1_in_r, S2_in_r, S3_in_r);
        $display("  Expected Output: %h %h %h %h", 8'h63, 8'h7c, 8'h77, 8'h7b);
        $display("  Actual Output:   %h %h %h %h", D0_out_w, D1_out_w, D2_out_w, D3_out_w);
        if (D0_out_w === 8'h63 && D1_out_w === 8'h7c && D2_out_w === 8'h77 && D3_out_w === 8'h7b) begin
            $display("  Result: PASS");
        end else begin
            $display("  Result: FAIL ***");
            fail_count = fail_count + 1;
        end

        // Test Case 2: Giá tr? t? ví d? KeyExpansion (RotWord(w3) = 20467567)
        test_num = test_num + 1;
        S0_in_r = 8'h20; S1_in_r = 8'h46; S2_in_r = 8'h75; S3_in_r = 8'h67;
        #10;
        $display("--- Test Case %0d: Input = %h %h %h %h ---", test_num, S0_in_r, S1_in_r, S2_in_r, S3_in_r);
        $display("  Expected Output: %h %h %h %h", 8'hb7, 8'h5a, 8'h9d, 8'h85);
        $display("  Actual Output:   %h %h %h %h", D0_out_w, D1_out_w, D2_out_w, D3_out_w);
        if (D0_out_w === 8'hb7 && D1_out_w === 8'h5a && D2_out_w === 8'h9d && D3_out_w === 8'h85) begin
            $display("  Result: PASS");
        end else begin
            $display("  Result: FAIL ***");
            fail_count = fail_count + 1;
        end

        // Test Case 3: Toàn b? là 0x00
        test_num = test_num + 1;
        S0_in_r = 8'h00; S1_in_r = 8'h00; S2_in_r = 8'h00; S3_in_r = 8'h00;
        #10;
        $display("--- Test Case %0d: Input = %h %h %h %h ---", test_num, S0_in_r, S1_in_r, S2_in_r, S3_in_r);
        $display("  Expected Output: %h %h %h %h", 8'h63, 8'h63, 8'h63, 8'h63);
        $display("  Actual Output:   %h %h %h %h", D0_out_w, D1_out_w, D2_out_w, D3_out_w);
        if (D0_out_w === 8'h63 && D1_out_w === 8'h63 && D2_out_w === 8'h63 && D3_out_w === 8'h63) begin
            $display("  Result: PASS");
        end else begin
            $display("  Result: FAIL ***");
            fail_count = fail_count + 1;
        end

        // Test Case 4: Toàn b? là 0xFF
        test_num = test_num + 1;
        S0_in_r = 8'hFF; S1_in_r = 8'hFF; S2_in_r = 8'hFF; S3_in_r = 8'hFF;
        #10;
        $display("--- Test Case %0d: Input = %h %h %h %h ---", test_num, S0_in_r, S1_in_r, S2_in_r, S3_in_r);
        $display("  Expected Output: %h %h %h %h", 8'h16, 8'h16, 8'h16, 8'h16);
        $display("  Actual Output:   %h %h %h %h", D0_out_w, D1_out_w, D2_out_w, D3_out_w);
        if (D0_out_w === 8'h16 && D1_out_w === 8'h16 && D2_out_w === 8'h16 && D3_out_w === 8'h16) begin
            $display("  Result: PASS");
        end else begin
            $display("  Result: FAIL ***");
            fail_count = fail_count + 1;
        end

        // Test Case 5: Giá tr? h?n h?p
        test_num = test_num + 1;
        S0_in_r = 8'h54; S1_in_r = 8'h77; S2_in_r = 8'h6F; S3_in_r = 8'h20;
        #10;
        $display("--- Test Case %0d: Input = %h %h %h %h ---", test_num, S0_in_r, S1_in_r, S2_in_r, S3_in_r);
        $display("  Expected Output: %h %h %h %h", 8'h20, 8'hf5, 8'ha8, 8'hb7);
        $display("  Actual Output:   %h %h %h %h", D0_out_w, D1_out_w, D2_out_w, D3_out_w);
        if (D0_out_w === 8'h20 && D1_out_w === 8'hf5 && D2_out_w === 8'ha8 && D3_out_w === 8'hb7) begin
            $display("  Result: PASS");
        end else begin
            $display("  Result: FAIL ***");
            fail_count = fail_count + 1;
        end

        $display("------------------------------------");
        if (fail_count == 0)
            $display("--- SubWord Testbench: ALL %0d TESTS PASSED ---", test_num);
        else
            $display("--- SubWord Testbench: %0d out of %0d TESTS FAILED ---", fail_count, test_num);
        $display("------------------------------------");

        $finish;
    end

endmodule