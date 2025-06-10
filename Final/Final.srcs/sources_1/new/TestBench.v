`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/20/2025 05:57:00 PM
// Design Name: 
// Module Name: TestBench
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

module TestBench;
    // MidProcess testbench signals
    reg [31:0] in_data;
    reg [`ADDR_WIDTH-1:0] addr;
    wire [31:0] out_data;
    reg clk, rst;
    reg ena_i, wea_i;
    
    // Test data storage
    reg [127:0] test_key_0, test_data_0;
    reg [127:0] test_key_1, test_data_1;
    reg [127:0] expected_output_0, expected_output_1;
    reg [31:0] received_output_0 [0:3]; // Store test case 1 outputs
    reg [31:0] received_output_1 [0:3]; // Store test case 2 outputs
    integer test_case;
    
    // MidProcess instance
    MidProcess mid_processor(
        .in_data(in_data),
        .addr(addr),
        .out_data(out_data),
        .clk(clk),
        .rst(rst),
        .ena_i(ena_i),
        .wea_i(wea_i)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns period = 100MHz
    end

    // Test procedure
    initial begin
        // Initialize test data
        test_key_0 = 128'h00000000000000000000000000000000;
        test_data_0 = 128'h00000000000000000000000000000000;
        test_key_1 = 128'h11111111111111111111111111111111;
        test_data_1 = 128'h11111111111111111111111111111111;
        
        // Initialize signals
        in_data = 32'h0;
        addr = `ADDR_WIDTH'h0;
        ena_i = 1'b0;
        wea_i = 1'b0;
        rst = 1'b0;
        test_case = 0;
        
        // Reset sequence
        #20;
        rst = 1'b1;
        #20;
        
        $display("Starting MidProcess Pipeline Testbench");
        $display("Sending both test cases in pipeline fashion");
        
        // // Pipeline Test: Send Test Case 1, then immediately Test Case 2
        // send_pipeline_data();
        
        // // Wait and receive outputs for both test cases
        // receive_pipeline_outputs();
        
        // #100;
        // $display("Pipeline testbench completed");
        $finish;
    end
    
    // Task to send both test cases in pipeline fashion
    task send_pipeline_data;
        begin
            $display("=== PIPELINE INPUT PHASE ===");
            
            // Test Case 1: Send key and data
            $display("Sending Test Case 1 - Key: 0x%h, Data: 0x%h", test_key_0, test_data_0);
            
            // Send key for test case 1 (4 x 32-bit writes to address 0)
            addr = `ADDR_WIDTH'h0; // Key address
            in_data = test_key_0[31:0];
            ena_i = 1'b1;
            wea_i = 1'b1;
            #10;
            $display("TC1 Key[0]: 0x%h", in_data);
            
            in_data = test_key_0[63:32];
            #10;
            $display("TC1 Key[1]: 0x%h", in_data);
            
            in_data = test_key_0[95:64];
            #10;
            $display("TC1 Key[2]: 0x%h", in_data);
            
            in_data = test_key_0[127:96];
            #10;
            $display("TC1 Key[3]: 0x%h", in_data);
            
            // Send data for test case 1 (4 x 32-bit writes to address 1)
            addr = `ADDR_WIDTH'h1; // Data address
            in_data = test_data_0[31:0];
            #10;
            $display("TC1 Data[0]: 0x%h", in_data);
            
            in_data = test_data_0[63:32];
            #10;
            $display("TC1 Data[1]: 0x%h", in_data);
            
            in_data = test_data_0[95:64];
            #10;
            $display("TC1 Data[2]: 0x%h", in_data);
            
            in_data = test_data_0[127:96];
            #10;
            $display("TC1 Data[3]: 0x%h", in_data);
            
            // NO DELAY - Immediately send Test Case 2 for pipeline operation
            $display("Sending Test Case 2 - Key: 0x%h, Data: 0x%h", test_key_1, test_data_1);
            
            // Send key for test case 2 (4 x 32-bit writes to address 0)
            addr = `ADDR_WIDTH'h0; // Key address
            in_data = test_key_1[31:0];
            #10;
            $display("TC2 Key[0]: 0x%h", in_data);
            
            in_data = test_key_1[63:32];
            #10;
            $display("TC2 Key[1]: 0x%h", in_data);
            
            in_data = test_key_1[95:64];
            #10;
            $display("TC2 Key[2]: 0x%h", in_data);
            
            in_data = test_key_1[127:96];
            #10;
            $display("TC2 Key[3]: 0x%h", in_data);
            
            // Send data for test case 2 (4 x 32-bit writes to address 1)
            addr = `ADDR_WIDTH'h1; // Data address
            in_data = test_data_1[31:0];
            #10;
            $display("TC2 Data[0]: 0x%h", in_data);
            
            in_data = test_data_1[63:32];
            #10;
            $display("TC2 Data[1]: 0x%h", in_data);
            
            in_data = test_data_1[95:64];
            #10;
            $display("TC2 Data[2]: 0x%h", in_data);
            
            in_data = test_data_1[127:96];
            #10;
            $display("TC2 Data[3]: 0x%h", in_data);
            
            // Stop writing
            ena_i = 1'b0;
            wea_i = 1'b0;
            #20;
            
            $display("=== INPUT PHASE COMPLETE ===");
        end
    endtask
    
    // Task to receive outputs from both test cases
    task receive_pipeline_outputs;
        begin
            $display("=== PIPELINE OUTPUT PHASE ===");
            
            // Wait for first output to be ready
            $display("Waiting for Test Case 1 output...");
            #300; // Adjust timing based on pipeline depth
            
            // Read Test Case 1 output (4 x 32-bit reads)
            $display("Reading Test Case 1 output:");
            ena_i = 1'b1;
            wea_i = 1'b0; // Read operation
            #10;
            received_output_0[0] = out_data;
            $display("TC1 Output[0]: 0x%h", out_data);
            ena_i = 1'b0;
            #10;
            
            ena_i = 1'b1;
            wea_i = 1'b0;
            #10;
            received_output_0[1] = out_data;
            $display("TC1 Output[1]: 0x%h", out_data);
            ena_i = 1'b0;
            #10;
            
            ena_i = 1'b1;
            wea_i = 1'b0;
            #10;
            received_output_0[2] = out_data;
            $display("TC1 Output[2]: 0x%h", out_data);
            ena_i = 1'b0;
            #10;
            
            ena_i = 1'b1;
            wea_i = 1'b0;
            #10;
            received_output_0[3] = out_data;
            $display("TC1 Output[3]: 0x%h", out_data);
            ena_i = 1'b0;
            #10;
            
            // Reconstruct 128-bit output for test case 1
            expected_output_0 = {received_output_0[3], received_output_0[2], received_output_0[1], received_output_0[0]};
            $display("Test Case 1 Complete Output: 0x%h", expected_output_0);
            
            // Wait a bit for second output
            #100;
            
            // Read Test Case 2 output (4 x 32-bit reads)
            $display("Reading Test Case 2 output:");
            ena_i = 1'b1;
            wea_i = 1'b0;
            #10;
            received_output_1[0] = out_data;
            $display("TC2 Output[0]: 0x%h", out_data);
            ena_i = 1'b0;
            #10;
            
            ena_i = 1'b1;
            wea_i = 1'b0;
            #10;
            received_output_1[1] = out_data;
            $display("TC2 Output[1]: 0x%h", out_data);
            ena_i = 1'b0;
            #10;
            
            ena_i = 1'b1;
            wea_i = 1'b0;
            #10;
            received_output_1[2] = out_data;
            $display("TC2 Output[2]: 0x%h", out_data);
            ena_i = 1'b0;
            #10;
            
            ena_i = 1'b1;
            wea_i = 1'b0;
            #10;
            received_output_1[3] = out_data;
            $display("TC2 Output[3]: 0x%h", out_data);
            ena_i = 1'b0;
            #10;
            
            // Reconstruct 128-bit output for test case 2
            expected_output_1 = {received_output_1[3], received_output_1[2], received_output_1[1], received_output_1[0]};
            $display("Test Case 2 Complete Output: 0x%h", expected_output_1);
            
            $display("=== OUTPUT PHASE COMPLETE ===");
        end
    endtask

    // Monitor for debugging pipeline operation
    always @(posedge clk) begin
        if (ena_i && wea_i) begin
            $display("Time: %0t | Writing to addr %0d: 0x%h", $time, addr, in_data);
        end
        if (ena_i && !wea_i) begin
            $display("Time: %0t | Reading from MidProcess: 0x%h", $time, out_data);
        end
    end

    //
    // OLD TESTBENCHES (COMMENTED OUT)
    //
    
    // // Round testbench
    // reg [127:0] in_data, key;
    // wire [127:0] out_data;
    // reg clk, rst;
    // reg [3:0] round;
    // Round Round_0(
    //     .in_data(in_data),
    //     .old_key(key),
    //     .clk(clk),
    //     .rst(rst),
    //     .round(round),
    //     .out_data(out_data)
    // );

    // initial begin
    //     in_data = 128'h0f0453fa038c8e2e842e076d63a28967;
    //     key = 128'h0f1571c947d9e8590cb7add6af7f6798;
    //     round = 4'b0000;
    //     rst = 1'b1;
    //     repeat(10) begin
    //         #1 clk = ~clk;
    //     end
    // end
    
    //
    // KeyExpansion testbench
    //
    // reg [127:0] old_key;
    // wire [127:0] new_key;
    // KeyExpansion KeyExpansion_0(
    // .old_key(old_key),
    // .round(1),
    // .new_key(new_key)
    // );
    // initial begin
    //     old_key = 128'h2b7e151628aed2a6abf7158809cf4f3c;
    // end
    
    //
    // MixColumns testbench
    //
    // reg [127:0] in_data;
    // wire [127:0] out_data;
    // MixColumns MixColumns_0(
    // .in_data(in_data),
    // .out_data(out_data)
    // );

    // initial begin
    //     in_data = 128'hd4e0b81ebfb441275d52119830aef1e5;
    // end
    
    // 
    // ColumnProcess testbench
    //
    // reg [7:0] in_data0, in_data1, in_data2, in_data3;
    // reg [1:0] col;
    // wire [7:0] out_data0, out_data1, out_data2, out_data3;
    // ColumnProcess ColumnProcess_0(
    // .in_data0(in_data0),
    // .in_data1(in_data1),
    // .in_data2(in_data2),
    // .in_data3(in_data3),
    // .col(col),
    // .out_data0(out_data0),
    // .out_data1(out_data1),
    // .out_data2(out_data2),
    // .out_data3(out_data3)
    // );
    // initial begin
    //     in_data0 = 8'hd4;
    //     in_data1 = 8'hbf;
    //     in_data2 = 8'h5d;
    //     in_data3 = 8'h30;
    //     col = 2'b00;
    //     #10;
    //     in_data0 = 8'he0;
    //     in_data1 = 8'hb4;
    //     in_data2 = 8'h52;
    //     in_data3 = 8'hae;
    //     col = 2'b01;
    //     #10;
    //     in_data0=8'hXX;
    //     in_data1=8'hXX;
    //     in_data2=8'hXX;
    //     in_data3=8'hXX;
    //     col = 2'b10;
    //     #20 $finish;
    // end
    
    // 
    // Multiplication testbench
    // 
    // reg [7:0] in_data;
    // reg [1:0] sel;
    // wire [7:0] out_data;
    // Multiplication Multiplication_0(
    // .in_data(in_data),
    // .sel(sel),
    // .out_data(out_data)
    // );
    // initial begin
    //     // Define the input data for test case 0
    //     in_data = 8'h32;
    //     sel = 2'b01;
    //     #10;
    //     in_data = 8'h19;
    //     sel = 2'b10;
    //     #10;
    //     in_data=8'hd4;
    //     sel = 2'b10;
    //     #10;
    //     in_data=8'hbf;
    //     sel = 2'b11;
    //     #20 $finish;
    // end
    
    // 
    // SubBytes and ShiftRows testbench
    // 
    // reg [127:0] in_data0, in_data1;
    // wire [127:0] out_data0, out_data1;
    // SubBytes SubBytes_0(
    // .in_data(in_data0),
    // .out_data(out_data0)
    // );
    // ShiftRows ShiftRows_0(
    // .in_data(in_data1),
    // .out_data(out_data1)
    // );
    // initial begin
        // Define the input data for test case 0
        // in_data0 = 128'h32a2f3c4a5f6e7d8b9a8b7c6d5e4f3;
        // in_data1 = out_data0;
        // #10;
        // in_data0 = 128'h19a09ae93df4c6f8e3e28d48be2b2a08;
        // in_data1 = out_data0;
        // #10;
        // in_data0=8'hXX;
        // in_data1 = out_data0;
        // #20 $finish;
    // end
endmodule
