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

 gfggyttttvfc    // Two inputs for AES: key and data
    reg  [`DATA_WIDTH-1:0]          key_r, data_r;
    wire [`DATA_WIDTH-1:0]          key_w, data_w;
    wire [`DATA_WIDTH-1:0]          aes_output_w;

    assign key_w = key_r;
    assign data_w = data_r;

    // MidProcess instance for AES encryption
    MidProcess aes_processor(
        .in_plaintext(data_w),
        .in_key(key_w),
        .out_data(aes_output_w),
        .clk(CLK),
        .rst(RST),
        .ena_i(ena_i && (addra_i == `ADDR_WIDTH'h1)), // Only enable for data address
        .wea_i(wea_i && (addra_i == `ADDR_WIDTH'h1))  // Only write enable for data address
    );

    always @(posedge CLK or negedge RST)
    begin
        if(~RST) begin
            key_r <= `DATA_WIDTH'h0;
            data_r <= `DATA_WIDTH'h0;
        end
        else begin
            if (wea_i & ena_i) begin
                case(addra_i)
                    `ADDR_WIDTH'h0: begin  // Address 0: Key input
                        key_r <= dina_i;
                        data_r <= data_w;
                    end
                    `ADDR_WIDTH'h1: begin  // Address 1: Data input (triggers AES)
                        key_r <= key_w;
                        data_r <= dina_i;
                    end
                    default: begin
                        key_r <= key_w;
                        data_r <= data_w;
                    end
                endcase
            end
            else begin
                key_r <= key_w;
                data_r <= data_w;
            end
        end
    end

    // Output: AES encrypted result when reading, 0 when writing
    assign douta_o = (ena_i & ~wea_i) ? aes_output_w : `DATA_WIDTH'h0;

endmodule