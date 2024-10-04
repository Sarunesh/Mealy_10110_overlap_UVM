class mealy_overlap_10110_agent extends uvm_agent;
	// Factory registration
	`uvm_component_utils(mealy_overlap_10110_agent)

	// Constructor
	`NEW_COMPONENT

	// Properties
	mealy_overlap_10110_sqr sqr;
	mealy_overlap_10110_drv drv;
	mealy_overlap_10110_mon mon;
	mealy_overlap_10110_sub sub;

	// build_phase
	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		sqr = mealy_overlap_10110_sqr::type_id::create("sqr", this);
		drv = mealy_overlap_10110_drv::type_id::create("drv", this);
		mon = mealy_overlap_10110_mon::type_id::create("mon", this);
		sub = mealy_overlap_10110_sub::type_id::create("sub", this);
		`uvm_info("MEALY_AGENT", "Inside the build_phase of mealy_overlap_10110_agent", UVM_HIGH)
	endfunction

	// connect_phase
	function void connect_phase(uvm_phase phase);
		drv.seq_item_port.connect(sqr.seq_item_export);
		mon.a_port.connect(sub.analysis_export);
		`uvm_info("MEALY_AGENT", "Inside the connect_phase of mealy_overlap_10110_agent", UVM_HIGH)
	endfunction
endclass
