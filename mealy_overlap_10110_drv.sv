class mealy_overlap_10110_drv extends uvm_driver#(mealy_overlap_10110_tx);
	// Factory registration
	`uvm_component_utils(mealy_overlap_10110_drv)

	// Constructor
	`NEW_COMPONENT

	// Properties
	virtual mealy_overlap_10110_intf vif;

	// build_phase
	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		`uvm_info("MEALY_DRV","Inside the build_phase of mealy_overlap_10110_drv", UVM_HIGH)
		if(!uvm_config_db#(virtual mealy_overlap_10110_intf)::get(this,get_full_name(),"VIF",vif))
			`uvm_fatal("MEALY_DRV","Failed to read the interface from config db in mealy_overlap_10110_drv")
	endfunction

	// run_phase
	task run_phase(uvm_phase phase);
		`uvm_info("MEALY_DRV","Inside the run_phase of mealy_overlap_10110_drv", UVM_HIGH)
	endtask
endclass
