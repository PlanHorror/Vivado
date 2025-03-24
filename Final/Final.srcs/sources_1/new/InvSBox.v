`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/24/2025 12:52:08 AM
// Design Name: 
// Module Name: InvSBox
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module InvSBox(
    input [7:0] in_data,
    output reg [7:0] out_data
);
always @(in_data) begin
    case (in_data)
        // Line 0 of inv_s_box
        8'h00: out_data = 8'h52;
        8'h01: out_data = 8'h09;
        8'h02: out_data = 8'h6A;
        8'h03: out_data = 8'hD5;
        8'h04: out_data = 8'h30;
        8'h05: out_data = 8'h36;
        8'h06: out_data = 8'hA5;
        8'h07: out_data = 8'h38;
        8'h08: out_data = 8'hBF;
        8'h09: out_data = 8'h40;
        8'h0A: out_data = 8'hA3;
        8'h0B: out_data = 8'h9E;
        8'h0C: out_data = 8'h81;
        8'h0D: out_data = 8'hF3;
        8'h0E: out_data = 8'hD7;
        8'h0F: out_data = 8'hFB;
        // Line 1 of inv_s_box
        8'h10: out_data = 8'h7C;
        8'h11: out_data = 8'hE3;
        8'h12: out_data = 8'h39;
        8'h13: out_data = 8'h82;
        8'h14: out_data = 8'h9B;
        8'h15: out_data = 8'h2F;
        8'h16: out_data = 8'hFF;
        8'h17: out_data = 8'h87;
        8'h18: out_data = 8'h34;
        8'h19: out_data = 8'h8E;
        8'h1A: out_data = 8'h43;
        8'h1B: out_data = 8'h44;
        8'h1C: out_data = 8'hC4;
        8'h1D: out_data = 8'hDE;
        8'h1E: out_data = 8'hE9;
        8'h1F: out_data = 8'hCB;
        // Line 2 of inv_s_box
        8'h20: out_data = 8'h54;
        8'h21: out_data = 8'h7B;
        8'h22: out_data = 8'h94;
        8'h23: out_data = 8'h32;
        8'h24: out_data = 8'hA6;
        8'h25: out_data = 8'hC2;
        8'h26: out_data = 8'h23;
        8'h27: out_data = 8'h3D;
        8'h28: out_data = 8'hEE;
        8'h29: out_data = 8'h4C;
        8'h2A: out_data = 8'h95;
        8'h2B: out_data = 8'h0B;
        8'h2C: out_data = 8'h42;
        8'h2D: out_data = 8'hFA;
        8'h2E: out_data = 8'hC3;
        8'h2F: out_data = 8'h4E;
        // Line 3 of inv_s_box
        8'h30: out_data = 8'h08;
        8'h31: out_data = 8'h2E;
        8'h32: out_data = 8'hA1;
        8'h33: out_data = 8'h66;
        8'h34: out_data = 8'h28;
        8'h35: out_data = 8'hD9;
        8'h36: out_data = 8'h24;
        8'h37: out_data = 8'hB2;
        8'h38: out_data = 8'h76;
        8'h39: out_data = 8'h5B;
        8'h3A: out_data = 8'hA2;
        8'h3B: out_data = 8'h49;
        8'h3C: out_data = 8'h6D;
        8'h3D: out_data = 8'h8B;
        8'h3E: out_data = 8'hD1;
        8'h3F: out_data = 8'h25;
        // Line 4 of inv_s_box
        8'h40: out_data = 8'h72;
        8'h41: out_data = 8'hF8;
        8'h42: out_data = 8'hF6;
        8'h43: out_data = 8'h64;
        8'h44: out_data = 8'h86;
        8'h45: out_data = 8'h68;
        8'h46: out_data = 8'h98;
        8'h47: out_data = 8'h16;
        8'h48: out_data = 8'hD4;
        8'h49: out_data = 8'hA4;
        8'h4A: out_data = 8'h5C;
        8'h4B: out_data = 8'hCC;
        8'h4C: out_data = 8'h5D;
        8'h4D: out_data = 8'h65;
        8'h4E: out_data = 8'hB6;
        8'h4F: out_data = 8'h92;
        // Line 5 of inv_s_box
        8'h50: out_data = 8'h6C;
        8'h51: out_data = 8'h70;
        8'h52: out_data = 8'h48;
        8'h53: out_data = 8'h50;
        8'h54: out_data = 8'hFD;
        8'h55: out_data = 8'hED;
        8'h56: out_data = 8'hB9;
        8'h57: out_data = 8'hDA;
        8'h58: out_data = 8'h5E;
        8'h59: out_data = 8'h15;
        8'h5A: out_data = 8'h46;
        8'h5B: out_data = 8'h57;
        8'h5C: out_data = 8'hA7;
        8'h5D: out_data = 8'h8D;
        8'h5E: out_data = 8'h9D;
        8'h5F: out_data = 8'h84;
        // Line 6 of inv_s_box
        8'h60: out_data = 8'h90;
        8'h61: out_data = 8'hD8;
        8'h62: out_data = 8'hAB;
        8'h63: out_data = 8'h00;
        8'h64: out_data = 8'h8C;
        8'h65: out_data = 8'hBC;
        8'h66: out_data = 8'hD3;
        8'h67: out_data = 8'h0A;
        8'h68: out_data = 8'hF7;
        8'h69: out_data = 8'hE4;
        8'h6A: out_data = 8'h58;
        8'h6B: out_data = 8'h05;
        8'h6C: out_data = 8'hB8;
        8'h6D: out_data = 8'hB3;
        8'h6E: out_data = 8'h45;
        8'h6F: out_data = 8'h06;
        // Line 7 of inv_s_box
        8'h70: out_data = 8'hD0;
        8'h71: out_data = 8'h2C;
        8'h72: out_data = 8'h1E;
        8'h73: out_data = 8'h8F;
        8'h74: out_data = 8'hCA;
        8'h75: out_data = 8'h3F;
        8'h76: out_data = 8'h0F;
        8'h77: out_data = 8'h02;
        8'h78: out_data = 8'hC1;
        8'h79: out_data = 8'hAF;
        8'h7A: out_data = 8'hBD;
        8'h7B: out_data = 8'h03;
        8'h7C: out_data = 8'h01;
        8'h7D: out_data = 8'h13;
        8'h7E: out_data = 8'h8A;
        8'h7F: out_data = 8'h6B;
        // Line 8 of inv_s_box
        8'h80: out_data = 8'h3A;
        8'h81: out_data = 8'h91;
        8'h82: out_data = 8'h11;
        8'h83: out_data = 8'h41;
        8'h84: out_data = 8'h4F;
        8'h85: out_data = 8'h67;
        8'h86: out_data = 8'hDC;
        8'h87: out_data = 8'hEA;
        8'h88: out_data = 8'h97;
        8'h89: out_data = 8'hF2;
        8'h8A: out_data = 8'hCF;
        8'h8B: out_data = 8'hCE;
        8'h8C: out_data = 8'hF0;
        8'h8D: out_data = 8'hB4;
        8'h8E: out_data = 8'hE6;
        8'h8F: out_data = 8'h73;
        // Line 9 of inv_s_box
        8'h90: out_data = 8'h96;
        8'h91: out_data = 8'hAC;
        8'h92: out_data = 8'h74;
        8'h93: out_data = 8'h22;
        8'h94: out_data = 8'hE7;
        8'h95: out_data = 8'hAD;
        8'h96: out_data = 8'h35;
        8'h97: out_data = 8'h85;
        8'h98: out_data = 8'hE2;
        8'h99: out_data = 8'hF9;
        8'h9A: out_data = 8'h37;
        8'h9B: out_data = 8'hE8;
        8'h9C: out_data = 8'h1C;
        8'h9D: out_data = 8'h75;
        8'h9E: out_data = 8'hDF;
        8'h9F: out_data = 8'h6E;
        // Line 10 of inv_s_box (Line A)
        8'hA0: out_data = 8'h47;
        8'hA1: out_data = 8'hF1;
        8'hA2: out_data = 8'h1A;
        8'hA3: out_data = 8'h71;
        8'hA4: out_data = 8'h1D;
        8'hA5: out_data = 8'h29;
        8'hA6: out_data = 8'hC5;
        8'hA7: out_data = 8'h89;
        8'hA8: out_data = 8'h6F;
        8'hA9: out_data = 8'hB7;
        8'hAA: out_data = 8'h62;
        8'hAB: out_data = 8'h0E;
        8'hAC: out_data = 8'hAA;
        8'hAD: out_data = 8'h18;
        8'hAE: out_data = 8'hBE;
        8'hAF: out_data = 8'h1B;
        // Line 11 of inv_s_box (Line B)
        8'hB0: out_data = 8'hFC;
        8'hB1: out_data = 8'h56;
        8'hB2: out_data = 8'h3E;
        8'hB3: out_data = 8'h4B;
        8'hB4: out_data = 8'hC6;
        8'hB5: out_data = 8'hD2;
        8'hB6: out_data = 8'h79;
        8'hB7: out_data = 8'h20;
        8'hB8: out_data = 8'h9A;
        8'hB9: out_data = 8'hDB;
        8'hBA: out_data = 8'hC0;
        8'hBB: out_data = 8'hFE;
        8'hBC: out_data = 8'h78;
        8'hBD: out_data = 8'hCD;
        8'hBE: out_data = 8'h5A;
        8'hBF: out_data = 8'hF4;
        // Line 12 of inv_s_box (Line C)
        8'hC0: out_data = 8'h1F;
        8'hC1: out_data = 8'hDD;
        8'hC2: out_data = 8'hA8;
        8'hC3: out_data = 8'h33;
        8'hC4: out_data = 8'h88;
        8'hC5: out_data = 8'h07;
        8'hC6: out_data = 8'hC7;
        8'hC7: out_data = 8'h31;
        8'hC8: out_data = 8'hB1;
        8'hC9: out_data = 8'h12;
        8'hCA: out_data = 8'h10;
        8'hCB: out_data = 8'h59;
        8'hCC: out_data = 8'h27;
        8'hCD: out_data = 8'h80;
        8'hCE: out_data = 8'hEC;
        8'hCF: out_data = 8'h5F;
        // Line 13 of inv_s_box (Line D)
        8'hD0: out_data = 8'h60;
        8'hD1: out_data = 8'h51;
        8'hD2: out_data = 8'h7F;
        8'hD3: out_data = 8'hA9;
        8'hD4: out_data = 8'h19;
        8'hD5: out_data = 8'hB5;
        8'hD6: out_data = 8'h4A;
        8'hD7: out_data = 8'h0D;
        8'hD8: out_data = 8'h2D;
        8'hD9: out_data = 8'hE5;
        8'hDA: out_data = 8'h7A;
        8'hDB: out_data = 8'h9F;
        8'hDC: out_data = 8'h93;
        8'hDD: out_data = 8'hC9;
        8'hDE: out_data = 8'h9C;
        8'hDF: out_data = 8'hEF;
        // Line 14 of inv_s_box (Line E)
        8'hE0: out_data = 8'hA0;
        8'hE1: out_data = 8'hE0;
        8'hE2: out_data = 8'h3B;
        8'hE3: out_data = 8'h4D;
        8'hE4: out_data = 8'hAE;
        8'hE5: out_data = 8'h2A;
        8'hE6: out_data = 8'hF5;
        8'hE7: out_data = 8'hB0;
        8'hE8: out_data = 8'hC8;
        8'hE9: out_data = 8'hEB;
        8'hEA: out_data = 8'hBB;
        8'hEB: out_data = 8'h3C;
        8'hEC: out_data = 8'h83;
        8'hED: out_data = 8'h53;
        8'hEE: out_data = 8'h99;
        8'hEF: out_data = 8'h61;
        // Line 15 of inv_s_box (Line F)
        8'hF0: out_data = 8'h17;
        8'hF1: out_data = 8'h2B;
        8'hF2: out_data = 8'h04;
        8'hF3: out_data = 8'h7E;
        8'hF4: out_data = 8'hBA;
        8'hF5: out_data = 8'h77;
        8'hF6: out_data = 8'hD6;
        8'hF7: out_data = 8'h26;
        8'hF8: out_data = 8'hE1;
        8'hF9: out_data = 8'h69;
        8'hFA: out_data = 8'h14;
        8'hFB: out_data = 8'h63;
        8'hFC: out_data = 8'h55;
        8'hFD: out_data = 8'h21;
        8'hFE: out_data = 8'h0C;
        8'hFF: out_data = 8'h7D;
        default: out_data = 8'hXX;
    endcase 
end
endmodule
