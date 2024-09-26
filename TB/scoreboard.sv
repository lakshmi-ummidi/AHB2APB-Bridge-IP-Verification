class scoreboard extends uvm_scoreboard;
	`uvm_component_utils(scoreboard);
	uvm_tlm_analysis_fifo#(ahb_xtn) fifo1;
	uvm_tlm_analysis_fifo#(apb_xtn) fifo2;
	
	ahb_xtn xtn1;
	apb_xtn xtn2;
	covergroup ahb_cg;
		Haddr: coverpoint xtn1.HADDR{bins slave1 = {[32'h8000_0000:32'h8000_03ff]};
									 bins slave2 = {[32'h8400_0000:32'h8400_03ff]};
									 bins slave3 = {[32'h8800_0000:32'h8800_03ff]};
									 bins slave4 = {[32'h8c00_0000:32'h8c00_03ff]};}
		Htrans: coverpoint xtn1.HTRANS{bins NON_SEQ = {2};
									   bins SEQ = {3};}
		Hwrite: coverpoint xtn1.HWRITE{bins write = {1};
									   bins read = {0};}
		Hsize: coverpoint xtn1.HSIZE{bins zero = {0};
									 bins one = {1};
									 bins two = {2};}
		cross1: cross Haddr, Htrans, Hwrite, Hsize;
	endgroup : ahb_cg
	covergroup apb_cg;
		Paddr: coverpoint xtn2.PADDR{bins slave1 = {[32'h8000_0000:32'h8000_03ff]};
									 bins slave2 = {[32'h8400_0000:32'h8400_03ff]};
									 bins slave3 = {[32'h8800_0000:32'h8800_03ff]};
									 bins slave4 = {[32'h8c00_0000:32'h8c00_03ff]};}
		Psel: coverpoint xtn2.PSELx{bins sel1 = {1};
								    bins sel2 = {2};
								    bins sel3 = {4};
								    bins sel4 = {8};}
		cross1: cross Paddr, Psel;
	endgroup : apb_cg
	function new(string name = "scoreboard", uvm_component parent);
		super.new(name, parent);
		ahb_cg = new();
		apb_cg = new();
	endfunction : new
	function void build_phase(uvm_phase phase);
		fifo1 = new("fifo1", this);
		fifo2 = new("fifo2", this);
		super.build_phase(phase);
	endfunction : build_phase
	task run_phase(uvm_phase phase);
		forever
			begin
				fork
					begin
						fifo1.get(xtn1);
						`uvm_info("scoreboard", $sformatf("printing from scoreboard ahb_xtn\n %s", xtn1.sprint()), UVM_LOW)
						ahb_cg.sample();
					end
					begin
						fifo2.get(xtn2);
						`uvm_info("scoreboard", $sformatf("printing from scoreboard apb_xtn\n %s", xtn2.sprint()), UVM_LOW)
						apb_cg.sample();
					end
				join
				check_data(xtn1, xtn2);
			end
	endtask : run_phase
	task check_data(ahb_xtn xtn1, apb_xtn xtn2);
		if(xtn1.HWRITE == 1)
			begin
				if(xtn1.HSIZE == 2'b00)
					begin
						if(xtn1.HADDR[1:0] == 2'b00)
							compare(xtn1.HADDR, xtn2.PADDR, xtn1.HWDATA[7:0], xtn2.PWDATA);
						if(xtn1.HADDR[1:0] == 2'b01)
							compare(xtn1.HADDR, xtn2.PADDR, xtn1.HWDATA[15:8], xtn2.PWDATA);
						if(xtn1.HADDR[1:0] == 2'b10)
							compare(xtn1.HADDR, xtn2.PADDR, xtn1.HWDATA[23:16], xtn2.PWDATA);
						if(xtn1.HADDR[1:0] == 2'b11)
							compare(xtn1.HADDR, xtn2.PADDR, xtn1.HWDATA[31:24], xtn2.PWDATA);
					end
				if(xtn1.HSIZE == 2'b01)
					begin
						if(xtn1.HADDR[1:0] == 2'b00)
							compare(xtn1.HADDR, xtn2.PADDR, xtn1.HWDATA[15:0], xtn2.PWDATA);
						if(xtn1.HADDR[1:0] == 2'b10)
							compare(xtn1.HADDR, xtn2.PADDR, xtn1.HWDATA[31:16], xtn2.PWDATA);
					end
				if(xtn1.HSIZE == 2'b10)
					compare(xtn1.HADDR, xtn2.PADDR, xtn1.HWDATA, xtn2.PWDATA);							
			end
		else
			begin
				if(xtn1.HSIZE == 2'b00)
					begin
						if(xtn1.HADDR[1:0] == 2'b00)
							compare(xtn1.HADDR, xtn2.PADDR, xtn1.HRDATA, xtn2.PRDATA[7:0]);
						if(xtn1.HADDR[1:0] == 2'b01)
							compare(xtn1.HADDR, xtn2.PADDR, xtn1.HRDATA, xtn2.PRDATA[15:8]);
						if(xtn1.HADDR[1:0] == 2'b10)
							compare(xtn1.HADDR, xtn2.PADDR, xtn1.HRDATA, xtn2.PRDATA[23:16]);
						if(xtn1.HADDR[1:0] == 2'b11)
							compare(xtn1.HADDR, xtn2.PADDR, xtn1.HRDATA, xtn2.PRDATA[31:24]);
					end
				if(xtn1.HSIZE == 2'b01)
					begin
						if(xtn1.HADDR[1:0] == 2'b00)
							compare(xtn1.HADDR, xtn2.PADDR, xtn1.HRDATA, xtn2.PRDATA[15:0]);
						if(xtn1.HADDR[1:0] == 2'b10)
							compare(xtn1.HADDR, xtn2.PADDR, xtn1.HRDATA, xtn2.PRDATA[31:16]);
					end
				if(xtn1.HSIZE == 2'b10)
					compare(xtn1.HADDR, xtn2.PADDR, xtn1.HRDATA, xtn2.PRDATA);
			end
	endtask : check_data
	task compare(int HADDR, PADDR, Hdata, Pdata);
		if(HADDR == PADDR)
			`uvm_info("scoreboard", "Address comparison success",UVM_MEDIUM)
		else
			`uvm_error("scoreboard", "Address comparison failed")
		if(Hdata == Pdata)
			`uvm_info("scoreboard", "Data comparison success",UVM_MEDIUM)
		else
			`uvm_error("scoreboard", "Data comparison failed")
	endtask : compare
endclass : scoreboard