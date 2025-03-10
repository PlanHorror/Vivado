module register4bits( dataOut, dataIn, enable, clock, clear );

// Inputs and outputs
output [3:0] dataOut;
input [3:0] dataIn;
input enable, clock, clear;

// Internal wires
wire [3:0] d;
wire enable_n; // NOT enable

not (enable_n, enable);

and (d0_en, enable, dataIn[0]);
and (d0_hold, enable_n, dataOut[0]);
or  (d[0], d0_en, d0_hold);

and (d1_en, enable, dataIn[1]);
and (d1_hold, enable_n, dataOut[1]);
or  (d[1], d1_en, d1_hold);

and (d2_en, enable, dataIn[2]);
and (d2_hold, enable_n, dataOut[2]);
or  (d[2], d2_en, d2_hold);

and (d3_en, enable, dataIn[3]);
and (d3_hold, enable_n, dataOut[3]);
or  (d[3], d3_en, d3_hold);

// 4 D Flip-Flops
edge_dff ff0 ( dataOut[0], , d[0], clock, clear );
edge_dff ff1 ( dataOut[1], , d[1], clock, clear );
edge_dff ff2 ( dataOut[2], , d[2], clock, clear );
edge_dff ff3 ( dataOut[3], , d[3], clock, clear );

endmodule
