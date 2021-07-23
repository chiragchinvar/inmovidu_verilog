module halfadder(sum,co,a,b,c);
  input a,b,c;
  output sum,co;
  assign sum=a^b^c;
  assign co=(a&b)|(b&c)|(c&a);
endmodule

module ha_tb;
  reg a,b,c;
  wire sum,co;
  halfadder h1(sum,co,a,b,c);
  initial
    begin
      a=0;b=0;c=0;
      #5 a=0;b=1;c=1;
      #5 a=1;b=0;c=0;
      #5 a=1;b=1;c=1;
    end
  initial
    begin
      $monitor("a=%d,b=%d,cin=%d,sum=%d,carry=%d",a,b,c,sum,co);
      $dumpfile("adder.vcd");
      $dumpvars;
      #20 $finish;
    end
endmodule
