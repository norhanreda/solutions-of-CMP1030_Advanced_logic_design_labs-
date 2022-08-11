module carry_select_adder(S, CH, A, B,i);
   output [15:0] S;   // The 16-bit sum.
   output 	CH;   // The 16-bit carry.
   input [15:0] 	A;   // The 16-bit augend.
   input [15:0] 	B;   // The 16-bit addend.
   input i;
   wire [3:0] 	S00;   // High nibble sum output with carry input 0.
   wire [3:0] 	S10;   // High nibble sum output with carry input 1.
   wire [3:0] 	S01;   
   wire [3:0] 	S11; 
   wire [3:0] 	S02;   
   wire [3:0] 	S12; 
   wire 	C00;   
   wire 	C10;   
   wire 	Clow; // Low nibble carry output used to select multiplexer output.
   wire         C1,C2,CH,i;
   ripple_carry_adder rc_low_nibble_0(S[3:0], Clow, A[3:0], B[3:0], 1'b0);  // Calculate S low nibble.
   ripple_carry_adder rc_high_nibble_00(S00, C00, A[7:4], B[7:4], 1'b0);       // Calcualte S high nibble with carry input 0.
   ripple_carry_adder rc_high_nibble_10(S10, C10, A[7:4], B[7:4], 1'b1);       // Calcualte S high nibble with carry input 1.
   multiplexer_2_1  muxs0(S[7:4], S00, S10, Clow);  // Clow selects the high nibble result for S.
   mux_bit1  muxc0(C1, C00, C10, Clow); // Clow selects the carry output.

   ripple_carry_adder rc_high_nibble_01(S01, C01, A[11:8], B[11:8], 1'b0);       // Calcualte S high nibble with carry input 0.
   ripple_carry_adder rc_high_nibble_11(S11, C11, A[11:8], B[11:8], 1'b1);       // Calcualte S high nibble with carry input 1.
   multiplexer_2_1  muxs1(S[11:8], S01, S11, C1);  // Clow selects the high nibble result for S.
   mux_bit1  muxc1(C2, C01, C11, C1); // Clow selects the carry output.
  
  ripple_carry_adder rc_high_nibble_02(S02, C02, A[15:12], B[15:12], 1'b0);       // Calcualte S high nibble with carry input 0.
   ripple_carry_adder rc_high_nibble_12(S12, C12, A[15:12], B[15:12], 1'b1);       // Calcualte S high nibble with carry input 1.
   multiplexer_2_1  muxs2(S[15:12], S02, S12, C2);  // Clow selects the high nibble result for S.
   mux_bit1  muxc2(CH, C02, C12, C2); // Clow selects the carry output.

endmodule // carry_select_adder

module ripple_carry_adder(S, C, A, B, Cin);
   output [3:0] S;   // The 4-bit sum.
   output 	C;   // The 1-bit carry.
   input [3:0] 	A;   // The 4-bit augend.
   input [3:0] 	B;   // The 4-bit addend.
   input 	Cin; // The carry input.
 	
   wire 	C0; // The carry out bit of fa0, the carry in bit of fa1.
   wire 	C1; // The carry out bit of fa1, the carry in bit of fa2.
   wire 	C2; // The carry out bit of fa2, the carry in bit of fa3.
	
   full_adder fa0(S[0], C0, A[0], B[0], Cin);    // Least significant bit.
   full_adder fa1(S[1], C1, A[1], B[1], C0);
   full_adder fa2(S[2], C2, A[2], B[2], C1);
   full_adder fa3(S[3], C, A[3], B[3], C2);    // Most significant bit.
endmodule // ripple_carry_adder

module full_adder(S, Cout, A, B, Cin);
   output S;
   output Cout;
   input  A;
   input  B;
   input  Cin;
   
   wire   w1;
   wire   w2;
   wire   w3;
   wire   w4;
   
   xor(w1, A, B);
   xor(S, Cin, w1);
   and(w2, A, B);   
   and(w3, A, Cin);
   and(w4, B, Cin);   
   or(Cout, w2, w3, w4);
endmodule // full_adder

module multiplexer_2_1(X, A0, A1, S);
   parameter WIDTH=4;     // How many bits wide are the lines

   output [WIDTH-1:0] X;   // The output line

   input [WIDTH-1:0]  A1;  // Input line with id 1'b1
   input [WIDTH-1:0]  A0;  // Input line with id 1'b0
   input 	      S;  // Selection bit
   
   assign X = (S == 1'b0) ? A0 : A1;
endmodule // multiplexer_2_1

module mux_bit1(x,p0,p1,se);
input p0,p1,se;
output x;
assign x=(se==0)?p0:p1;
endmodule
