module bin_to_gray(B,G);
	input [3:0] B;
	output [3:0] G;
	assign G[0] = B[1]^B[0];
	assign G[1] = B[2]^B[1];
	assign G[2] = B[3]^B[2];
	assign G[3] = B[3];
endmodule

module tb_bin_to_gray();
	reg [3:0] b;
	wire [3:0] g;
	bin_to_gray bg1 (.B(b), .G(g));
	initial begin 
		b = 3'b000;
		#96 $finish;
	end
	always #6 b = b + 3'b001;
	always @(g)
		$display( "time =%0t \tINPUT: B = %b OUTPUT: G=%b",$time,b,g);
  initial
    begin
      $dumpfile("b2g.vcd");
      $dumpvars;
     
    end
endmodule
