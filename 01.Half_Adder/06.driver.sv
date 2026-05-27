class my_driver extends uvm_driver #(my_transaction);
  `uvm_component_utils(my_driver)
  virtual interf intf;

  function new(string name = "my_driver" , uvm_component parent);
    super.new(name,parent);
  endfunction

  function void build_phase ( uvm_phase phase);
    super.build_phase(phase);
    if(!uvm_config_db #(virtual interf)::get(this,"","intf",intf))begin
      `uvm_fatal("NOINTF","Virtual interface is not found in Driver")
    end
  endfunction

  task run_phase ( uvm_phase phase);
    forever begin
      seq_item_port.get_next_item(req);
      @(posedge intf.clk);
      intf.a = req.a;
      intf.b = req.b;
      `uvm_info("DRV",$sformatf("Driving a=%0b b=%0b",req.a,req.b),UVM_LOW)
      #1;
      seq_item_port.item_done();
    end
  endtask
  
endclass
