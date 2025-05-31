module AddRoundKey(
	input wire [31:0] S0_in, //State
	input wire [31:0] S1_in, //State
	input wire [31:0] S2_in, //State
	input wire [31:0] S3_in, //State
	input wire [31:0] S4_in, // Roundkey
	input wire [31:0] S5_in, // Roundkey
	input wire [31:0] S6_in, // Roundkey
	input wire [31:0] S7_in, // Roundkey
	output wire [31:0] D0_out,
	output wire [31:0] D1_out,
	output wire [31:0] D2_out,
	output wire [31:0] D3_out	
	);
	
	assign D0_out = S0_in ^ S4_in; 
	assign D1_out = S1_in ^ S5_in; 
	assign D2_out = S2_in ^ S6_in;
	assign D3_out = S3_in ^ S7_in; 
	
endmodule
