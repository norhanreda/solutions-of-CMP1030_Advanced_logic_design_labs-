module Integrated_multiplier(a,b,o1,o2,o3);
input [3:0]a,b;
output wire [6:0] o1,o2,o3;
wire [7:0]p;
wire [3:0] s1,s2,s3;
multiplier_4bit m0(a,b,p);
bcd u1(p,s1,s2,s3);
segment7 v1(s1,o1);
segment7 v2(s2,o2);
segment7 v3(s3,o3);
endmodule 