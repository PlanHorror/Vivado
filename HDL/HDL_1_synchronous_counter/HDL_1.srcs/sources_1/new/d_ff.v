module d_ff(
    input d,
    input clk,
    input rst,
    output reg q
    );
    always @(posedge clk) begin
        if (rst) begin
            q <= 1'b0;
        end
        else begin
            q <= d;
        end
    end
endmodule
// endmodule
// Compare this snippet from HDL_1.srcs/sources_1/new/tb.v: