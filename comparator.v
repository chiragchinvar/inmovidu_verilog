module comparator(A,B,agb,alb,aeb);
	input [3:0]A,B;
	output reg agb,alb,aeb;
	
	always @(*)
	begin
		if(A>B)
			begin
				agb=1;
				alb=0;
				aeb=0;
			end
		else if(A<B)
			begin
				agb=0;
				alb=1;
				aeb=0;
			end
		else
			begin
				agb=0;
				alb=0;
				aeb=1;
			end
	end
endmodule

module tb_comarator;
	reg [3:0]A,B;
	wire agb,alb,aeb;

comparator  utt(A,B,agb,alb,aeb);

	
	initial
		 begin
			A = 4'd10;
			B = 4'd9;
			#5 A = 4'd10;
			B = 4'd15;
			#5 A = 4'd7;
			B = 4'd7;
			#5 A = 4'd12;
			B = 4'd13;
			#5 A = 4'd5;
			B = 4'd3;
			#5 $finish;
		end
	always @(A,B)
	$monitor("%0t\t A=%b\t B=%b (a>b)=%b\t (a<b)=%b  (a=B)=%b",$time,A,B,agb,alb,aeb);

initial begin
	$dumpfile("dump.vcd");
	$dumpvars;
	end

endmodule
