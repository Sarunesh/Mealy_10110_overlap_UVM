class mealy_overlap_10110_seq_lib extends uvm_sequence#(mealy_overlap_10110_tx);
	// Factory registration
	`uvm_object_utils(mealy_overlap_10110_seq_lib)

	// Constructor
	`NEW_OBJECT

	// Properties

	// pre_body
	// post_body
endclass

class test_seq extends mealy_overlap_10110_seq_lib;
	// Factory registration
	`uvm_object_utils(test_seq)

	// Constructor
	`NEW_OBJECT
	
	// body task
	task body();
	endtask
endclass
