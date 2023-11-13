module upcounter_testbench();
reg clkt, resett;
wire [11:0] countert;

up_counter dut(.clk(clkt), .reset(resett), .counter(countert));
initial begin 
clkt=0;
forever #5 clkt=~clkt;
end
initial begin
resett=1;
#20;
resett=0;
end
endmodule 