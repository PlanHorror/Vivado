`timescale 1ns/ 10ps
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
//    $strobe("Time %0t: [Strobe ] clk=%b rst=%b count=%b", $time, clk, rst, count);
//    #5; 
//    $display("Time %0t: [Display ] clk=%b rst=%b count=%b", $time, clk, rst, count);
//    $strobe("Time %0t: [Strobe ] clk=%b rst=%b count=%b", $time, clk, rst, count);

//    #5;  
//    $display("Time %0t: [Display ] clk=%b rst=%b count=%b", $time, clk, rst, count);
//    $strobe("Time %0t: [Strobe ] clk=%b rst=%b count=%b", $time, clk, rst, count);

    #10;
    $display("Display function: At %0t result: clk=%b, rst=%b, count=%b", $time, clk, rst, count);
    #20;
    $display("Display function: At %0t result: clk=%b rst=%b count=%b", $time, clk, rst, count);
    #70;
    $display("Display function: At %0t result: clk=%b rst=%b count=%b", $time, clk, rst, count);
    #10;
    $display("Display function: At %0t result: clk=%b rst=%b count=%b", $time, clk, rst, count);
//    $strobe("Time %0t: [Strobe] clk=%b rst=%b count=%b", $time, clk, rst, count);
    end

endmodule