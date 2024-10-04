module mealy_overlap_10110(clk,rst,data_in,data_out);
	// State Parameters
	parameter S0=0;
	parameter S1=1;
	parameter S10=2;
	parameter S101=3;
	parameter S1011=4;

	// Port directions
	output reg data_out;
	input clk;
	input rst;
	input data_in;

	// Internal registers
	reg [2:0]state;
	reg flag;

	always@(posedge clk) begin
		if(rst)begin
			data_out=0;
			state=S0;
		end
		else begin                     // State change and Output assignment
			flag=0;
			case(state)
				S0:begin
					if(data_in) state=S1;
					else state=S0;
				end
				S1:begin
					if(!data_in) state=S10;
					else state=S1;
				end
				S10:begin
					if(data_in) state=S101;
					else state=S0;
				end
				S101:begin
        	      if(data_in) state=S1011;
					else state=S10;
				end
				S1011:begin
					if(!data_in)begin
						state=S10;
						flag=1;
					end
					else state=S1;
				end
			endcase
        	data_out=flag;
        end
	end
endmodule
