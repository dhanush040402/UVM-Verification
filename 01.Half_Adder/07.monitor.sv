class my_monitor extends uvm_monitor;
  `uvm_component_utils(my_monitor)
  virtual interf intf;
  uvm_analysis_port #(my_transaction) ap;
  
  function new(string name = "my_monitor", uvm_component parent);
    super.new(name,parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    ap=new("ap",this);
    if(!uvm_config_db #(virtual interf) ::get(this,"","intf",intf))begin
      `uvm_fatal("NOINTF","Virtual interface is not found in Monitor")
    end
  endfunction
  
  task run_phase (uvm_phase phase);
    my_transaction tr;
    forever begin
      @(posedge intf.clk);
      tr = my_transaction::type_id::create("tr");
      tr.a = intf.a;
      tr.b = intf.b;
      tr.sum = intf.sum;
      tr.carry = intf.carry;
      `uvm_info("MON",$sformatf("Monitor | a = %0b | b = %0b | sum = %0b | carry = %0b |",tr.a,tr.b,tr.sum,tr.carry),UVM_LOW)
      ap.write(tr);
    end
  endtask
  
endclass


      
      
  
  
  
