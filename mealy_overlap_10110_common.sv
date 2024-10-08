`define NEW_OBJECT \
	function new(string name=""); \
		super.new(name); \
	endfunction

`define NEW_COMPONENT \
	function new(string name="", uvm_component parent=null); \
		super.new(name,parent); \
	endfunction

class mealy_overlap_10110_common;
	static int op_match;
	static int op_mismatch;
endclass
