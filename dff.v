module dff(d, rst, clk, q, qb);
input d, rst, clk;
output q, qb;
reg q, qb;
always @(posedge clk or posedge rst)
begin
if (rst == 1'b1)
begin
q <= 1'b0; 
qb <= 1'b1;
end
else
begin 
q <= d; qb <= ~q;
end
end
endmodule
module tb_dff();
reg d;
reg clk;
reg rst;
wire q;

dff dut(d,rst,clk,q,qb);

initial begin
  clk=0;
     forever #10 clk = ~clk;  
end 
initial begin 
 rst=1;
 d = 0;
 #20;
 
 rst=0;
 d = 1;
 #10;
 d = 0;
 #10;
 d = 1;
end 
   initial
    begin
      $monitor("clock=%d,input=%d,output=%d",clk,d,q);
      $dumpfile("dff.vcd");
      $dumpvars;
      #50 $finish;
    end
endmodule
