// File này có 2 l?i

module KeyExpansion(
	input wire 		 	CLK,
	input wire 		 	RST,
	input wire			start_in,
	input wire [31:0] 	key0_in,
	input wire [31:0] 	key1_in,
	input wire [31:0] 	key2_in,
	input wire [31:0] 	key3_in,
	output wire [31:0] 	key0_out,
	output wire [31:0] 	key1_out,
	output wire [31:0] 	key2_out,
	output wire [31:0] 	key3_out,
	output wire [1:0] 	state_out 
	);
	
	//State Declarations
	parameter IDLE 			= 0;
	parameter ROUND0 		= 1;
	parameter ROUND1to9   	= 2;
	parameter ROUND10   	= 3;
	
	///// Tín hi?u wire
	wire [31:0] 	w4_w;
	wire [31:0] 	w5_w;
	wire [31:0] 	w6_w;
	wire [31:0] 	w7_w;

	wire [31:0] 	rotword_w;
	wire [31:0] 	subword_w;
	wire [31:0] 	roundconst_w;
	
	///// Tín hi?u reg
	reg [1:0] 	state_r;
	reg [1:0] 	next_state_r;
	reg [3:0] 	round_r;
	
	reg [31:0] 	w0_r;
	reg [31:0] 	w1_r;
	reg [31:0] 	w2_r;
	reg [31:0] 	w3_r;
	
	///// M?ch t? h?p
	assign key0_out 	= (state_r == IDLE)? 0: (round_r == 0) ? key0_in : w4_w; 
	assign key1_out 	= (state_r == IDLE)? 0: (round_r == 0) ? key1_in : w5_w; 
	assign key2_out 	= (state_r == IDLE)? 0: (round_r == 0) ? key2_in : w6_w; 
	assign key3_out 	= (state_r == IDLE)? 0: (round_r == 0) ? key3_in : w7_w; 

	assign state_out	= state_r; 
	
	RotWord rotword(
	.S0_in(w3_r[31:24]),
	.S1_in(w3_r[23:16]),
	.S2_in(w3_r[15:8] ),
	.S3_in(w3_r[7:0]  ),
	.D0_out(rotword_w[31:24]),
	.D1_out(rotword_w[23:16]),
	.D2_out(rotword_w[15:8] ),
	.D3_out(rotword_w[7:0]  )	
	);

	SubWord subword(
	.S0_in(rotword_w[31:24]),
	.S1_in(rotword_w[23:16]),
	.S2_in(rotword_w[15:8] ),
	.S3_in(rotword_w[7:0]  ),
	.D0_out(subword_w[31:24]),
	.D1_out(subword_w[23:16]),
	.D2_out(subword_w[15:8] ),
	.D3_out(subword_w[7:0]  )	
	);

	RoundConst roundconst(
	.round(round_r),
	.S0_in(subword_w[31:24]),
	.S1_in(subword_w[23:16]),
	.S2_in(subword_w[15:8] ),
	.S3_in(subword_w[7:0]  ),
	.D0_out(roundconst_w[31:24]),
	.D1_out(roundconst_w[23:16]),
	.D2_out(roundconst_w[15:8] ),
	.D3_out(roundconst_w[7:0]  )	
	);
	
	assign w4_w = w0_r ^ roundconst_w;
	assign w5_w = w4_w ^ w1_r;
	assign w6_w = w5_w ^ w2_r;
	assign w7_w = w6_w ^ w3_r;
	
	///// M?ch tu?n t?
	
	always @(posedge CLK or negedge RST) begin
		if (RST == 0) begin
			w0_r <= 0;
			w1_r <= 0;
			w2_r <= 0;
			w3_r <= 0;
		end
		else begin
			if(state_r == IDLE) begin
				w0_r <= 0;
				w1_r <= 0;
				w2_r <= 0;
				w3_r <= 0;			
			end
			if(state_r == ROUND0) begin
				w0_r <= key0_in;
				w1_r <= key1_in;
				w2_r <= key2_in;
				w3_r <= key3_in;
			end
			else begin
				w0_r <= w4_w;
				w1_r <= w5_w;
				w2_r <= w6_w;
				w3_r <= w7_w;			
			end
		end
	end

	always @(posedge CLK or negedge RST) begin
		if (RST == 0) begin
			round_r <= 0;
		end
		else begin
		if(state_r != IDLE)
			round_r <= round_r + 1;
		else
			round_r <= 0;
	  end
	end		  
	
	///// Máy tr?ng thái FSM
	
	//Combinational Next State Logic
	always @(state_r or start_in or round_r)
	  case (state_r)
		IDLE:
		  if (start_in)
			next_state_r = ROUND0;
		  else
			next_state_r = IDLE;
		ROUND0:
		  if (round_r == 0) // round_r = 0 --> round_r = 1
			next_state_r = ROUND1to9;
		  else
			next_state_r = ROUND0;
	   ROUND1to9:
		  if((round_r == 9))   // if (round_r > 9) --> if(round_r >= 1) && (round_r <= 9)
			next_state_r = ROUND10; // next_state_r = ROUND10; --> next_state_r = ROUND1to9;
		  else
			next_state_r = ROUND1to9; // next_state_r = ROUND1to9; --> next_state_r = ROUND10;
	   ROUND10:
	   	  if (round_r == 10)  
			next_state_r = IDLE;
		  else
			next_state_r = ROUND10;
		endcase
	
	always @(posedge CLK)
		  if (RST == 0)
			state_r <= IDLE;
		  else
			state_r <= next_state_r;

endmodule