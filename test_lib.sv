class base_test extends uvm_test;
	// Factory registration
	`uvm_component_utils(base_test)

	// Constructor
	`NEW_COMPONENT

	// Properties
	mealy_overlap_10110_env env;

	// build_phase
	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		env = mealy_overlap_10110_env::type_id::create("env",this);
		`uvm_info("BASE_TEST", "Inside the build_phase of base_test", UVM_HIGH)
	endfunction

	// end_of_elaboration_phase
	function void end_of_elaboration_phase(uvm_phase phase);
		`uvm_info("BASE_TEST", "Inside the end_of_elaboration_phase of base_test", UVM_HIGH)
		uvm_top.print_topology();
	endfunction

	// report_phase
	function void report_phase(uvm_phase phase);
		int report_count;
		`uvm_info("BASE_TEST", "Inside the report_phase of base_test", UVM_HIGH)
		if(!uvm_config_db#(int)::get(this,get_full_name(),"COUNT",report_count))
			`uvm_fatal("BASE_TEST","Failed to read the count value in report_phase of base_test")
		if(mealy_overlap_10110_common::op_match==report_count && !mealy_overlap_10110_common::op_mismatch)
			`uvm_info("TEST_PASSED",$sformatf("### op_match=%0d op_mismatch=%0d ###", mealy_overlap_10110_common::op_match, mealy_overlap_10110_common::op_mismatch),UVM_NONE)
		else
			`uvm_info("TEST_FAILED",$sformatf("### op_match=%0d op_mismatch=%0d ###", mealy_overlap_10110_common::op_match, mealy_overlap_10110_common::op_mismatch),UVM_NONE)
	endfunction
endclass

class test_n_random extends base_test;
	// Factory registration
	`uvm_component_utils(test_n_random)

	// Constructor
	`NEW_COMPONENT

	// run_phase
	task run_phase(uvm_phase phase);
		seq_n_random seq_n_random_obj;
		seq_n_random_obj=new("seq_n_random_obj");
      	uvm_config_db#(int)::set(this,"*","COUNT",20);
		`uvm_info("TEST", "Inside the run_phase of test", UVM_HIGH)
      	phase.raise_objection(this);
		seq_n_random_obj.start(env.agent.sqr);
      	phase.phase_done.set_drain_time(this,10);
		phase.drop_objection(this);
	endtask
endclass

class test_random extends base_test;
	// Factory registration
	`uvm_component_utils(test_random)

	// Constructor
	`NEW_COMPONENT

	// run_phase
	task run_phase(uvm_phase phase);
		seq_random seq_random_obj;
		seq_random_obj=new("seq_random_obj");
	    uvm_config_db#(int)::set(this,"*","COUNT",20);
		`uvm_info("TEST", "Inside the run_phase of test", UVM_HIGH)
		phase.raise_objection(this);
		seq_random_obj.start(env.agent.sqr);
      	phase.phase_done.set_drain_time(this,20);
		phase.drop_objection(this);
	endtask
endclass
