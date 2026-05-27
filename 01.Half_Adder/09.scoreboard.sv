class my_scoreboard extends uvm_scoreboard;
  `uvm_component_utils(my_scoreboard)
  
  uvm_analysis_imp #(my_transaction,my_scoreboard) imp;
  
  int pass_count;
  int fail_count;
  
  function new(string name,uvm_component parent);
    super.new(name,parent);
    pass_count = 0;
    fail_count = 0;
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    imp = new("imp",this);
  endfunction
  
  function void write(my_transaction tr);
    bit exp_sum = tr.a ^ tr.b;
    bit exp_carry = tr.a & tr.b;
    
    if((exp_sum == tr.sum) && (exp_carry == tr.carry))begin
      pass_count = pass_count + 1;
      `uvm_info("SCO",$sformatf("PASS | a = %0b | b = %0b | sum = %0b | carry = %0b |",tr.a,tr.b,tr.sum,tr.carry),UVM_LOW)
    end
    
    else begin
      fail_count = fail_count + 1;
      `uvm_error("SCO",$sformatf("FAIL | a = %0b | b = %0b | sum = %0b | carry = %0b |",tr.a,tr.b,tr.sum,tr.carry))
    end
    
  endfunction
  
  function void report_phase(uvm_phase phase);
    `uvm_info("SCO",$sformatf("PASS = %0d | FAIL = %0d |",pass_count,fail_count),UVM_LOW)
  endfunction
  
endclass


    
  
  
      
      
    
    
      
  
  
