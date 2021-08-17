module half_adder(S,C,X,Y);
  input X,Y;
  output S,C;
  
  assign S= X ^ Y;
  assign C= X&Y;
endmodule

module full_adder_2bit (Sum, Carry, A, B, Cin);
input [1:0] A, B;
input Cin;
output [1:0] Sum;
output Carry;
  wire s1,c1,c2,s2,c3,c4,c5;
  half_adder ha1(s1,c1,A[0],Cin);
  half_adder ha2(Sum[0],c2,s1,B[0]);
  assign c4 = c1 | c2;
  half_adder ha3(s2,c3,c4,A[1]);
  half_adder h4(Sum[1],c5,s2,B[1]);
  assign Carry= c4|c5;
endmodule

module fa_tb;
reg [1:0] A, B;
reg Cin;
wire [1:0] Sum;
wire Carry;
  
  full_adder_2bit faa(Sum, Carry, A, B, Cin);
  initial
    begin
      A=2'b10;B=2'b11;Cin=1'b1;
      #10 $display("a=%d,b=%d,cin=%d,sum=%d,carry=%d",A,B,Cin,Sum,Carry);
    end
endmodule
