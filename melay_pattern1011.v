module pattern(clk,rst,in,valid,out);            //1011
parameter S_R=4'b0001;
parameter S_1=4'b0010;
parameter S_10=4'b0100;
parameter S_101=4'b1000;

input clk,rst,in,valid;
output reg out;

reg [3:0] present_state;
reg [3:0] next_state;

always@(posedge clk)begin
		if(rst)begin
			out=0;
			present_state=S_R;
			next_state=S_R;
		end
		else begin
			if(valid)begin
				case(present_state)
					S_R:begin
						if(in)begin
							out=0;
							next_state=S_1;
						end
						else begin
							out=0;
							next_state=S_R;
						end
					end
					S_1:begin
						if(in)begin
							out=0;
							next_state=S_1;
						end
						else begin
							out=0;
							next_state=S_10;
						end
					end
					S_10:begin
						if(in)begin
							out=0;
							next_state=S_101;
						end
						else begin
							out=0;
							next_state=S_R;
						end
					end
					S_101:begin
						if(in)begin
							out=1;
							next_state=S_R;
						end
						else begin
							out=0;
							next_state=S_R;
						end
					end
				endcase
			end

		end
end

always@(next_state)begin
	present_state=next_state;
end

endmodule

