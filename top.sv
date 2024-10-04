module top;
	bit clk;
	bit rst;

	// Interface instantiation
	mealy_overlap_10110_intf pif(
									.clk(clk),
									.rst(rst)
								);

	// DUT instantiation
	mealy_overlap_10110 dut(
							.clk		(pif.clk),
							.rst		(pif.rst),
							.data_in	(pif.data_in),
							.data_out	(pif.data_out)
							);
	
	// Set the interface to config db
	initial uvm_config_db#(virtual mealy_overlap_10110_intf)::set(null,"*","VIF",pif);
	
	// Clock generation
	always #5 clk=~clk;

	initial begin
		clk=0;
		rst=1;
		repeat(2)@(posedge clk);
		rst=0;
	end

	initial begin
		run_test("base_test");
	end
endmodule
