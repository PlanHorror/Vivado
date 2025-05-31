// File này có 2 l?i

module RotWord(
	input wire [7:0] S0_in,
	input wire [7:0] S1_in,
	input wire [7:0] S2_in,
	input wire [7:0] S3_in,
	output wire [7:0] D0_out,
	output wire [7:0] D1_out,
	output wire [7:0] D2_out,
	output wire [7:0] D3_out	
	);
	
	assign D0_out = S1_in; // L?i 1: D0_out = S0_in; --> D0_out = S1_in;
	assign D1_out = S2_in;
	assign D2_out = S3_in;
	assign D3_out = S0_in; // L?i 2: D3_out = S1_in; --> D3_out = S0_in;
	
endmodule