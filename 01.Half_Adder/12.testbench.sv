import uvm_pkg::*;

`include "uvm_macros.svh"

`include "transaction.sv"
`include "sequence.sv"
`include "sequencer.sv"
`include "driver.sv"
`include "monitor.sv"
`include "agent.sv"
`include "scoreboard.sv"
`include "environment.sv"
`include "test.sv"

module tb;
  
  logic clk;
  
  initial begin
    clk=0;
    forever #5 clk = ~clk;
  end
  
  interf intf(clk);
  half_addr dut(intf);
  
  initial begin
    uvm_config_db #(virtual interf)::set(null,"*.agt.*","intf",intf);
    run_test("my_test"); 
  end

endmodule


  
  
