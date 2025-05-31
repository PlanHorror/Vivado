module SubByte(
	input wire [31:0] S0_in,
	input wire [31:0] S1_in,
	input wire [31:0] S2_in,
	input wire [31:0] S3_in,
	output wire [31:0] D0_out,
	output wire [31:0] D1_out,
	output wire [31:0] D2_out,
	output wire [31:0] D3_out
	);
	
	SubWord sw0(
		.S0_in(S0_in[31:24]),
		.S1_in(S0_in[23:16]),
		.S2_in(S0_in[15:8] ),
		.S3_in(S0_in[7:0]  ),
		.D0_out(D0_out[31:24]),
		.D1_out(D0_out[23:16]),
		.D2_out(D0_out[15:8] ),
		.D3_out(D0_out[7:0]  )	
	);  

	SubWord sw1(
		.S0_in(S1_in[31:24]),
		.S1_in(S1_in[23:16]),
		.S2_in(S1_in[15:8] ),
		.S3_in(S1_in[7:0]  ),
		.D0_out(D1_out[31:24]),
		.D1_out(D1_out[23:16]),
		.D2_out(D1_out[15:8] ),
		.D3_out(D1_out[7:0]  )	
	); 

	SubWord sw2(
		.S0_in(S2_in[31:24]),
		.S1_in(S2_in[23:16]),
		.S2_in(S2_in[15:8] ),
		.S3_in(S2_in[7:0]  ),
		.D0_out(D2_out[31:24]),
		.D1_out(D2_out[23:16]),
		.D2_out(D2_out[15:8] ),
		.D3_out(D2_out[7:0]  )	
	); 

	SubWord sw3(
		.S0_in(S3_in[31:24]),
		.S1_in(S3_in[23:16]),
		.S2_in(S3_in[15:8] ),
		.S3_in(S3_in[7:0]  ),
		.D0_out(D3_out[31:24]),
		.D1_out(D3_out[23:16]),
		.D2_out(D3_out[15:8] ),
		.D3_out(D3_out[7:0]  )	
	); 	
	
endmodule
