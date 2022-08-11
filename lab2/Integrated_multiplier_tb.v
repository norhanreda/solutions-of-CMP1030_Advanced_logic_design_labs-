module Integrated_multiplier_tb();

reg [3:0] a,b;
wire [6:0] o1,o2,o3;
Integrated_multiplier uut(a,b,o1,o2,o3);
initial 
begin
 
 #5 a=0 ;   b=0;
 #5 a=1 ;   b=1;
 #5 a= 5;   b=4;
 #5 a= 1;   b=2;
 #5 a=3 ;   b=5;
 #5 a= 15;  b=8;
 #5 a=60;   b=2;
 #5 a=11;   b=2;
 #5 a=14;   b=2;
 #5 a=10;   b=15;
 #5 a=15;   b=15;




#10 $finish;
end
endmodule 
