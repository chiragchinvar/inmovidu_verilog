module syncbinary (clk, rst, q);
	input clk, rst;
	output reg[3:0]q;
	initial q = 4'B0000;
	always @ (posedge clk)
	begin
	if (rst == 1'B1)
		q = 4'B0000;
	else
		q = q + 1;
	end
endmodule

module tb_4_bit_syncbin;
	reg clk, rst;
	wire[3:0] q;
	syncbinary sb1(.clk(clk), .rst(rst), .q(q));
	initial begin
		clk = 0;
		rst = 0;
		#350 $finish;
	end
	always #10 clk = ~clk;
	always #330 rst = 1;
	always @(clk)
		$monitor( "time =%0t \tINPUT: clk=%b rst=%b \t OUTPUT: q=%b",$time,clk, rst, q);
  initial
    begin
      $dumpfile("syncbinary.vcd");
      $dumpvars;
      
    end
endmodule
