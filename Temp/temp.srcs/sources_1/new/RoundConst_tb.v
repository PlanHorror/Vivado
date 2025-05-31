`timescale 1ns / 1ps

module RoundConst_tb;

    reg  [3:0] round_r;
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

    reg [7:0] expected_D0;
    reg [7:0] expected_D1;
    reg [7:0] expected_D2;
    reg [7:0] expected_D3;
    reg [7:0] current_rcon; 

    RoundConst dut (
        .round(round_r),
        .S0_in(S0_in_r),
        .S1_in(S1_in_r),
        .S2_in(S2_in_r),
        .S3_in(S3_in_r),
        .D0_out(D0_out_w),
        .D1_out(D1_out_w),
        .D2_out(D2_out_w),
        .D3_out(D3_out_w)
    );


    task check_output;
        input [3:0] current_round;
        input [7:0] rcon_val;
        input [7:0] s0_val;
        input [7:0] s1_val;
        input [7:0] s2_val;
        input [7:0] s3_val;
        begin
            test_num = test_num + 1;
            round_r = current_round;
            S0_in_r = s0_val;
            S1_in_r = s1_val;
            S2_in_r = s2_val;
            S3_in_r = s3_val;

            current_rcon = rcon_val;
            expected_D0 = s0_val ^ rcon_val; 
            expected_D1 = s1_val;
            expected_D2 = s2_val;
            expected_D3 = s3_val;

            #10; 

            $display("--- Test Case %0d: Round = %d, Input = %h %h %h %h ---", test_num, current_round, s0_val, s1_val, s2_val, s3_val);
            $display("  Expected Rcon[%0d]: %h", current_round, current_rcon);
            $display("  Expected Output:   %h %h %h %h", expected_D0, expected_D1, expected_D2, expected_D3);
            $display("  Actual Output:     %h %h %h %h", D0_out_w, D1_out_w, D2_out_w, D3_out_w);

            if (D0_out_w === expected_D0 && D1_out_w === expected_D1 && D2_out_w === expected_D2 && D3_out_w === expected_D3) begin
                $display("  Result: PASS");
            end else begin
                $display("  Result: FAIL ***");
                fail_count = fail_count + 1;
            end
        end
    endtask

    initial begin
        test_num = 0;
        fail_count = 0;

        $display("--- B?t ??u Testbench RoundConst ---");

        // Test Case 1: Round 1, giá tr? t? SubWord(RotWord(w3))
        check_output(4'h1, 8'h01, 8'hb7, 8'h5a, 8'h9d, 8'h85);

        // Test Case 2: Round 2, giá tr? ng?u nhiên
        check_output(4'h2, 8'h02, 8'haa, 8'hbb, 8'hcc, 8'hdd);

        // Test Case 3: Round 9, giá tr? ng?u nhiên
        check_output(4'h9, 8'h1b, 8'h12, 8'h34, 8'h56, 8'h78);

        // Test Case 4: Round 10, giá tr? ng?u nhiên
        check_output(4'ha, 8'h36, 8'hff, 8'hff, 8'hff, 8'hff);

        // Test Case 5: Round 0 (invalid, Rcon=00)
        check_output(4'h0, 8'h00, 8'h11, 8'h22, 8'h33, 8'h44);

        // Test Case 6: Round 4, S0 = 0
        check_output(4'h4, 8'h08, 8'h00, 8'hab, 8'hcd, 8'hef);

        // Test Case 7: Round 8, S0 = Rcon
        check_output(4'h8, 8'h80, 8'h80, 8'h11, 8'h22, 8'h33); // Expected D0 = 00

        $display("------------------------------------");
        if (fail_count == 0)
            $display("--- RoundConst Testbench: ALL %0d TESTS PASSED ---", test_num);
        else
            $display("--- RoundConst Testbench: %0d out of %0d TESTS FAILED ---", fail_count, test_num);
        $display("------------------------------------");

        $finish;
    end

endmodule