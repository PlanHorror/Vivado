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
    output wire [`ADDR_WIDTH-1:0]   douta_o
);

    reg  [`DATA_WIDTH-1:0]          a_r;
    wire [`DATA_WIDTH-1:0]          a_w, douta_o1;
    assign a_w = a_r;

    // Instantiate the sum module
        sum u_sum (
            .n(a_r),
            .sum(douta_o1)
        );
    always @(posedge CLK or negedge RST)
    begin
        if(~RST) begin
            a_r <= `DATA_WIDTH'h0;
        end
        else begin
            if (wea_i & ena_i) begin
                case(addra_i)
                    `ADDR_WIDTH'h0: begin
                        a_r <= dina_i;
                    end
                    default: begin
                        a_r <= a_w;
                    end
                endcase
            end
            else begin
                a_r <= a_w;
            end
        end
    end
    // Assign douta_o to sum module output
    assign douta_o = (~wea_i & ena_i) ? douta_o1 :  `DATA_WIDTH'h0;
    
endmodule