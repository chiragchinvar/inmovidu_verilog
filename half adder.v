module halfadder(sum,co,a,b);
  input a,b;
  output sum,co;
  assign sum=a^b;
  assign co=a&b;
endmodule

module ha_tb;
  reg a,b;
  wire sum,co;
  halfadder h1(sum,co,a,b);
  initial
    begin
      a=0;b=0;
      #5 a=0;b=1;
      #5 a=1;b=0;
      #5 a=1;b=1;
    end
  initial
    begin
      $monitor("a=%d,b=%d,sum=%d,carry=%d",a,b,sum,co);
      $dumpfile("adder.vcd");
      $dumpvars;
      #20 $finish;
    end
endmodule
