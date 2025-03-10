module counter4bit(clk, clear, Q);
  input clk, clear;
  output [3:0] Q;

  wire [3:0] D;
  wire q0_bar, q1_bar, q2_bar, q3_bar;
  wire and01, and012;

  // D[0] = NOT Q[0]
  not (D[0], Q[0]);

  // D[1] = Q[1] XOR Q[0]
  xor (D[1], Q[1], Q[0]);

  // D[2] = Q[2] XOR (Q[0] AND Q[1])
  and (and01, Q[0], Q[1]);  // and01 = Q[0] AND Q[1]
  xor (D[2], Q[2], and01);

  // D[3] = Q[3] XOR (Q[0] AND Q[1] AND Q[2])
  and (and012, and01, Q[2]);  // and012 = (Q[0] AND Q[1]) AND Q[2]
  xor (D[3], Q[3], and012);

  // K?t n?i vào các D flip-flop
  edge_dff ff0(Q[0], q0_bar, D[0], clk, clear);
  edge_dff ff1(Q[1], q1_bar, D[1], clk, clear);
  edge_dff ff2(Q[2], q2_bar, D[2], clk, clear);
  edge_dff ff3(Q[3], q3_bar, D[3], clk, clear);

endmodule
