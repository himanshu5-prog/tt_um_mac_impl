module mac_unit (
                input clk,
                input reset_n,
                input enable,
                input [7:0] a,
                input [7:0] b,
                output valid,
                output [15:0] c
                );

    reg [15:0] sum;
    reg val;

    assign c = sum;
    assign valid = val;

    always @(posedge clk) begin
        if (!reset_n) begin
            sum <= 16'b0000_0000_0000_0000;
            val <= 1'b0;
        end else if (enable) begin
            sum <= sum + (a*b);
            val <= 1'b1;
        end else begin
            sum <= 16'b0000_0000_0000_0000;
            val <= 1'b0;
        end

    end
endmodule