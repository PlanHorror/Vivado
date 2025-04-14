`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/14/2025 04:10:13 PM
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
// Use compute instance
    reg clk;
    reg rst;
    reg [`DATA_WIDTH-1:0] dina_i;
    reg [`ADDR_WIDTH-1:0] addra_i;
    reg ena_i;
    reg wea_i;
    wire [`DATA_WIDTH-1:0] douta_o;

    compute u_compute (
        .CLK(clk),
        .RST(rst),
        .dina_i(dina_i),
        .addra_i(addra_i),
        .ena_i(ena_i),
        .wea_i(wea_i),
        .douta_o(douta_o)
    );

    initial begin
        // Initialize signals
        clk = 0;
        rst = 1;
        dina_i = 0;
        addra_i = 0;
        ena_i = 0;
        wea_i = 0;

        // Test case
        #10 dina_i = 5; addra_i = 0; ena_i = 1; wea_i = 1; // Write value
        #10 wea_i = 0; // Disable write
        #10 ena_i = 0; // Disable enable
        #10 $stop; // Stop simulation
    end

    always #5 clk = ~clk; // Clock generation
endmodule
