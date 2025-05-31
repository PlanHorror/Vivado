//File này có 2 l?i

module Cipher(
	input wire 		 	CLK,
	input wire 		 	RST,
	input wire [31:0] 	plaintext0_in,
	input wire [31:0] 	plaintext1_in,
	input wire [31:0] 	plaintext2_in,
	input wire [31:0] 	plaintext3_in,
	input wire [31:0] 	key0_in,
	input wire [31:0] 	key1_in,
	input wire [31:0] 	key2_in,
	input wire [31:0] 	key3_in,
	input wire [1:0] 	state_in,
	output wire [31:0] 	ciphertext0_out,
	output wire [31:0] 	ciphertext1_out,
	output wire [31:0] 	ciphertext2_out,
	output wire [31:0] 	ciphertext3_out,
	output wire 		valid_out
	);
	
	///// Tín hi?u wire
	
	// Round 0
	wire [31:0] 	D0_ARK_round0_w, D1_ARK_round0_w, D2_ARK_round0_w, D3_ARK_round0_w; 
	
	// Round 1 to 9
	wire [31:0] 	D0_ARK_round1to9_w, D1_ARK_round1to9_w, D2_ARK_round1to9_w, D3_ARK_round1to9_w;
	wire [31:0] 	D0_SB_round1to9_w, D1_SB_round1to9_w, D2_SB_round1to9_w, D3_SB_round1to9_w;
	wire [31:0] 	D0_SR_round1to9_w, D1_SR_round1to9_w, D2_SR_round1to9_w, D3_SR_round1to9_w;
	wire [31:0] 	D0_MC_round1to9_w, D1_MC_round1to9_w, D2_MC_round1to9_w, D3_MC_round1to9_w;
	
	// Round 10
	wire [31:0] 	D0_ARK_round10_w, D1_ARK_round10_w, D2_ARK_round10_w, D3_ARK_round10_w;
	wire [31:0] 	D0_SB_round10_w, D1_SB_round10_w, D2_SB_round10_w, D3_SB_round10_w;
	wire [31:0] 	D0_SR_round10_w, D1_SR_round10_w, D2_SR_round10_w, D3_SR_round10_w;	
	
	///// Tín hi?u reg
	
	reg [31:0] 		Ciphertext0_r;
	reg [31:0] 		Ciphertext1_r;
	reg [31:0] 		Ciphertext2_r;
	reg [31:0] 		Ciphertext3_r;
	
	reg				valid_r;
	
	///// M?ch t? h?p
	assign ciphertext0_out	= Ciphertext0_r;
	assign ciphertext1_out	= Ciphertext1_r;
	assign ciphertext2_out	= Ciphertext2_r;
	assign ciphertext3_out	= Ciphertext3_r;
	
	assign valid_out		= valid_r;
	
	// Round 0
	AddRoundKey ARK_round0(
	.S0_in(plaintext0_in),
	.S1_in(plaintext1_in),
	.S2_in(plaintext2_in),
	.S3_in(plaintext3_in),
	.S4_in(key0_in),
	.S5_in(key1_in),
	.S6_in(key2_in),
	.S7_in(key3_in),
	.D0_out(D0_ARK_round0_w),
	.D1_out(D1_ARK_round0_w),
	.D2_out(D2_ARK_round0_w),
	.D3_out(D3_ARK_round0_w)	
	);

	// Round 1 to 9
	SubByte SB_round1to9 (
	.S0_in(Ciphertext0_r),
	.S1_in(Ciphertext1_r),
	.S2_in(Ciphertext2_r),
	.S3_in(Ciphertext3_r),
	.D0_out(D0_SB_round1to9_w),
	.D1_out(D1_SB_round1to9_w),
	.D2_out(D2_SB_round1to9_w),
	.D3_out(D3_SB_round1to9_w)
	);
	
	ShiftRow SR_round1to9 (
	.S0_in(D0_SB_round1to9_w),
	.S1_in(D1_SB_round1to9_w),
	.S2_in(D2_SB_round1to9_w),
	.S3_in(D3_SB_round1to9_w),
	.D0_out(D0_SR_round1to9_w),
	.D1_out(D1_SR_round1to9_w),
	.D2_out(D2_SR_round1to9_w),
	.D3_out(D3_SR_round1to9_w)
	);

	MixColumn MC_round1to9 (
	.S0_in(D0_SR_round1to9_w),
	.S1_in(D1_SR_round1to9_w),
	.S2_in(D2_SR_round1to9_w),
	.S3_in(D3_SR_round1to9_w),
	.D0_out(D0_MC_round1to9_w),
	.D1_out(D1_MC_round1to9_w),
	.D2_out(D2_MC_round1to9_w),
	.D3_out(D3_MC_round1to9_w)
	);

	AddRoundKey ARK_round1to9(
	.S0_in(D0_MC_round1to9_w),
	.S1_in(D1_MC_round1to9_w),
	.S2_in(D2_MC_round1to9_w),
	.S3_in(D3_MC_round1to9_w),
	.S4_in(key0_in),
	.S5_in(key1_in),
	.S6_in(key2_in),
	.S7_in(key3_in),
	.D0_out(D0_ARK_round1to9_w),
	.D1_out(D1_ARK_round1to9_w),
	.D2_out(D2_ARK_round1to9_w),
	.D3_out(D3_ARK_round1to9_w)	
	);

	// Round 10
	SubByte SB_round10 (
	.S0_in(Ciphertext0_r),
	.S1_in(Ciphertext1_r),
	.S2_in(Ciphertext2_r),
	.S3_in(Ciphertext3_r),
	.D0_out(D0_SB_round10_w),
	.D1_out(D1_SB_round10_w),
	.D2_out(D2_SB_round10_w),
	.D3_out(D3_SB_round10_w)
	);
	
	ShiftRow SR_round10 (
	.S0_in(D0_SB_round10_w),
	.S1_in(D1_SB_round10_w),
	.S2_in(D2_SB_round10_w),
	.S3_in(D3_SB_round10_w),
	.D0_out(D0_SR_round10_w),
	.D1_out(D1_SR_round10_w),
	.D2_out(D2_SR_round10_w),
	.D3_out(D3_SR_round10_w)
	);

	AddRoundKey ARK_round10(
	.S0_in(D0_SR_round10_w),
	.S1_in(D1_SR_round10_w),
	.S2_in(D2_SR_round10_w),
	.S3_in(D3_SR_round10_w),
	.S4_in(key0_in),
	.S5_in(key1_in),
	.S6_in(key2_in),
	.S7_in(key3_in),
	.D0_out(D0_ARK_round10_w),
	.D1_out(D1_ARK_round10_w),
	.D2_out(D2_ARK_round10_w),
	.D3_out(D3_ARK_round10_w)	
	);	
	
	///// M?ch tu?n t?
	
	parameter IDLE 			= 0;
	parameter ROUND0 		= 1;
	parameter ROUND1to9   	= 2;
	parameter ROUND10   	= 3;
	
	always @(posedge CLK or negedge RST) begin
		if (RST == 0) begin
			Ciphertext0_r 	<= 0;
			Ciphertext1_r 	<= 0;
			Ciphertext2_r 	<= 0;
			Ciphertext3_r 	<= 0;
			valid_r			<=0;
		end
		else begin
			if(state_in == IDLE) begin
				Ciphertext0_r <= 0;
				Ciphertext1_r <= 0;
				Ciphertext2_r <= 0;
				Ciphertext3_r <= 0;	
				valid_r		  <= 0;				
			end
			else if(state_in == ROUND0) begin
				Ciphertext0_r <= D0_ARK_round0_w;
				Ciphertext1_r <= D1_ARK_round0_w;
				Ciphertext2_r <= D2_ARK_round0_w;
				Ciphertext3_r <= D3_ARK_round0_w;
				valid_r		  <= 0;	
			end
			else if(state_in == ROUND1to9) begin // else if(state_in == ROUND10) begin --> else if(state_in == ROUND1to9) begin
				Ciphertext0_r <= D0_ARK_round1to9_w;
				Ciphertext1_r <= D1_ARK_round1to9_w;
				Ciphertext2_r <= D2_ARK_round1to9_w;
				Ciphertext3_r <= D3_ARK_round1to9_w;
				valid_r		  <= 0;	
			end
			else begin
				Ciphertext0_r <= D0_ARK_round10_w;
				Ciphertext1_r <= D1_ARK_round10_w;
				Ciphertext2_r <= D2_ARK_round10_w;
				Ciphertext3_r <= D3_ARK_round10_w;
				valid_r		  <= 1;	 // valid_r		  <= 0; --> valid_r		  <= 1;
			end
		end
	end

endmodule