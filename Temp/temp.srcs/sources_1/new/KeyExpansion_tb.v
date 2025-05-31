`timescale 1ns / 1ps

module KeyExpansion_tb;

    parameter CLK_PERIOD = 10;          
    parameter HALF_PERIOD = CLK_PERIOD / 2;

    reg CLK;
    reg RST;
    reg start_in;
    reg [31:0] key0_in_r;
    reg [31:0] key1_in_r;
    reg [31:0] key2_in_r;
    reg [31:0] key3_in_r;

    wire [31:0] key0_out_w;
    wire [31:0] key1_out_w;
    wire [31:0] key2_out_w;
    wire [31:0] key3_out_w;
    wire [1:0] state_out_w;

    localparam [127:0] INITIAL_KEY             = 128'h5468617473206D79204B756E67204675;
    localparam [127:0] EXPECTED_ROUND_KEY_0  = INITIAL_KEY;
    localparam [127:0] EXPECTED_ROUND_KEY_1  = 128'hE232FCF191129188B159E4E6D679A293;
    localparam [127:0] EXPECTED_ROUND_KEY_2  = 128'h56_08_20_07_C7_1A_B1_8F_76_43_55_69_A0_3A_F7_FA;
    localparam [127:0] EXPECTED_ROUND_KEY_3  = 128'hD2_60_0D_E7_15_7A_BC_68_63_39_E9_01_C3_03_1E_FB;
    localparam [127:0] EXPECTED_ROUND_KEY_4  = 128'hA11202C9B468BEA1D75157A01452495B;
    localparam [127:0] EXPECTED_ROUND_KEY_5  = 128'hB1_29_3B_33_05_41_85_92_D2_10_D2_32_C6_42_9B_69;
    localparam [127:0] EXPECTED_ROUND_KEY_6  = 128'hBD_3D_C2_B7_B8_7C_47_15_6A_6C_95_27_AC_2E_0E_4E;
    localparam [127:0] EXPECTED_ROUND_KEY_7  = 128'hCC96ED1674EAAA031E863F24B2A8316A;
    localparam [127:0] EXPECTED_ROUND_KEY_8  = 128'h8E51EF21FABB4522E43D7A0656954B6C;
    localparam [127:0] EXPECTED_ROUND_KEY_9  = 128'hBF_E2_BF_90_45_59_FA_B2_A1_64_80_B4_F7_F1_CB_D8;
    localparam [127:0] EXPECTED_ROUND_KEY_10 = 128'h28_FD_DE_F8_6D_A4_24_4A_CC_C0_A4_FE_3B_31_6F_26;

    reg [127:0] expected_keys [0:10];

    wire [127:0] current_key_out;

    integer round_check; 
    integer fail_count;

    KeyExpansion dut (
        .CLK(CLK),
        .RST(RST),
        .start_in(start_in),
        .key0_in(key0_in_r),
        .key1_in(key1_in_r),
        .key2_in(key2_in_r),
        .key3_in(key3_in_r),
        .key0_out(key0_out_w),
        .key1_out(key1_out_w),
        .key2_out(key2_out_w),
        .key3_out(key3_out_w),
        .state_out(state_out_w)
    );

    assign current_key_out = {key0_out_w, key1_out_w, key2_out_w, key3_out_w};

    always begin
        CLK = 1'b0;
        #(HALF_PERIOD);
        CLK = 1'b1;
        #(HALF_PERIOD);
    end

    task check_key;
        input integer round_num;
        input [127:0] expected_key;
        begin
            @(posedge CLK); 
            $display("--- Check Round %0d Key ---", round_num);
            $display("  State Output: %d, Round Counter (Internal): %d", state_out_w, dut.round_r); 
            $display("  Expected (Key %0d): %h", round_num, expected_key);
            $display("  Output:           %h", current_key_out);
            if (current_key_out === expected_key) begin
                $display("  Result: PASS");
            end else begin
                $display("  Result: FAIL ***");
                fail_count = fail_count + 1;
            end
        end
    endtask

    initial begin
        CLK = 1'b0;
        RST = 1'b0; 
        start_in = 1'b0;
        {key0_in_r, key1_in_r, key2_in_r, key3_in_r} = INITIAL_KEY;
        round_check = 0;
        fail_count = 0;

        expected_keys[0]  = EXPECTED_ROUND_KEY_0;
        expected_keys[1]  = EXPECTED_ROUND_KEY_1;
        expected_keys[2]  = EXPECTED_ROUND_KEY_2;
        expected_keys[3]  = EXPECTED_ROUND_KEY_3;
        expected_keys[4]  = EXPECTED_ROUND_KEY_4;
        expected_keys[5]  = EXPECTED_ROUND_KEY_5;
        expected_keys[6]  = EXPECTED_ROUND_KEY_6;
        expected_keys[7]  = EXPECTED_ROUND_KEY_7;
        expected_keys[8]  = EXPECTED_ROUND_KEY_8;
        expected_keys[9]  = EXPECTED_ROUND_KEY_9;
        expected_keys[10] = EXPECTED_ROUND_KEY_10;

        # (CLK_PERIOD * 2);
        RST = 1'b1;
        # (CLK_PERIOD);

        $display("----------------------------------------------------");
        $display("--- B?t ??u Testbench KeyExpansion ---");
        $display("--- Initial Key: %h", INITIAL_KEY);
        $display("----------------------------------------------------");

        start_in = 1'b1;
        @(posedge CLK);
        start_in = 1'b0;

        wait (state_out_w == dut.ROUND0);
        check_key(0, expected_keys[0]);

        wait (state_out_w == dut.ROUND1to9);
        check_key(1, expected_keys[1]);

        for (round_check = 2; round_check <= 10; round_check = round_check + 1) begin
             check_key(round_check, expected_keys[round_check]);
        end

        wait (state_out_w == dut.IDLE); 
        $display("Final State Output: %d (Expected IDLE: %d)", state_out_w, dut.IDLE);
        # (CLK_PERIOD * 2); 

        $display("----------------------------------------------------");
        $display("--- K?t thúc Testbench KeyExpansion ---");
        if (fail_count == 0) begin
             $display("--- Overall Result: PASS ---");
             end
        else
        begin
             $display("--- Overall Result: FAIL (%0d rounds failed) ---", fail_count);
        end
        $display("----------------------------------------------------");

        $finish; 
    end

endmodule