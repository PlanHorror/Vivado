`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/16/2025 05:02:03 PM
// Design Name: 
// Module Name: top
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

module AXI4Lite_Compute (
    input S_AXI_ACLK,
    input S_AXI_ARESETN,
    input [31:0] S_AXI_WDATA,
    input [31:0] S_AXI_ARADDR,
    input [31:0] S_AXI_AWADDR,
    input slv_reg_wren,
    input slv_reg_rden,
    output reg [31:0] axi_rdata
);

reg [31:0] y, a, b, x;

// Write operation
always @(posedge S_AXI_ACLK) begin
    if (S_AXI_ARESETN == 1'b0) begin
        a <= 0;
        b <= 0;
        x <= 0;
    end else begin
        if (slv_reg_wren && (S_AXI_AWADDR == 32'hA0000000))
            a <= S_AXI_WDATA;
        else if (slv_reg_wren && (S_AXI_AWADDR == 32'hA0000004))
            b <= S_AXI_WDATA;
        else if (slv_reg_wren && (S_AXI_AWADDR == 32'hA0000008))
            x <= S_AXI_WDATA;
    end
end

// Computation (y = a * x + b)
always @(posedge S_AXI_ACLK) begin
    if (S_AXI_ARESETN == 1'b0)
        y <= 0;
    else
        y <= a * x + b;
end

// Read operation
always @(posedge S_AXI_ACLK) begin
    if (S_AXI_ARESETN == 1'b0)
        axi_rdata <= 0;
    else begin
        if (slv_reg_rden && (S_AXI_ARADDR == 32'hA000000C))
            axi_rdata <= y;
    end
end

endmodule
