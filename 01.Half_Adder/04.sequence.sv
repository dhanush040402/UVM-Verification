class my_sequence extends uvm_sequence #(my_transaction);
  `uvm_object_utils(my_sequence)
  
  function new(string name = "my_sequence");
    super.new(name);
  endfunction
  
  task body();
    my_transaction tr;
    repeat(10)begin
      tr = my_transaction :: type_id :: create("tr");
      start_item(tr);
      assert(tr.randomize());
      finish_item(tr);
    end
  endtask
  
endclass
