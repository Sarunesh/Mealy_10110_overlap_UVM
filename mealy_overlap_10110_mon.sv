class mealy_overlap_10110_mon extends uvm_monitor;
	// Factory registration
	`uvm_component_utils(mealy_overlap_10110_mon)

	// Port declaration
	uvm_analysis_port#(mealy_overlap_10110_tx) a_port;

	// Constructor
	`NEW_COMPONENT

	// Properties
	virtual mealy_overlap_10110_intf vif;
	mealy_overlap_10110_tx tx;

	// build_phase
	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		a_port=new("a_port",this);
		`uvm_info("MEALY_MON","Inside build_phase of mealy_overlap_10110_mon",UVM_HIGH)
		if(!uvm_config_db#(virtual mealy_overlap_10110_intf)::get(this,get_full_name(),"VIF",vif))
			`uvm_fatal("MEALY_MON","Failed to read the interface from config db in mealy_overlap_10110_mon")
	endfunction

	// run_phase
	task run_phase(uvm_phase phase);
      int count;
		`uvm_info("MEALY_MON","Inside run_phase of mealy_overlap_10110_mon",UVM_HIGH)
		forever begin
		wait(vif.rst==0);	
          	@(vif.mon_cb);
//        	$display("########### time=%0t rst=%0b count=%0d", $time, vif.rst, ++count);
			tx=new();
			tx.data_in = vif.mon_cb.data_in;
			tx.data_out= vif.mon_cb.data_out;
			tx.print();
          	a_port.write(tx);
		end
	endtask
endclass
