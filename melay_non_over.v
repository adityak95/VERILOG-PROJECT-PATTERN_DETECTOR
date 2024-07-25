module pattern(clk,rst,in,valid,out);            //01101
parameter S_R=5'b00001;
parameter S_0=5'b00010;
parameter S_01=5'b00100;
parameter S_011=5'b01000;
parameter S_0110=5'b10000;

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
							next_state=S_0;
						end
						else begin 
							out=0;
							next_state=S_R;
						end
					end
					S_0:begin 
						if(in)begin 
							out=0;
							next_state=S_01;
						end
						else begin 
							out=0;
							next_state=S_R;
						end
					end
					S_01:begin 
						if(in)begin 
							out=0;
							next_state=S_011;
						end
						else begin 
							out=0;
							next_state=S_R;
						end
					end
					S_011:begin 
						if(in)begin 
							out=0;
							next_state=S_R;
						end
						else begin 
							out=0;
							next_state=S_0110;
						end
					end
					S_0110:begin 
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
