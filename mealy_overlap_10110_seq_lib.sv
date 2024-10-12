class mealy_overlap_10110_seq_lib extends uvm_sequence#(mealy_overlap_10110_tx);
	// Factory registration
	`uvm_object_utils(mealy_overlap_10110_seq_lib)

	// Constructor
	`NEW_OBJECT

	// Properties
	int count;
	int i;
endclass

class seq_n1_0_random extends mealy_overlap_10110_seq_lib;
	// Factory registration
	`uvm_object_utils(seq_n1_0_random)

	// Constructor
	`NEW_OBJECT
	
	// body task
	task body();
		int test_inQ[$]={0,1,0,1,1,0,1,1,0,1,1,1,0,1,1,0,0,1,1,0,1,0,1,0,1,1,0,0,0,1};
		if(!uvm_config_db#(int)::get(null,get_full_name(),"COUNT",count))
			`uvm_fatal("TEST_SEQ","Failed to read count from config db in seq_n1_0_random")
		`uvm_info("TEST_SEQ",$sformatf("Count=%0d",count),UVM_HIGH)
		repeat(count)begin
			`uvm_do_with(req,{req.data_in==test_inQ[i];})
			if(i==test_inQ.size) i=0;
			else i++;
		end
	endtask
endclass

class seq_n2_0_random extends mealy_overlap_10110_seq_lib;
	// Factory registration
	`uvm_object_utils(seq_n2_0_random)

	// Constructor
	`NEW_OBJECT
	
	// body task
	task body();
		int test_inQ[$]={0,0,1,0,1,1,0,1,1,0,1,1,1,0,1,1,0,0,1,1,0,1,0,1,0,1,1,0,0,0};
		if(!uvm_config_db#(int)::get(null,get_full_name(),"COUNT",count))
			`uvm_fatal("TEST_SEQ","Failed to read count from config db in seq_n2_0_random")
		`uvm_info("TEST_SEQ",$sformatf("Count=%0d",count),UVM_HIGH)
		repeat(count)begin
			`uvm_do_with(req,{req.data_in==test_inQ[i];})
			if(i==test_inQ.size) i=0;
			else i++;
		end
	endtask
endclass

class seq_random extends mealy_overlap_10110_seq_lib;
	// Factory registration
	`uvm_object_utils(seq_random)

	// Constructor
	`NEW_OBJECT
	
	// body task
	task body();
		if(!uvm_config_db#(int)::get(null,get_full_name(),"COUNT",count))
			`uvm_fatal("TEST_SEQ","Failed to read count from config db in seq_random")
		`uvm_info("TEST_SEQ",$sformatf("Count=%0d",count),UVM_HIGH)
		repeat(count)begin
			`uvm_do(req);
		end
	endtask
endclass
