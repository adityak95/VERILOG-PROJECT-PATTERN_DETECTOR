module pattern(clk,rst,in,valid,out); //10010
parameter S_R=6'b000001;
parameter S_1=6'b000010;
parameter S_10=6'b000100;
parameter S_100=6'b001000;
parameter S_1001=6'b010000;
parameter S_10010=6'b100000;

input clk,rst,in,valid;
output reg out;

reg [5:0] present_state,next_state;

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
						out=0;
						if(in)begin 
							next_state=S_1;
						end
						else begin 
							next_state=S_R;
						end
					end
					S_1:begin 
						out=0;
						if(in)begin 
							next_state=S_1;
						end
						else begin 
							next_state=S_10;
						end
					end
					S_10:begin 
						out=0;
						if(in)begin 
							next_state=S_1;
						end
						else begin 
							next_state=S_100;
						end
					end
					S_100:begin 
						out=0;
						if(in)begin 
							next_state=S_1001;
						end
						else begin 
							next_state=S_R;
						end
					end
					S_1001:begin 
						out=0;
						if(in)begin 
							next_state=S_1;
						end
						else begin 
							next_state=S_10010;
						end
					end
					S_10010:begin 
						out=1;
						if(in)begin 
							next_state=S_1;
						end
						else begin 
							next_state=S_100;
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
