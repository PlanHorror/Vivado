
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/22/2025 09:57:38 PM
// Design Name: 
// Module Name: counter
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


module counter(
    input clk,
    input rst,
    output [3:0] count
    );
    wire [3:0] d;
    wire [3:0] q;
    assign d = q + 1;
    d_ff dff3(.d(d[3]), .clk(clk), .q(q[3]), .rst(rst));
    d_ff dff2(.d(d[2]), .clk(clk), .q(q[2]), .rst(rst));
    d_ff dff1(.d(d[1]), .clk(clk), .q(q[1]), .rst(rst));
    d_ff dff0(.d(d[0]), .clk(clk), .q(q[0]), .rst(rst));
    
    
    
    assign count = q;
endmodule
