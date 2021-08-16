module not_cmos (x,y);
  input x;
  output y;
  wire vdd,gnd;
  assign vdd=1'b1;
  assign gnd=1'b0;
  
  //drain,source,gate
  pmos p1(y,vdd,x);
  nmos n1(y,gnd,x);
  
endmodule

module invr_tb;
reg x1;
wire y1;
not_cmos inv1 (x1,y1);
initial begin
x1 = 1'b0; #1
x1 = 1'b1; #2
$finish;
end
  initial
    $monitor("input=%D,output=%d",x1,y1);
  
endmodule
