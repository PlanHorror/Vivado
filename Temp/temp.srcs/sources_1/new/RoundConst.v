// File này có 2 l?i

module RoundConst(
	input wire [3:0] round,
	input wire [7:0] S0_in,
	input wire [7:0] S1_in,
	input wire [7:0] S2_in,
	input wire [7:0] S3_in,
	output wire [7:0] D0_out,
	output wire [7:0] D1_out,
	output wire [7:0] D2_out,
	output wire [7:0] D3_out	
	);
	
	wire [7:0] rcon_w;
	
	rcon rcon (.S_in(round), .D_out(rcon_w));
	
	assign D0_out = rcon_w ^ S0_in;  // assign D0_out = rcon_w ^ S1_in; -->  assign D0_out = rcon_w ^ S0_in;
	assign D1_out = S1_in; // assign D1_out = S0_in; -->  assign D1_out = S1_in;
	assign D2_out = S2_in;
	assign D3_out = S3_in;
endmodule

module rcon(input  wire [3:0] S_in,
             output reg  [7:0] D_out);
             
always @*
begin
 case(S_in[3:0])
    4'h1: D_out <= 8'h01;
    4'h2: D_out <= 8'h02;
    4'h3: D_out <= 8'h04;
    4'h4: D_out <= 8'h08;
    4'h5: D_out <= 8'h10;
    4'h6: D_out <= 8'h20;
    4'h7: D_out <= 8'h40;
    4'h8: D_out <= 8'h80;
    4'h9: D_out <= 8'h1b;
    4'ha: D_out <= 8'h36;
    default: D_out <= 8'h00;
  endcase
end
endmodule
