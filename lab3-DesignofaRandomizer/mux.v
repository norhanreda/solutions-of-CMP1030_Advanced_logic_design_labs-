
module mux(out,select,in1, in2 );
input in1, in2, select;
output out;
assign out = select ? in1 : in2;
endmodule 

