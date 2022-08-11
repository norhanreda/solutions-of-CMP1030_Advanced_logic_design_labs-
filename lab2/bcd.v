module bcd(
input[7:0] bin,
output reg [3:0] units,
output reg [3:0] tens,
output reg [3:0] hunds
);
integer i;
always @(bin)begin
 units=4'b0;
 tens=4'b0;
 hunds=4'b0;
 for(i=7;i>=0;i=i-1)begin
  if(units>=4'b0101)begin
     units=units+4'b0011;
  end
  if(tens >=4'b0101)begin
     tens=tens+4'b0011;
  end
  if(hunds >=4'b0101)begin
     hunds=hunds+4'b0011;
  end
  hunds=hunds<<1;
  hunds[0]=tens[3];
  tens=tens<<1;
  tens[0]=units[3];
  units=units<<1;
  units[0]=bin[i];
 end 
end
endmodule
