`timescale 1ns / 1ps
module tb;
    reg clk;
    reg rst;
    wire [3:0] count;
    counter counter0(.clk(clk), .rst(rst), .count(count));
    always #5 clk = ~clk;
    initial
    begin
        clk = 0;
        rst = 1;
        #10;
        rst = 0;
        #100; 
        rst = 1;
        #10; 
        rst = 0;
        #100;
        $stop;
    end
    initial begin
        $monitor($time, " clk=%b rst=%b count=%b", clk, rst, count);    
    end

endmodule