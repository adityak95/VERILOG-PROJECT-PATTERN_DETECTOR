`include"melay_overlping.v"
module tb;
parameter S_R=5'b00001;
parameter S_1=5'b00010;
parameter S_10=5'b00100;
parameter S_100=5'b01000;
parameter S_1001=5'b10000;

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
	repeat(500)begin
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

initial #2000 $finish;

endmodule

