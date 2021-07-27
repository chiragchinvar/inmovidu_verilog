module srff(sr, clk, q);
	input clk;
	input [1:0]sr;
	output reg q;
	always @(posedge clk)
	begin
	case (sr)
		2'b00:  q = q;
		2'b01:  q = 1'b0;
		2'b10:  q = 1'b1;
		default:q = 1'bZ;
	endcase
	end
endmodule

module tb_srff;
	reg clk;
	wire q;
	reg [1:0]sr;
	srff sr1(.clk(clk), .sr(sr), .q(q));
	initial begin
		clk = 0;
		sr = 2'b00;
		forever #10 clk = ~clk;
      
	end
	always #10 sr = sr + 2'b01;
	always @(clk)
		$display( "INPUT: clk=%b s=%b r=%b \t OUTPUT: q=%b qb=%b",clk, sr[1], sr[0], q, ~q);
 initial
    begin
      $monitor("input=%d,select=%d,output=%d",I,S,D);
      $dumpfile("mux.vcd");
      $dumpvars;
      #20 $finish;
    end
endmodule
