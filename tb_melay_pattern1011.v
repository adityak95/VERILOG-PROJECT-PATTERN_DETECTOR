`include"melay_pattern1011.v"
module tb;
parameter S_R=4'b0001;
parameter S_1=4'b0010;
parameter S_10=4'b0100;
parameter S_101=4'b1000;

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

