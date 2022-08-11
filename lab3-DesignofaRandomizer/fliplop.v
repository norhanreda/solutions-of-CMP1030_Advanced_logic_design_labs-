module flipflop(q, clk, rst, d,e);
input clk;
input rst;
input d;
input e;
output q;
reg q;
wire c;
and (c,clk,e);
always @(posedge clk or posedge rst)
begin
if (rst==1)
q<=0;
else //if(e==1)
q<=d;
end
endmodule
