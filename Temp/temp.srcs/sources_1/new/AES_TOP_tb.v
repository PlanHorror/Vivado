`timescale 1ns / 1ps

module AES_TOP_tb;


    parameter CLK_PERIOD = 10;          
    parameter HALF_PERIOD = CLK_PERIOD / 2;

    parameter NUM_TEST_CASES = 2;      
    parameter TIMEOUT_CYCLES = 200;    

    reg CLK;
    reg RST;
    reg start_in;
    reg [31:0] plaintext0_in_r;
    reg [31:0] plaintext1_in_r;
    reg [31:0] plaintext2_in_r;
    reg [31:0] plaintext3_in_r;
    reg [31:0] key0_in_r;
    reg [31:0] key1_in_r;
    reg [31:0] key2_in_r;
    reg [31:0] key3_in_r;

    wire [31:0] ciphertext0_out_w;
    wire [31:0] ciphertext1_out_w;
    wire [31:0] ciphertext2_out_w;
    wire [31:0] ciphertext3_out_w;
    wire valid_out_w;

    reg [127:0] test_plaintexts [0:NUM_TEST_CASES-1];
    reg [127:0] test_keys [0:NUM_TEST_CASES-1];
    reg [127:0] test_ciphertext_expected [0:NUM_TEST_CASES-1];

    reg [127:0] current_plaintext;
    reg [127:0] current_key;
    wire [127:0] current_ciphertext_out;
    reg [127:0] current_ciphertext_expected;

    integer i;
    integer pass_count;
    integer fail_count;
    integer timeout_count;

    AES_TOP dut (
        .CLK(CLK),
        .RST(RST),
        .start_in(start_in),
        .plaintext0_in(plaintext0_in_r),
        .plaintext1_in(plaintext1_in_r),
        .plaintext2_in(plaintext2_in_r),
        .plaintext3_in(plaintext3_in_r),
        .key0_in(key0_in_r),
        .key1_in(key1_in_r),
        .key2_in(key2_in_r),
        .key3_in(key3_in_r),
        .ciphertext0_out(ciphertext0_out_w),
        .ciphertext1_out(ciphertext1_out_w),
        .ciphertext2_out(ciphertext2_out_w),
        .ciphertext3_out(ciphertext3_out_w),
        .valid_out(valid_out_w)
    );

    assign current_ciphertext_out = {ciphertext0_out_w, ciphertext1_out_w, ciphertext2_out_w, ciphertext3_out_w};

    always begin
        CLK = 1'b0;
        #(HALF_PERIOD);
        CLK = 1'b1;
        #(HALF_PERIOD);
    end

    initial begin
        RST = 1'b0; 
        # (CLK_PERIOD * 2);
        RST = 1'b1;
        # (CLK_PERIOD);
    end

    initial begin


        // Test Case 1 (AES)
        test_plaintexts[0] = 128'h54776F204F6E65204E696E652054776F;
        test_keys[0]       = 128'h5468617473206D79204B756E67204675;
        test_ciphertext_expected[0] = 128'h29C3505F571420F6402299B31A02D73A;

        // Test Case 2 (NIST FIPS 197 C.1)
        test_plaintexts[1] = 128'h00112233445566778899aabbccddeeff; 
        test_keys[1]       = 128'h000102030405060708090a0b0c0d0e0f; 
        test_ciphertext_expected[1] = 128'h69c4e0d86a7b0430d8cdb78070b4c55a;

        $display("INFO: %0d bộ test vector.", NUM_TEST_CASES);
    end


    initial begin
        #1;

        pass_count = 0;
        fail_count = 0;
        timeout_count = 0;
        start_in = 1'b0;

        wait (RST == 1'b1);
        # (CLK_PERIOD);

        $display("----------------------------------------------------");
        $display("--- Bat Dau Testbench AES_TOP ---");
        $display("----------------------------------------------------");

        for (i = 0; i < NUM_TEST_CASES; i = i + 1) begin
            $display("--- Test Case %0d ---", i + 1);

            current_plaintext = test_plaintexts[i];
            current_key = test_keys[i];
            current_ciphertext_expected = test_ciphertext_expected[i];

            {plaintext0_in_r, plaintext1_in_r, plaintext2_in_r, plaintext3_in_r} = current_plaintext;
            {key0_in_r, key1_in_r, key2_in_r, key3_in_r} = current_key;

            $display("  Plaintext: %h", current_plaintext);
            $display("  Key:       %h", current_key);
            $display("  Expected:  %h", current_ciphertext_expected);

            start_in = 1'b1;
            @(posedge CLK);
            start_in = 1'b0;

            timeout_count = 0;
            while (!valid_out_w && timeout_count < TIMEOUT_CYCLES) begin
                @(posedge CLK);
                timeout_count = timeout_count + 1;
            end

            if (valid_out_w) begin
                $display("  Output:       %h", current_ciphertext_out); 

                if (current_ciphertext_out === current_ciphertext_expected) begin
                    $display("  Result: PASS");
                    pass_count = pass_count + 1;
                end else begin
                    $display("  Result: FAIL ***");
                    fail_count = fail_count + 1;
                end
            end else begin
                $display("  Result: FAIL (TIMEOUT - valid_out khong duoc kich hoat sau %0d chu ky) ***", TIMEOUT_CYCLES);
                fail_count = fail_count + 1;
            end

            # (CLK_PERIOD * 2);
        end

        $display("----------------------------------------------------");
        $display("--- Ket thuc Testbench AES_TOP ---");
        $display("  Tổng s�' Test Cases: %0d", NUM_TEST_CASES);
        $display("  S�' lượng PASS:      %0d", pass_count);
        $display("  S�' lượng FAIL:      %0d", fail_count);
        $display("----------------------------------------------------");

        $finish; 
    end

endmodule