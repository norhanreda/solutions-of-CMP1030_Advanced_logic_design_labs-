
module tb_bcd;
reg [7:0] bin;
wire [3:0] units;
wire [3:0] tens;
wire [3:0] hunds;
reg [8:0] i;

bcd uut (
 .bin(bin), 
 .units(units),
 .tens(tens),
 .hunds(hunds)
);
initial begin
 for(i=0;i<256;i=i+1)begin
   bin = i; 
   #10; 
 end 
$finish; 
end     
endmodule