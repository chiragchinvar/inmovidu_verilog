module srlatch ( input S,
                 input R,
                 input En,
                 output reg Q,
                 output reg Qc);

always @(*) begin
  if (En) begin
    Q  =  ~(R | Qc); 
    Qc =  ~(S | Q); 
  end
end

endmodule
