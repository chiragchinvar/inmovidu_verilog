module mux8_1 (I, S, D);
input [7:0] I;
input [2:0] S;
output D;
reg D;
always @ (I, S)
begin
case(S)
3'd0: D=I[0];
3'd1: D=I[1];
3'd2: D=I[2];
3'd3: D=I[3];
3'd4: D=I[4];
3'd5: D=I[5];
3'd6: D=I[6];
3'd7: D=I[7];
default: D=1'BZ;
endcase
end
endmodule

module mux_tb;
  reg [7:0] I;
reg [2:0] S;
wire D;
  mux8_1 M1(I,S,D);
  initial
    begin
      I=8'B00010111;
      #5 S=3'B011;
    end
  initial
    begin
      $monitor("input=%d,select=%d,output=%d",I,S,D);
      $dumpfile("mux.vcd");
      $dumpvars;
      #20 $finish;
    end
endmodule
