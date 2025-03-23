`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/21/2025 07:17:41 PM
// Design Name: 
// Module Name: KeyExpansion
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


module KeyExpansion(
    input [127:0] old_key,
    input [3:0] round,
    output reg [127:0] new_key
);
    reg [7:0] old_word[3:0][3:0];
    reg [7:0] new_word[3:0][3:0];
    reg [7:0] rcon;
    wire [7:0] sbox_out1, sbox_out2, sbox_out3, sbox_out4;
    // Sbox range
    SBox SBox_0(
        .in_data(old_word[3][0]),
        .out_data(sbox_out1)
    );
    SBox SBox_1(
        .in_data(old_word[3][1]),
        .out_data(sbox_out2)
    );
    SBox SBox_2(
        .in_data(old_word[3][2]),
        .out_data(sbox_out3)
    );
    SBox SBox_3(
        .in_data(old_word[3][3]),
        .out_data(sbox_out4)
    );
    always @(old_key,round,sbox_out1,sbox_out2,sbox_out3,sbox_out4) begin
        old_word[0][0] = old_key[127:120];
        old_word[0][1] = old_key[119:112];
        old_word[0][2] = old_key[111:104];
        old_word[0][3] = old_key[103:96];
        old_word[1][0] = old_key[95:88];
        old_word[1][1] = old_key[87:80];
        old_word[1][2] = old_key[79:72];
        old_word[1][3] = old_key[71:64];
        old_word[2][0] = old_key[63:56];
        old_word[2][1] = old_key[55:48];
        old_word[2][2] = old_key[47:40];
        old_word[2][3] = old_key[39:32];
        old_word[3][0] = old_key[31:24];
        old_word[3][1] = old_key[23:16];
        old_word[3][2] = old_key[15:8];
        old_word[3][3] = old_key[7:0];
        case(round)
            1:rcon = 8'h01;
            2:rcon = 8'h02;
            3:rcon = 8'h04;
            4:rcon = 8'h08;
            5:rcon = 8'h10;
            6:rcon = 8'h20;
            7:rcon = 8'h40;
            8:rcon = 8'h80;
            9:rcon = 8'h1b;
            10:rcon = 8'h36;
        endcase
        if(round>0 && round<11)
        begin
            // // RotWord
            // new_word[0][0] = old_word[0][1];
            // new_word[0][1] = old_word[0][2];
            // new_word[0][2] = old_word[0][3];
            // new_word[0][3] = old_word[0][0];
            // SubWord
            new_word[0][0] = sbox_out2;
            new_word[0][1] = sbox_out3;
            new_word[0][2] = sbox_out4;
            new_word[0][3] = sbox_out1;

            // Rcon
            new_word[0][0] = new_word[0][0]^rcon;
            // XOR
            new_word[0][0] = new_word[0][0]^old_word[0][0];
            new_word[0][1] = new_word[0][1]^old_word[0][1];
            new_word[0][2] = new_word[0][2]^old_word[0][2];
            new_word[0][3] = new_word[0][3]^old_word[0][3];
            new_word[1][0] = new_word[0][0]^old_word[1][0];
            new_word[1][1] = new_word[0][1]^old_word[1][1];
            new_word[1][2] = new_word[0][2]^old_word[1][2];
            new_word[1][3] = new_word[0][3]^old_word[1][3];
            new_word[2][0] = new_word[1][0]^old_word[2][0];
            new_word[2][1] = new_word[1][1]^old_word[2][1];
            new_word[2][2] = new_word[1][2]^old_word[2][2];
            new_word[2][3] = new_word[1][3]^old_word[2][3];
            new_word[3][0] = new_word[2][0]^old_word[3][0];
            new_word[3][1] = new_word[2][1]^old_word[3][1];
            new_word[3][2] = new_word[2][2]^old_word[3][2];
            new_word[3][3] = new_word[2][3]^old_word[3][3];
        end
        else
        if(round==0)
        begin
            new_word[0][0] = old_word[0][0];
            new_word[0][1] = old_word[0][1];
            new_word[0][2] = old_word[0][2];
            new_word[0][3] = old_word[0][3];
            new_word[1][0] = old_word[1][0];
            new_word[1][1] = old_word[1][1];
            new_word[1][2] = old_word[1][2];
            new_word[1][3] = old_word[1][3];
            new_word[2][0] = old_word[2][0];
            new_word[2][1] = old_word[2][1];
            new_word[2][2] = old_word[2][2];
            new_word[2][3] = old_word[2][3];
            new_word[3][0] = old_word[3][0];
            new_word[3][1] = old_word[3][1];
            new_word[3][2] = old_word[3][2];
            new_word[3][3] = old_word[3][3];
        end
        new_key = {new_word[0][0],new_word[0][1],new_word[0][2],new_word[0][3],new_word[1][0],new_word[1][1],new_word[1][2],new_word[1][3],new_word[2][0],new_word[2][1],new_word[2][2],new_word[2][3],new_word[3][0],new_word[3][1],new_word[3][2],new_word[3][3]};
    end
endmodule
