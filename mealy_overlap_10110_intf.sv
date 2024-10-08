interface mealy_overlap_10110_intf(input bit clk, input bit rst);
	logic data_out;
	logic data_in;

// 	clocking drv_cb@(posedge clk);
// 		default input #0 output #1;
// 		input data_out;
// 		output data_in;
// 	endclocking
  
  clocking mon_cb@(posedge clk);
    default input #0;
    input data_in;
    input data_out;
  endclocking
endinterface
