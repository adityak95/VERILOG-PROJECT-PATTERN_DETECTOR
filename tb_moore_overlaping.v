`include"moore_overlaping.v"
module tb;
parameter S_R=6'b000001;
parameter S_1=6'b000010;
parameter S_10=6'b000100;
parameter S_100=6'b001000;
parameter S_1001=6'b010000;
parameter S_10010=6'b100000;

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
	valid=0;
	in=0;
end
endtask

always@(posedge out)begin 
	count =count+1;
end

initial #9000 $finish;

endmodule

