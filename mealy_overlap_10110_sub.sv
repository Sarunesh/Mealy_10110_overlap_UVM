class mealy_overlap_10110_sub extends uvm_subscriber#(mealy_overlap_10110_tx);
	// Factory registration
	`uvm_component_utils(mealy_overlap_10110_sub)

	// Covergroup
	covergroup mealy_overlap_10110_cg;
		DATA_IN_CP:coverpoint tx.data_in{
			bins DATA_IN_1 = {1'b1};
			bins DATA_IN_0 = {1'b0};
		}
		DATA_OUT_CP:coverpoint tx.data_out{
			bins DATA_OUT_1 = {1'b1};
			bins DATA_OUT_0 = {1'b0};
		}
	endgroup

	// Properties
	mealy_overlap_10110_tx tx;

	// Constructor
	function new(string name="", uvm_component parent=null);
		super.new(name,parent);
		mealy_overlap_10110_cg = new();
	endfunction

	// Methods
	virtual function void write(mealy_overlap_10110_tx t);
		$cast(tx,t);
		mealy_overlap_10110_cg.sample();
	endfunction
endclass
