class my_transaction extends uvm_sequence_item;
  rand bit a;
  rand bit b;
  bit carry;
  bit sum;
  
  `uvm_object_utils_begin(my_transaction)
  `uvm_field_int(a,UVM_ALL_ON)
  `uvm_field_int(b,UVM_ALL_ON)
  `uvm_field_int(carry,UVM_ALL_ON)
  `uvm_field_int(sum,UVM_ALL_ON)
  `uvm_object_utils_end
  
  function new(string name = "my_transaction");
    super.new(name);
  endfunction
  
endclass
