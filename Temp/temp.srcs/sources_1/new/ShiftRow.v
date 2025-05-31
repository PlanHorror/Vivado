// Có 2 l?i trong file này

module ShiftRow(
	input wire [31:0] S0_in,
	input wire [31:0] S1_in,
	input wire [31:0] S2_in,
	input wire [31:0] S3_in,
	output wire [31:0] D0_out,
	output wire [31:0] D1_out,
	output wire [31:0] D2_out,
	output wire [31:0] D3_out	
	);
	wire [7:0] bytes [0:15];
	wire [7:0] temp [0:15];
	
	assign bytes[0] = S0_in[31:24];
	assign bytes[1] = S0_in[23:16];
	assign bytes[2] = S0_in[15:8];
	assign bytes[3] = S0_in[7:0];

	assign bytes[4] = S1_in[31:24];
	assign bytes[5] = S1_in[23:16];
	assign bytes[6] = S1_in[15:8];
	assign bytes[7] = S1_in[7:0];

	assign bytes[8] = S2_in[31:24];
	assign bytes[9] = S2_in[23:16];
	assign bytes[10] = S2_in[15:8];
	assign bytes[11] = S2_in[7:0];

	assign bytes[12] = S3_in[31:24];
	assign bytes[13] = S3_in[23:16];
	assign bytes[14] = S3_in[15:8];
	assign bytes[15] = S3_in[7:0];
	
	
	assign temp[0] = bytes[0];
	assign temp[1] = bytes[5];
	assign temp[2] = bytes[10];
	assign temp[3] = bytes[15];
	
	assign temp[4] = bytes[4]; // bytes[1] --> bytes[4];
	assign temp[5] = bytes[9];
	assign temp[6] = bytes[14];
	assign temp[7] = bytes[3];

	assign temp[8] = bytes[8];
	assign temp[9] = bytes[13];
	assign temp[10] = bytes[2];
	assign temp[11] = bytes[7];
	
	assign temp[12] = bytes[12];
	assign temp[13] = bytes[1]; // bytes[0]; --> bytes[1];
	assign temp[14] = bytes[6];
	assign temp[15] = bytes[11];	
	
	
	assign D0_out = {temp[0],temp[1],temp[2],temp[3]}; 
	assign D1_out = {temp[4],temp[5],temp[6],temp[7]}; 
	assign D2_out = {temp[8],temp[9],temp[10],temp[11]};
	assign D3_out = {temp[12],temp[13],temp[14],temp[15]}; 
	
endmodule
