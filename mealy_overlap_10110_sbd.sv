class mealy_overlap_10110_sbd extends uvm_scoreboard;
	// Factory registration
	`uvm_component_utils(mealy_overlap_10110_sbd)

	// Port declaration
	uvm_analysis_imp#(mealy_overlap_10110_tx, mealy_overlap_10110_sbd) a_imp;

	// Constructor
	`NEW_COMPONENT

	// Properties
	mealy_overlap_10110_tx tx, tx_t;
	bit sbd_start;
	bit [2:0] state;
	bit flag;
	// State Parameters
	parameter S0=0;
	parameter S1=1;
	parameter S10=2;
	parameter S101=3;
	parameter S1011=4;

	// build_phase
	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		a_imp=new("a_imp",this);
		`uvm_info("MEALY_SBD", "Inside the build_phase of mealy_overlap_10110_sbd", UVM_HIGH)
	endfunction

	// run_phase
	task run_phase(uvm_phase phase);
		`uvm_info("MEALY_SBD", "Inside the run_phase of mealy_overlap_10110_sbd", UVM_HIGH)
		state = S0;
		forever begin
			wait(sbd_start==1);
			tx_t = new();
			tx_t.data_in = tx.data_in;
			flag=0;
			case(state)
				S0:begin
                  if(tx_t.data_in) state=S1;
					else state=S0;
				end
				S1:begin
					if(!tx_t.data_in) state=S10;
					else state=S1;
				end
				S10:begin
					if(tx_t.data_in) state=S101;
					else state=S0;
				end
				S101:begin
        	      if(tx_t.data_in) state=S1011;
					else state=S10;
				end
				S1011:begin
					if(!tx_t.data_in)begin
						state=S10;
						flag=1;
					end
					else state=S1;
				end
			endcase
			tx_t.data_out = flag;
			if(tx.data_out == tx_t.data_out) mealy_overlap_10110_common::op_match++;
			else mealy_overlap_10110_common::op_mismatch++;
			sbd_start=0;
		end
	endtask
	
	// write method
	virtual function void write(mealy_overlap_10110_tx t);
		$cast(tx,t);
		sbd_start=1;
	endfunction
endclass
