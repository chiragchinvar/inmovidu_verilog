module ShiftRegister_SIPO(C, SI, PO);
input C,SI;
output [7:0] PO;
reg [7:0] tmp;

always @(posedge C)
begin
tmp = {tmp[6:0], SI};
end
assign PO = tmp;
endmodule


module tb;
  reg C,SI;
wire[7:0] PO;
  ShiftRegister_SIPO a(C, SI, PO);
  
  always @(posedge C)
    begin
      SI=1;
      #5 SI=0;
      #5 SI=0;
      #5 SI=0;
      #5 SI=1;
    end
  initial
    begin
    C=0;
  forever #10 C=~C;
  end
  
  initial
    begin
      $monitor("clk=%d,input=%d,output=%d",C,SI,PO);
      $dumpfile("SIPO.vcd");
      $dumpvars;
      #200 $finish;
    end
endmodule
