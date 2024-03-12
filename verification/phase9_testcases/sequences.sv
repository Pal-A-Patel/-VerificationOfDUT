
`include "uvm_macros.svh"
package sequences;
    import uvm_pkg::*;
    import transaction::*;
class alu_base_sequence extends uvm_sequence;
  `uvm_object_utils(alu_base_sequence)
  
  alu_sequence_item reset_pkt;
  
  //Constructor
  function new(string name= "alu_base_sequence");
    super.new(name);
    `uvm_info("BASE_SEQ", "Inside Constructor!", UVM_HIGH)
  endfunction
  

  //Body Task
  task body();
    `uvm_info("BASE_SEQ", "Inside body task!", UVM_HIGH)
    
    reset_pkt = alu_sequence_item::type_id::create("reset_pkt");
    start_item(reset_pkt);
    assert(reset_pkt.randomize() with {reset==1;});
    finish_item(reset_pkt);
        
  endtask: body
  
  
endclass: alu_base_sequence



class alu_test_sequence extends alu_base_sequence;
  `uvm_object_utils(alu_test_sequence)
  
  alu_sequence_item item;
  bit [3:0] alu_opcode_in;

  //Constructor
  function new(string name= "alu_test_sequence");
    super.new(name);
    `uvm_info("TEST_SEQ", "Inside Constructor!", UVM_HIGH)
  endfunction
  
  

  //Body Task
  task body();
    `uvm_info("TEST_SEQ", "Inside body task!", UVM_HIGH)
    item = alu_sequence_item::type_id::create("item");
    start_item(item);
	  
	  assert(item.randomize() with {reset==0;});
	  item.alu_opcode_in = alu_opcode_in;
    finish_item(item);
        
  endtask: body
  
  
endclass: alu_test_sequence
endpackage