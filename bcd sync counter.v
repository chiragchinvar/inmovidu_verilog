module Asyncnt_bcd(clk, rst, bcd_out);
input clk, rst;
output [3:0] bcd_out;
reg [3:0] temp;
assign bcd_out=temp;
always @ (posedge clk or posedge rst)
begin
if(rst)
begin
temp<=4'b0000;
end
else
begin
temp<=temp+1'b1;
if(temp==4'b1001)
temp<=4'b0000;
end
end
endmodule
