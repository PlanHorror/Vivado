`timescale 1ns / 1ps
`include "common.vh"
module compute_tb;
    // ??nh ngh?a các tín hi?u testbench
    reg CLK;
    reg RST;
    reg [`DATA_WIDTH-1:0] dina_i;
    reg [`ADDR_WIDTH-1:0] addra_i;
    reg ena_i;
    reg wea_i;
    wire [7:0] douta_o1;

    // Instantiate the compute module
    compute uut (
        .CLK(CLK),
        .RST(RST),
        .dina_i(dina_i),
        .addra_i(addra_i),
        .ena_i(ena_i),
        .wea_i(wea_i),
        .douta_o1(douta_o1)
    );

    // Clock generation
    always #5 CLK = ~CLK;

    initial begin
        // Kh?i t?o tín hi?u
        CLK = 0;
        RST = 0;
        dina_i = 0;
        addra_i = 0;
        ena_i = 0;
        wea_i = 0;
        
        // Reset h? th?ng
        #10 RST = 1;
        
        // Ghi giá tr? vào thanh ghi a_r
        #10 ena_i = 1; wea_i = 1; addra_i = 0; dina_i = 8'h03;
        #10 wea_i = 0;
        
        // Ghi giá tr? vào thanh ghi b_r
        #10 wea_i = 1; addra_i = 1; dina_i = 8'h04;
        #10 wea_i = 0;
        
        // ??c d? li?u (ki?m tra ??u ra b? nhân)
        #10 ena_i = 1; wea_i = 0; addra_i = 0;
        
        // Ch? m?t lúc ?? quan sát k?t qu?
        #50;
        
        // K?t thúc mô ph?ng
        $finish;
    end

    // Monitor ?? in giá tr? tín hi?u
    initial begin
        $monitor("Time: %0t | addr: %h | data_in: %h | dout: %h", $time, addra_i, dina_i, douta_o1);
    end
endmodule