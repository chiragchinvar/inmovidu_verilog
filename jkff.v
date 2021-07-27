module jkff(jk, clk, q, qb);
	input clk;
	input [1:0]jk;
	output reg q,qb;
	always @(posedge clk)
	begin
	case(jk)
		2'b00:q=q;
		2'b01:q=1'b0;
		2'b10:q=1'b1;
		2'b11:q= ~q;
		default:q=1'bZ;
	endcase
	qb=~q;
	end
endmodule

module tb_jkff();
	reg clk;
	reg[1:0] jk;
	wire q, qb;
	jkff jk1(.jk(jk), .clk(clk), .q(q), .qb(qb));
	initial begin
		clk = 0;
		jk = 2'b00;
		forever #10 clk = ~clk;
	end
	always #10 jk[0] = ~jk[0];
	always #20 jk[1] = ~jk[1];
	always @(jk)
		$display( "time =%0t \tINPUT: clk=%b j=%b k=%b \t OUTPUT: q=%b qb=%b",$time,clk, jk[1], jk[0], q, qb);

  initial
    begin
      $dumpfile("jk.vcd");
      $dumpvars;
      #50 $finish;
    end
  
endmodule
