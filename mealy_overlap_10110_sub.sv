class mealy_overlap_10110_sub extends uvm_subscriber#(mealy_overlap_10110_tx);
	// Factory registration
	`uvm_component_utils(mealy_overlap_10110_sub)

	// Constructor
	`NEW_COMPONENT

	// Methods
	virtual function void write(mealy_overlap_10110_tx t);
	endfunction
endclass
