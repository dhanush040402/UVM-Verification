class my_agent extends uvm_agent;
  `uvm_component_utils(my_agent)

  my_sequencer sqr;
  my_driver dri;
  my_monitor mon;

  uvm_analysis_port #(my_transaction)ap;

  function new(string name = "my_agent" , uvm_component parent);
    super.new(name,parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    sqr = my_sequencer::type_id::create("sqr",this);
    dri = my_driver::type_id::create("dri",this);
    mon = my_monitor::type_id::create("mon",this);
    ap = new("ap",this);
  endfunction

  function void connect_phase(uvm_phase phase);
    dri.seq_item_port.connect(sqr.seq_item_export);
    mon.ap.connect(ap);
    super.connect_phase(phase);
  endfunction
  
endclass
