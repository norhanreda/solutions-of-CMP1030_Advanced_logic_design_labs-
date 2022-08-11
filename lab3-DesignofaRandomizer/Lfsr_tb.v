
module selfcheck_tb;
reg clk;
reg rst;
reg e;
reg [14:0] seed;
reg Din;
wire z;
reg load;
wire q;
integer i;
integer failures;
integer success;
reg [95:0]DataIn;
reg [95:0]DataOut;
lfsr L(q,z,Din, clk, rst,seed, load,e);
initial
begin
failures=0;
success=0;
clk = 0;
rst=0;
  
   seed=15'b011011100010101;
   
  #5 load=1;
    e=1;
 
   
//#5 DataIn=96'b101011001011110011010010000100010100110110101110000101010111011111000110110110111111010011001001;
//#5 DataOut=96'b010101011000101011000100101001010011101000010111001001001110000101100011101011000010101111111001;
 
 DataIn=96'b10010011001011111101101101100011111011101010100001110101101100101000100001001011001111010011010101;
 DataOut=96'b100111111101010000110101110001101000011100100100111010000101110010100101001000110101000110101010;
for(i=0;i<96;i=i+1)begin
       
     #5 Din=DataIn[i];
     #5 load=0;
    
if(q==DataOut[i])begin
       $display("%d, Success",i);
      success=success+1;
   end
   else begin
       $display("%d,Failure",i);

       failures = failures + 1;
      
end
end
#5 $finish;
end
always
#5 clk = !clk;
endmodule











/*module lfsrtst;
reg clk;
reg rst;
reg e;
reg [14:0] seed;
reg Din;
reg load;
wire q;
integer i;
reg [95:0]DataIn;
lfsr L(q,Din, clk, rst,seed, load,e);
initial
begin
$display ("time clk reset enable datain dataout");
$monitor ("%g %b %b %b %b %b",$time,clk,rst,e,Din,q);
e=1;
clk = 0;
rst = 0;
seed=0;
load=0;
#10 rst=1;
#10 rst=0;
 
 load = 0;
#5 rst=0;
#50 seed = 15'b011011100010101;
#100 DataIn=96'b101011001011110011010010000100010100110110101110000101010111011111000110110110111111010011001001;
#50 load=1;
for(i=95;i>=0;i=i-1)begin
#5 Din=DataIn[i];
end
#10 $finish ;
end
always
#5 clk = !clk;

endmodule*/
