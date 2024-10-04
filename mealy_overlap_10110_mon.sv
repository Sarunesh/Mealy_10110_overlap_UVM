class mealy_overlap_10110_mon extends uvm_monitor;
	// Factory registration
	`uvm_component_utils(mealy_overlap_10110_mon)

	// Port declaration
	uvm_analysis_port#(mealy_overlap_10110_tx) a_port;

	// Constructor
	`NEW_COMPONENT

	// Properties
	virtual mealy_overlap_10110_intf vif;

	// build_phase
	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		a_port=new("a_port",this);
		`uvm_info("MEALY_MON","Inside build_phase of mealy_overlap_10110_mon",UVM_HIGH)
		if(!uvm_config_db#(virtual mealy_overlap_10110_intf)::get(this,get_full_name(),"VIF",vif))
			`uvm_fatal("MEALY_MON","Failed to read the interface from config db in mealy_overlap_10110_mon")
	endfunction
endclass
