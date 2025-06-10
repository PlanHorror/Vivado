// Author: Le Vu Trung Duong
// Nara Institute of Science and Technology
// Description: This is the example of the top module

`include "common.vh"

module compute(
    input wire                      CLK,
    input wire                      RST,
    input wire [`DATA_WIDTH-1:0]    dina_i,
    input wire [`ADDR_WIDTH-1:0]    addra_i,
    input wire                      ena_i,
    input wire                      wea_i,
    output wire [`DATA_WIDTH-1:0]   douta_o
);

    wire [`DATA_WIDTH-1:0] aes_output_w;

    // MidProcess instance for AES encryption
    MidProcess aes_processor(
        .in_data(dina_i),           // Direct data input - same for both key and data
        .addr(addra_i),             // Address determines if it's key (0) or data (1)
        .out_data(aes_output_w),    // AES encrypted output
        .clk(CLK),
        .rst(RST),
        .ena_i(ena_i),              // Pass through enable signal
        .wea_i(wea_i)               // Pass through write enable signal
    );

    // Output: AES encrypted result when reading, 0 when writing
    assign douta_o = (ena_i & ~wea_i) ? aes_output_w : `DATA_WIDTH'h0;

endmodule