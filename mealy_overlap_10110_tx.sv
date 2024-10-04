class mealy_overlap_10110_tx extends uvm_sequence_item;
	// Properties
	rand logic data_in;
		 logic data_out;
	
	// Factory registration
	`uvm_object_utils_begin(mealy_overlap_10110_tx)
		`uvm_field_int(data_in,UVM_ALL_ON)
		`uvm_field_int(data_out,UVM_ALL_ON)
	`uvm_object_utils_end

	// Constructor
	`NEW_OBJECT
endclass
