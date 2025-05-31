module AES_TOP(
	input wire 		 	CLK,
	input wire 		 	RST,
	input wire			start_in,
	input wire [31:0] 	plaintext0_in,
	input wire [31:0] 	plaintext1_in,
	input wire [31:0] 	plaintext2_in,
	input wire [31:0] 	plaintext3_in,
	input wire [31:0] 	key0_in,
	input wire [31:0] 	key1_in,
	input wire [31:0] 	key2_in,
	input wire [31:0] 	key3_in,
	output wire [31:0] 	ciphertext0_out,
	output wire [31:0] 	ciphertext1_out,
	output wire [31:0] 	ciphertext2_out,
	output wire [31:0] 	ciphertext3_out,
	output wire 		valid_out
	);
	
	///// Tín hi?u wire
	wire [31:0]		KE_key0_w, KE_key1_w, KE_key2_w, KE_key3_w;
	wire [1:0] 		state_w;
	Cipher cipher(
		.CLK(CLK),
		.RST(RST),
		.plaintext0_in(plaintext0_in),
		.plaintext1_in(plaintext1_in),
		.plaintext2_in(plaintext2_in),
		.plaintext3_in(plaintext3_in),
		.key0_in(KE_key0_w),
		.key1_in(KE_key1_w),
		.key2_in(KE_key2_w),
		.key3_in(KE_key3_w),
		.state_in(state_w),
		.ciphertext0_out(ciphertext0_out),
		.ciphertext1_out(ciphertext1_out),
		.ciphertext2_out(ciphertext2_out),
		.ciphertext3_out(ciphertext3_out),
		.valid_out(valid_out)
	);

	KeyExpansion keyexpansion (
		.CLK(CLK),
		.RST(RST),
		.start_in(start_in),
		.key0_in(key0_in),
		.key1_in(key1_in),
		.key2_in(key2_in),
		.key3_in(key3_in),
		.key0_out(KE_key0_w),
		.key1_out(KE_key1_w),
		.key2_out(KE_key2_w),
		.key3_out(KE_key3_w),
		.state_out(state_w)
	);
	
endmodule