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
        end 
    		else
              begin
                sum <= 16'b0000_0000_0000_0000;
                val <= 1'b0;
                
              end
    end
endmodule

module tb();
  reg clk;
  reg reset_n;
  reg enable;
  reg [7:0] a;
  reg [7:0] b;
  wire valid;
  wire [15:0] c;
  
  mac_unit dut (
    .clk(clk),
    .reset_n(reset_n),
    .enable(enable),
    .a(a),
    .b(b),
    .valid(valid),
    .c(c)
  );
  
   initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1);
  end
  
  initial
    begin
  		clk = 1'b0;
      	
      forever begin
        #10 clk = ~clk;
      end
      
    end
  
  initial
    #200 $finish;
  
  
  initial
    begin
      reset_n = 1'b0;
      enable = 1'b0;
      a = 8'b0000_0000;
      b = 8'b0000_0000;
      
      #12 
      	reset_n = 1'b1;
      	enable = 1'b1;
      	a = 8'b0000_0010;
      	b = 8'b0000_0010;
      
      #20 enable = 1'b0;
    end
endmodule