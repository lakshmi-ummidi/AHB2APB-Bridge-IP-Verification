class single_vtest extends test;
	`uvm_component_utils(single_vtest)
	single_vseq vseq;
	function new(string name = "single_vtest", uvm_component parent);
		super.new(name, parent);
	endfunction : new
	function void build_phase(uvm_phase phase);	
		super.build_phase(phase);
	endfunction : build_phase
	task run_phase(uvm_phase phase);
		phase.raise_objection(this);
		vseq = single_vseq::type_id::create("vseq");
		vseq.start(envh.v_seqr);
		#41;
		phase.drop_objection(this);
	endtask : run_phase
endclass : single_vtest

class rsingle_vtest extends test;
	`uvm_component_utils(rsingle_vtest)
	rsingle_vseq vseq;
	function new(string name = "rsingle_vtest", uvm_component parent);
		super.new(name, parent);
	endfunction : new
	function void build_phase(uvm_phase phase);	
		super.build_phase(phase);
	endfunction : build_phase
	task run_phase(uvm_phase phase);
		phase.raise_objection(this);
		vseq = rsingle_vseq::type_id::create("vseq");
		vseq.start(envh.v_seqr);
		#41;
		phase.drop_objection(this);
	endtask : run_phase
endclass : rsingle_vtest

class wsingle_vtest extends test;
	`uvm_component_utils(wsingle_vtest)
	wsingle_vseq vseq;
	function new(string name = "wsingle_vtest", uvm_component parent);
		super.new(name, parent);
	endfunction : new
	function void build_phase(uvm_phase phase);	
		super.build_phase(phase);
	endfunction : build_phase
	task run_phase(uvm_phase phase);
		phase.raise_objection(this);
		vseq = wsingle_vseq::type_id::create("vseq");
		vseq.start(envh.v_seqr);
		#41;
		phase.drop_objection(this);
	endtask : run_phase
endclass : wsingle_vtest

class INCR_vtest extends test;
	`uvm_component_utils(INCR_vtest)
	INCR_vseq vseq;
	function new(string name = "INCR_vtest", uvm_component parent);
		super.new(name, parent);
	endfunction : new
	function void build_phase(uvm_phase phase);	
		super.build_phase(phase);
	endfunction : build_phase
	task run_phase(uvm_phase phase);
		phase.raise_objection(this);
		vseq = INCR_vseq::type_id::create("vseq");
		vseq.start(envh.v_seqr);
		#41;
		phase.drop_objection(this);
	endtask : run_phase
endclass : INCR_vtest

class rINCR_vtest extends test;
	`uvm_component_utils(rINCR_vtest)
	rINCR_vseq vseq;
	function new(string name = "rINCR_vtest", uvm_component parent);
		super.new(name, parent);
	endfunction : new
	function void build_phase(uvm_phase phase);	
		super.build_phase(phase);
	endfunction : build_phase
	task run_phase(uvm_phase phase);
		phase.raise_objection(this);
		vseq = rINCR_vseq::type_id::create("vseq");
		vseq.start(envh.v_seqr);
		#41;
		phase.drop_objection(this);
	endtask : run_phase
endclass : rINCR_vtest

class wINCR_vtest extends test;
	`uvm_component_utils(wINCR_vtest)
	wINCR_vseq vseq;
	function new(string name = "wINCR_vtest", uvm_component parent);
		super.new(name, parent);
	endfunction : new
	function void build_phase(uvm_phase phase);	
		super.build_phase(phase);
	endfunction : build_phase
	task run_phase(uvm_phase phase);
		phase.raise_objection(this);
		vseq = wINCR_vseq::type_id::create("vseq");
		vseq.start(envh.v_seqr);
		#41;
		phase.drop_objection(this);
	endtask : run_phase
endclass : wINCR_vtest

class WRAP_vtest extends test;
	`uvm_component_utils(WRAP_vtest)
	WRAP_vseq vseq;
	function new(string name = "WRAP_vtest", uvm_component parent);
		super.new(name, parent);
	endfunction : new
	function void build_phase(uvm_phase phase);	
		super.build_phase(phase);
	endfunction : build_phase
	task run_phase(uvm_phase phase);
		phase.raise_objection(this);
		vseq = WRAP_vseq::type_id::create("vseq");
		vseq.start(envh.v_seqr);
		#41;
		phase.drop_objection(this);
	endtask : run_phase
endclass : WRAP_vtest

class rWRAP_vtest extends test;
	`uvm_component_utils(rWRAP_vtest)
	rWRAP_vseq vseq;
	function new(string name = "rWRAP_vtest", uvm_component parent);
		super.new(name, parent);
	endfunction : new
	function void build_phase(uvm_phase phase);	
		super.build_phase(phase);
	endfunction : build_phase
	task run_phase(uvm_phase phase);
		phase.raise_objection(this);
		vseq = rWRAP_vseq::type_id::create("vseq");
		vseq.start(envh.v_seqr);
		#41;
		phase.drop_objection(this);
	endtask : run_phase
endclass : rWRAP_vtest

class wWRAP_vtest extends test;
	`uvm_component_utils(wWRAP_vtest)
	wWRAP_vseq vseq;
	function new(string name = "wWRAP_vtest", uvm_component parent);
		super.new(name, parent);
	endfunction : new
	function void build_phase(uvm_phase phase);	
		super.build_phase(phase);
	endfunction : build_phase
	task run_phase(uvm_phase phase);
		phase.raise_objection(this);
		vseq = wWRAP_vseq::type_id::create("vseq");
		vseq.start(envh.v_seqr);
		#41;
		phase.drop_objection(this);
	endtask : run_phase
endclass : wWRAP_vtest