module lfsr(q,z,Din, clk, rst, seed, load, e);
output q;
output z;
input [0:14] seed;
input load;
input rst;
input Din;
input clk;
input e;
wire nextbit;
wire [0:14] state_out;
wire [0:14] state_in;
xor(nextbit,state_out[13],state_out[14]);
mux M1[0:14] (state_in, load, seed,{nextbit,state_out[0:13]});
flipflop F[0:14] (state_out, clk, rst, state_in,e);

assign z=nextbit;
xor g(q,nextbit,Din);
 
endmodule
