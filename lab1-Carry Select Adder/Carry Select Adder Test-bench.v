module carrysumadder_tb();
reg [15:0] A,B;
wire [15:0] Sum;
wire CH;
reg i;
carry_select_adder U_adder(
Sum,CH,A,B,i

);

 

initial begin
A=0;
B=0;
i=0;
$display("time\t sum carry");
$monitor("%g\t %d %d",$time,Sum[15:0],CH);
  #5 A=16'd999; B=16'd120; 
  #5 A=16'd155; B=16'd155; 

  #5 A=16'd120; B=16'd16; 
  #5 A=16'd500; B=16'd501; 
  
  #5 A=16'd622; B=16'd260;
  #5 A=16'd50; B=16'd550;
 
  #5 A=16'd15; B=16'd15; 
  #5 A=16'd99; B=16'd59;
  #5 A=16'd20; B=16'd30;

  #5 A=16'd24; B=16'd20; 
  #5 A=16'd4100; B=16'd4250; 
  #5 A=16'd3620; B=16'd3620;

  
  #5 A=16'd6200; B=16'd6222; 
  #5 A=16'd65535; B=16'd1; 

  #10 $finish;
end



endmodule
