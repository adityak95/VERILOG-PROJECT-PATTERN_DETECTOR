`include"melay_non_over.v"
module tb;
parameter S_R=5'b00001;
parameter S_0=5'b00010;
parameter S_01=5'b00100;
parameter S_011=5'b01000;
parameter S_0110=5'b10000;

reg clk,rst,in,valid;
wire out;
integer count;

pattern dut(.*);
initial begin 
	clk=0;
	forever #5 clk=~clk;
end

initial begin 
	rst=1;
	count=0;
	reset();
	repeat(2)@(posedge clk);
	
	rst=0;
	repeat(1000)begin
		@(posedge clk);
		valid=1;
		in=$random;
		end	
	@(posedge clk);
	reset();
	$display("no of times pattern detected=%d",count);
end
task reset();
begin
	@(posedge clk);
	valid=0;
	in=0;
end
endtask

always@(posedge out)begin 
	count =count+1;
end

initial #9000 $finish;

endmodule

