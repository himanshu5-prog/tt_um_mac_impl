module tt_um_mac_unit (
    input clk,
    input rst_n, 
    input ena,
    input  wire [7:0] ui_in,    // Dedicated inputs - connected to the input switche
    input  wire [7:0] uio_in,   // IOs: Bidirectional Input path
    output wire [7:0] uo_out,   // Dedicated outputs - connected to the 7 segment display
    output wire [7:0] uio_out,  // IOs: Bidirectional Output path
    output wire [7:0] uio_oe   // IOs: Bidirectional Enable path (active high: 0=input, 1=output)
);

    assign uio_oe  = 8'b11111111;
    assign uio_out = 8'b00000000;
    assign uo_out = out[15:8];    
    wire [15:0] out;
    wire valid;
    wire [7:0] a_pipe;
    wire [7:0] b_pipe;
    wire valid_pipe;

    flop_logic dut_2 (.clk(clk), .reset_n(rst_n), .enable(ena), .a(ui_in), .out(a_pipe));
    flop_logic dut_3 (.clk(clk), .reset_n(rst_n), .enable(ena), .a(uio_in), .out(b_pipe));

    mac_unit dut_1 (.clk(clk), .reset_n(rst_n), .enable(ena), .a(a_pipe), .b(b_pipe), .valid(valid), .c(out));

    flop_logic_one_bit dut_4 (.clk(clk), .reset_n(rst_n), .enable(ena), .a(valid), .out(valid_pipe));

endmodule
