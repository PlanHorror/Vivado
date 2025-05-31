module MixColumn(
	input wire [31:0] S0_in,
	input wire [31:0] S1_in,
	input wire [31:0] S2_in,
	input wire [31:0] S3_in,
	output wire [31:0] D0_out,
	output wire [31:0] D1_out,
	output wire [31:0] D2_out,
	output wire [31:0] D3_out
	);
	

	wire [7:0] D0_gf_tmp00_wr, D0_gf_tmp01_wr, D0_gf_tmp02_wr, D0_gf_tmp03_wr;
	wire [7:0] D0_gf_tmp10_wr, D0_gf_tmp11_wr, D0_gf_tmp12_wr, D0_gf_tmp13_wr;
	wire [7:0] D0_gf_tmp20_wr, D0_gf_tmp21_wr, D0_gf_tmp22_wr, D0_gf_tmp23_wr;
	wire [7:0] D0_gf_tmp30_wr, D0_gf_tmp31_wr, D0_gf_tmp32_wr, D0_gf_tmp33_wr;
	
	wire [7:0] D1_gf_tmp00_wr, D1_gf_tmp01_wr, D1_gf_tmp02_wr, D1_gf_tmp03_wr;
	wire [7:0] D1_gf_tmp10_wr, D1_gf_tmp11_wr, D1_gf_tmp12_wr, D1_gf_tmp13_wr;
	wire [7:0] D1_gf_tmp20_wr, D1_gf_tmp21_wr, D1_gf_tmp22_wr, D1_gf_tmp23_wr;
	wire [7:0] D1_gf_tmp30_wr, D1_gf_tmp31_wr, D1_gf_tmp32_wr, D1_gf_tmp33_wr;
	
	wire [7:0] D2_gf_tmp00_wr, D2_gf_tmp01_wr, D2_gf_tmp02_wr, D2_gf_tmp03_wr;
	wire [7:0] D2_gf_tmp10_wr, D2_gf_tmp11_wr, D2_gf_tmp12_wr, D2_gf_tmp13_wr;
	wire [7:0] D2_gf_tmp20_wr, D2_gf_tmp21_wr, D2_gf_tmp22_wr, D2_gf_tmp23_wr;
	wire [7:0] D2_gf_tmp30_wr, D2_gf_tmp31_wr, D2_gf_tmp32_wr, D2_gf_tmp33_wr;
	
	wire [7:0] D3_gf_tmp00_wr, D3_gf_tmp01_wr, D3_gf_tmp02_wr, D3_gf_tmp03_wr;
	wire [7:0] D3_gf_tmp10_wr, D3_gf_tmp11_wr, D3_gf_tmp12_wr, D3_gf_tmp13_wr;
	wire [7:0] D3_gf_tmp20_wr, D3_gf_tmp21_wr, D3_gf_tmp22_wr, D3_gf_tmp23_wr;
	wire [7:0] D3_gf_tmp30_wr, D3_gf_tmp31_wr, D3_gf_tmp32_wr, D3_gf_tmp33_wr;
	
	///*** D0_out ***///
	GF_MUL d0_gf00 (.a(S0_in[31:24]),.b(4'h2), .p(D0_gf_tmp00_wr));
	GF_MUL d0_gf01 (.a(S0_in[23:16]),.b(4'h3), .p(D0_gf_tmp01_wr));
	GF_MUL d0_gf02 (.a(S0_in[15:8]) ,.b(4'h1), .p(D0_gf_tmp02_wr));
	GF_MUL d0_gf03 (.a(S0_in[7:0])  ,.b(4'h1), .p(D0_gf_tmp03_wr));
	
	GF_MUL d0_gf10 (.a(S0_in[31:24]),.b(4'h1), .p(D0_gf_tmp10_wr));
	GF_MUL d0_gf11 (.a(S0_in[23:16]),.b(4'h2), .p(D0_gf_tmp11_wr));
	GF_MUL d0_gf12 (.a(S0_in[15:8]) ,.b(4'h3), .p(D0_gf_tmp12_wr));
	GF_MUL d0_gf13 (.a(S0_in[7:0])  ,.b(4'h1), .p(D0_gf_tmp13_wr));
	
	GF_MUL d0_gf20 (.a(S0_in[31:24]),.b(4'h1), .p(D0_gf_tmp20_wr));
	GF_MUL d0_gf21 (.a(S0_in[23:16]),.b(4'h1), .p(D0_gf_tmp21_wr));
	GF_MUL d0_gf22 (.a(S0_in[15:8]) ,.b(4'h2), .p(D0_gf_tmp22_wr));
	GF_MUL d0_gf23 (.a(S0_in[7:0])  ,.b(4'h3), .p(D0_gf_tmp23_wr));
	
	GF_MUL d0_gf30 (.a(S0_in[31:24]),.b(4'h3), .p(D0_gf_tmp30_wr));
	GF_MUL d0_gf31 (.a(S0_in[23:16]),.b(4'h1), .p(D0_gf_tmp31_wr));
	GF_MUL d0_gf32 (.a(S0_in[15:8]) ,.b(4'h1), .p(D0_gf_tmp32_wr));
	GF_MUL d0_gf33 (.a(S0_in[7:0])  ,.b(4'h2), .p(D0_gf_tmp33_wr));  
	
	assign D0_out[31:24] = D0_gf_tmp00_wr ^ D0_gf_tmp01_wr ^ D0_gf_tmp02_wr ^ D0_gf_tmp03_wr;
	assign D0_out[23:16] = D0_gf_tmp10_wr ^ D0_gf_tmp11_wr ^ D0_gf_tmp12_wr ^ D0_gf_tmp13_wr;
	assign D0_out[15:8]  = D0_gf_tmp20_wr ^ D0_gf_tmp21_wr ^ D0_gf_tmp22_wr ^ D0_gf_tmp23_wr;
	assign D0_out[7:0]   = D0_gf_tmp30_wr ^ D0_gf_tmp31_wr ^ D0_gf_tmp32_wr ^ D0_gf_tmp33_wr;
	
	///*** D1_out ***///
	GF_MUL d1_gf00 (.a(S1_in[31:24]),.b(4'h2), .p(D1_gf_tmp00_wr));
	GF_MUL d1_gf01 (.a(S1_in[23:16]),.b(4'h3), .p(D1_gf_tmp01_wr));
	GF_MUL d1_gf02 (.a(S1_in[15:8]) ,.b(4'h1), .p(D1_gf_tmp02_wr));
	GF_MUL d1_gf03 (.a(S1_in[7:0])  ,.b(4'h1), .p(D1_gf_tmp03_wr));
											
	GF_MUL d1_gf10 (.a(S1_in[31:24]),.b(4'h1), .p(D1_gf_tmp10_wr));
	GF_MUL d1_gf11 (.a(S1_in[23:16]),.b(4'h2), .p(D1_gf_tmp11_wr));
	GF_MUL d1_gf12 (.a(S1_in[15:8]) ,.b(4'h3), .p(D1_gf_tmp12_wr));
	GF_MUL d1_gf13 (.a(S1_in[7:0])  ,.b(4'h1), .p(D1_gf_tmp13_wr));
											
	GF_MUL d1_gf20 (.a(S1_in[31:24]),.b(4'h1), .p(D1_gf_tmp20_wr));
	GF_MUL d1_gf21 (.a(S1_in[23:16]),.b(4'h1), .p(D1_gf_tmp21_wr));
	GF_MUL d1_gf22 (.a(S1_in[15:8]) ,.b(4'h2), .p(D1_gf_tmp22_wr));
	GF_MUL d1_gf23 (.a(S1_in[7:0])  ,.b(4'h3), .p(D1_gf_tmp23_wr));
											
	GF_MUL d1_gf30 (.a(S1_in[31:24]),.b(4'h3), .p(D1_gf_tmp30_wr));
	GF_MUL d1_gf31 (.a(S1_in[23:16]),.b(4'h1), .p(D1_gf_tmp31_wr));
	GF_MUL d1_gf32 (.a(S1_in[15:8]) ,.b(4'h1), .p(D1_gf_tmp32_wr));
	GF_MUL d1_gf33 (.a(S1_in[7:0])  ,.b(4'h2), .p(D1_gf_tmp33_wr));  
	
	assign D1_out[31:24] = D1_gf_tmp00_wr ^ D1_gf_tmp01_wr ^ D1_gf_tmp02_wr ^ D1_gf_tmp03_wr;
	assign D1_out[23:16] = D1_gf_tmp10_wr ^ D1_gf_tmp11_wr ^ D1_gf_tmp12_wr ^ D1_gf_tmp13_wr;
	assign D1_out[15:8]  = D1_gf_tmp20_wr ^ D1_gf_tmp21_wr ^ D1_gf_tmp22_wr ^ D1_gf_tmp23_wr;
	assign D1_out[7:0]   = D1_gf_tmp30_wr ^ D1_gf_tmp31_wr ^ D1_gf_tmp32_wr ^ D1_gf_tmp33_wr;  
	
	///*** D2_out ***///
	GF_MUL d2_gf00 (.a(S2_in[31:24]),.b(4'h2), .p(D2_gf_tmp00_wr));
	GF_MUL d2_gf01 (.a(S2_in[23:16]),.b(4'h3), .p(D2_gf_tmp01_wr));
	GF_MUL d2_gf02 (.a(S2_in[15:8]) ,.b(4'h1), .p(D2_gf_tmp02_wr));
	GF_MUL d2_gf03 (.a(S2_in[7:0])  ,.b(4'h1), .p(D2_gf_tmp03_wr));
											
	GF_MUL d2_gf10 (.a(S2_in[31:24]),.b(4'h1), .p(D2_gf_tmp10_wr));
	GF_MUL d2_gf11 (.a(S2_in[23:16]),.b(4'h2), .p(D2_gf_tmp11_wr));
	GF_MUL d2_gf12 (.a(S2_in[15:8]) ,.b(4'h3), .p(D2_gf_tmp12_wr));
	GF_MUL d2_gf13 (.a(S2_in[7:0])  ,.b(4'h1), .p(D2_gf_tmp13_wr));
											
	GF_MUL d2_gf20 (.a(S2_in[31:24]),.b(4'h1), .p(D2_gf_tmp20_wr));
	GF_MUL d2_gf21 (.a(S2_in[23:16]),.b(4'h1), .p(D2_gf_tmp21_wr));
	GF_MUL d2_gf22 (.a(S2_in[15:8]) ,.b(4'h2), .p(D2_gf_tmp22_wr));
	GF_MUL d2_gf23 (.a(S2_in[7:0])  ,.b(4'h3), .p(D2_gf_tmp23_wr));
											
	GF_MUL d2_gf30 (.a(S2_in[31:24]),.b(4'h3), .p(D2_gf_tmp30_wr));
	GF_MUL d2_gf31 (.a(S2_in[23:16]),.b(4'h1), .p(D2_gf_tmp31_wr));
	GF_MUL d2_gf32 (.a(S2_in[15:8]) ,.b(4'h1), .p(D2_gf_tmp32_wr));
	GF_MUL d2_gf33 (.a(S2_in[7:0])  ,.b(4'h2), .p(D2_gf_tmp33_wr));  
	
	assign D2_out[31:24] = D2_gf_tmp00_wr ^ D2_gf_tmp01_wr ^ D2_gf_tmp02_wr ^ D2_gf_tmp03_wr;
	assign D2_out[23:16] = D2_gf_tmp10_wr ^ D2_gf_tmp11_wr ^ D2_gf_tmp12_wr ^ D2_gf_tmp13_wr;
	assign D2_out[15:8]  = D2_gf_tmp20_wr ^ D2_gf_tmp21_wr ^ D2_gf_tmp22_wr ^ D2_gf_tmp23_wr;
	assign D2_out[7:0]   = D2_gf_tmp30_wr ^ D2_gf_tmp31_wr ^ D2_gf_tmp32_wr ^ D2_gf_tmp33_wr;  
	
	///*** D3_out ***///
	GF_MUL d3_gf00 (.a(S3_in[31:24]),.b(4'h2), .p(D3_gf_tmp00_wr));
	GF_MUL d3_gf01 (.a(S3_in[23:16]),.b(4'h3), .p(D3_gf_tmp01_wr));
	GF_MUL d3_gf02 (.a(S3_in[15:8]) ,.b(4'h1), .p(D3_gf_tmp02_wr));
	GF_MUL d3_gf03 (.a(S3_in[7:0])  ,.b(4'h1), .p(D3_gf_tmp03_wr));
											
	GF_MUL d3_gf10 (.a(S3_in[31:24]),.b(4'h1), .p(D3_gf_tmp10_wr));
	GF_MUL d3_gf11 (.a(S3_in[23:16]),.b(4'h2), .p(D3_gf_tmp11_wr));
	GF_MUL d3_gf12 (.a(S3_in[15:8]) ,.b(4'h3), .p(D3_gf_tmp12_wr));
	GF_MUL d3_gf13 (.a(S3_in[7:0])  ,.b(4'h1), .p(D3_gf_tmp13_wr));
											
	GF_MUL d3_gf20 (.a(S3_in[31:24]),.b(4'h1), .p(D3_gf_tmp20_wr));
	GF_MUL d3_gf21 (.a(S3_in[23:16]),.b(4'h1), .p(D3_gf_tmp21_wr));
	GF_MUL d3_gf22 (.a(S3_in[15:8]) ,.b(4'h2), .p(D3_gf_tmp22_wr));
	GF_MUL d3_gf23 (.a(S3_in[7:0])  ,.b(4'h3), .p(D3_gf_tmp23_wr));
											
	GF_MUL d3_gf30 (.a(S3_in[31:24]),.b(4'h3), .p(D3_gf_tmp30_wr));
	GF_MUL d3_gf31 (.a(S3_in[23:16]),.b(4'h1), .p(D3_gf_tmp31_wr));
	GF_MUL d3_gf32 (.a(S3_in[15:8]) ,.b(4'h1), .p(D3_gf_tmp32_wr));
	GF_MUL d3_gf33 (.a(S3_in[7:0])  ,.b(4'h2), .p(D3_gf_tmp33_wr));  
	
	assign D3_out[31:24] = D3_gf_tmp00_wr ^ D3_gf_tmp01_wr ^ D3_gf_tmp02_wr ^ D3_gf_tmp03_wr;
	assign D3_out[23:16] = D3_gf_tmp10_wr ^ D3_gf_tmp11_wr ^ D3_gf_tmp12_wr ^ D3_gf_tmp13_wr;
	assign D3_out[15:8]  = D3_gf_tmp20_wr ^ D3_gf_tmp21_wr ^ D3_gf_tmp22_wr ^ D3_gf_tmp23_wr;
	assign D3_out[7:0]   = D3_gf_tmp30_wr ^ D3_gf_tmp31_wr ^ D3_gf_tmp32_wr ^ D3_gf_tmp33_wr;  
endmodule

module GF_MUL
( 
    input wire [7:0] a,
    input wire [3:0] b,
    output reg [7:0] p
);

    reg [7:0] temp_a;

    always @(a, b) begin
        temp_a = a;
        p = 0;
		
        if (b[0]) p = p ^ temp_a;
        temp_a = (temp_a << 1) ^ ((temp_a & 8'h80) ? 8'h1B : 8'h00);

        if (b[1]) p = p ^ temp_a;
        temp_a = (temp_a << 1) ^ ((temp_a & 8'h80) ? 8'h1B : 8'h00);

        if (b[2]) p = p ^ temp_a;
        temp_a = (temp_a << 1) ^ ((temp_a & 8'h80) ? 8'h1B : 8'h00);

        if (b[3]) p = p ^ temp_a;
    end

endmodule