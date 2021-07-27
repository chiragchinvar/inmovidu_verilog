module tffmod(t, clk, q);
input t;
input clk;
output q;
reg q;
initial q<=1'b0;
always @(posedge clk)
q<=q^t;
endmodule

module tflipflopt_b;
reg t;
reg clk;
wire q;
tffmod uut (.t(t),.clk(clk),.q(q));
initial begin
t = 0;
clk = 0;
#100;
end
always #3 clk=~clk;
always #5 t=~t;
initial #100 $finish;
  initial
    begin
      $monitor("input=%d,output=%d",t,q);
      $dumpfile("tff.vcd");
      $dumpvars;
     
    end

endmodule
