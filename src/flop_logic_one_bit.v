module flop_logic_one_bit ( 
    input clk,
    input reset_n,
    input enable,
    input reg a,
    output out
);

    always@(posedge clk) begin
        if (!reset_n) begin
            out <= 1'b0;
        end else if (enable) begin
            out <= a;
        end else 
            out <= a;
    end

endmodule