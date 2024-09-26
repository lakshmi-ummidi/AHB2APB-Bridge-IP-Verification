class virtual_sequence extends uvm_sequence#(uvm_sequence_item);
	`uvm_object_utils(virtual_sequence);
	single_transfer_seq single_seq;
	rsingle_transfer_seq rsingle_seq;
	wsingle_transfer_seq wsingle_seq;
	INCR_transfer_seq INCR_seq;
	rINCR_transfer_seq rINCR_seq;
	wINCR_transfer_seq wINCR_seq;
	WRAP_transfer_seq WRAP_seq;
	rWRAP_transfer_seq rWRAP_seq;
	wWRAP_transfer_seq wWRAP_seq;
	
	ahb_sequencer ahb_seqr[];
	apb_sequencer apb_seqr[];
	env_config cfg;
	virtual_seqr v_seqr;
	function new(string name = "virtual_sequence");
		super.new(name);
	endfunction : new
	task body();
		if(!uvm_config_db#(env_config)::get(null, get_full_name(), "cfg", cfg))
			`uvm_fatal("virtual_sequence","ENV Config getting is failed!!")
		ahb_seqr = new[cfg.no_of_ahbagents];
		apb_seqr = new[cfg.no_of_apbagents];
		assert($cast(v_seqr, m_sequencer))
		else 
			begin
				`uvm_error("virtual_sequence","UVM casting failed")
			end
		foreach(ahb_seqr[i])
			ahb_seqr[i] = v_seqr.ahb_seqr[i];
		foreach(apb_seqr[i])
			apb_seqr[i] = v_seqr.apb_seqr[i];
	endtask : body
endclass : virtual_sequence	

class single_vseq extends virtual_sequence;
	`uvm_object_utils(single_vseq)
	function new(string name="single_vseq");
		super.new(name);
	endfunction : new
	task body();
		super.body();
		single_seq = single_transfer_seq::type_id::create("single_seq");
		fork
			begin
				for(int i = 0; i < cfg.no_of_ahbagents; i++)
					single_seq.start(ahb_seqr[i]);
			end
		join
	endtask : body
endclass : single_vseq

class rsingle_vseq extends virtual_sequence;
	`uvm_object_utils(rsingle_vseq)
	function new(string name="rsingle_vseq");
		super.new(name);
	endfunction : new
	task body();
		super.body();
		rsingle_seq = rsingle_transfer_seq::type_id::create("rsingle_seq");
		fork
			begin
				for(int i = 0; i < cfg.no_of_ahbagents; i++)
					rsingle_seq.start(ahb_seqr[i]);
			end
		join
	endtask : body
endclass : rsingle_vseq

class wsingle_vseq extends virtual_sequence;
	`uvm_object_utils(wsingle_vseq)
	function new(string name="wsingle_vseq");
		super.new(name);
	endfunction : new
	task body();
		super.body();
		wsingle_seq = wsingle_transfer_seq::type_id::create("wsingle_seq");
		fork
			begin
				for(int i = 0; i < cfg.no_of_ahbagents; i++)
					wsingle_seq.start(ahb_seqr[i]);
			end
		join
	endtask : body
endclass : wsingle_vseq

class INCR_vseq extends virtual_sequence;
	`uvm_object_utils(INCR_vseq)
	function new(string name="INCR_vseq");
		super.new(name);
	endfunction : new
	task body();
		super.body();
		INCR_seq = INCR_transfer_seq::type_id::create("INCR_seq");
		fork
			begin
				for(int i = 0; i < cfg.no_of_ahbagents; i++)
					INCR_seq.start(ahb_seqr[i]);
			end
		join
	endtask : body
endclass : INCR_vseq

class rINCR_vseq extends virtual_sequence;
	`uvm_object_utils(rINCR_vseq)
	function new(string name="rINCR_vseq");
		super.new(name);
	endfunction : new
	task body();
		super.body();
		rINCR_seq = rINCR_transfer_seq::type_id::create("rINCR_seq");
		fork
			begin
				for(int i = 0; i < cfg.no_of_ahbagents; i++)
					rINCR_seq.start(ahb_seqr[i]);
			end
		join
	endtask : body
endclass : rINCR_vseq

class wINCR_vseq extends virtual_sequence;
	`uvm_object_utils(wINCR_vseq)
	function new(string name="wINCR_vseq");
		super.new(name);
	endfunction : new
	task body();
		super.body();
		wINCR_seq = wINCR_transfer_seq::type_id::create("wINCR_seq");
		fork
			begin
				for(int i = 0; i < cfg.no_of_ahbagents; i++)
					wINCR_seq.start(ahb_seqr[i]);
			end
		join
	endtask : body
endclass : wINCR_vseq

class WRAP_vseq extends virtual_sequence;
	`uvm_object_utils(WRAP_vseq)
	function new(string name="WRAP_vseq");
		super.new(name);
	endfunction : new
	task body();
		super.body();
		WRAP_seq = WRAP_transfer_seq::type_id::create("WRAP_seq");
		fork
			begin
				for(int i = 0; i < cfg.no_of_ahbagents; i++)
					WRAP_seq.start(ahb_seqr[i]);
			end
		join
	endtask : body
endclass : WRAP_vseq

class rWRAP_vseq extends virtual_sequence;
	`uvm_object_utils(rWRAP_vseq)
	function new(string name="rWRAP_vseq");
		super.new(name);
	endfunction : new
	task body();
		super.body();
		rWRAP_seq = rWRAP_transfer_seq::type_id::create("rWRAP_seq");
		fork
			begin
				for(int i = 0; i < cfg.no_of_ahbagents; i++)
					rWRAP_seq.start(ahb_seqr[i]);
			end
		join
	endtask : body
endclass : rWRAP_vseq

class wWRAP_vseq extends virtual_sequence;
	`uvm_object_utils(wWRAP_vseq)
	function new(string name="wWRAP_vseq");
		super.new(name);
	endfunction : new
	task body();
		super.body();
		wWRAP_seq = wWRAP_transfer_seq::type_id::create("wWRAP_seq");
		fork
			begin
				for(int i = 0; i < cfg.no_of_ahbagents; i++)
					wWRAP_seq.start(ahb_seqr[i]);
			end
		join
	endtask : body
endclass : wWRAP_vseq