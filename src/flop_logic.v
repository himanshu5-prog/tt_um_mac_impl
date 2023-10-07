module flop_logic ( 
    input clk,
    input reset_n,
    input enable,
    input [7:0] a,
    output [7:0] out
);

    always@(posedge clk) begin
        if (!reset_n) begin
            out <= 8'b0000_0000;
        end else if (enable) begin
            out <= a;
        end else 
            out <= a;
    end

endmodule