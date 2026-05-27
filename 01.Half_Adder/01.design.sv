`include "interface.sv"

module half_addr (interf intf);
  assign intf.sum = intf.a ^ intf.b;
  assign intf.carry = intf.a & intf.b;
endmodule
