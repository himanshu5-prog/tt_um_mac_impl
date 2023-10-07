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

    reg [7:0] a_flop_out;
    reg [7:0] b_flop_out;
    reg [7:0] out_ff;
    // Flop for port a
    always @(posedge clk) begin
        if (!reset_n) 
            a_flop_out <= 8'b0000_0000;
        else if (ena)
            a_flop_out <= a;
        else
            a_flop_out <= a_flop_out;
    end

    //Flop for port b
     always @(posedge clk) begin
        if (!reset_n) 
            b_flop_out <= 8'b0000_0000;
        else if (ena)
            b_flop_out <= b;
        else
            b_flop_out <= b_flop_out;
    end

    //Flop for output
    always @(posedge clk) begin
        if (!reset_n) 
            out_ff <= 8'b0000_0000;
        else if (ena)
            out_ff <= sum;
        else
            out_ff <= out_ff;
    end
    //-------------------------------
    assign c = out_ff;
    assign valid = val;

    always @(posedge clk) begin
        if (!reset_n) begin
            sum <= 16'b0000_0000_0000_0000;
            val <= 1'b0;
        end else if (enable) begin
            sum <= sum + (a_flop_out*b_flop_out);
            val <= 1'b1;
        end else begin
            sum <= 16'b0000_0000_0000_0000;
            val <= 1'b0;
        end

    end
endmodule