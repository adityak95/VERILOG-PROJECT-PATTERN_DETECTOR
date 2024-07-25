module pattern(clk,rst,in,valid,out);            //10010
parameter S_R=5'b00001;
parameter S_1=5'b00010;
parameter S_10=5'b00100;
parameter S_100=5'b01000;
parameter S_1001=5'b10000;

input clk,rst,in,valid;
output reg out;

reg [4:0]present_state,next_state;

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
							next_state=S_1;
						end
						else begin 
							out=0;
							next_state=S_100;
						end
					end
					S_100:begin 
						if(in)begin 
							out=0;
							next_state=S_1001;
						end
						else begin 
							out=0;
							next_state=S_R;
						end
					end
					S_1001:begin 
						if(in)begin 
							out=0;
							next_state=S_1;
						end
						else begin 
							out=1;
							next_state=S_10;
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
