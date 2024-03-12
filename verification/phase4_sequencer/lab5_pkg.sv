`include "uvm_macros.svh"

package lab5_pkg;
    import uvm_pkg::*;
    import agent::*;
    import environment::*;
    import sequences::*;
    import sequencer::*;
class alu_test extends uvm_test;
  `uvm_component_utils(alu_test)

  alu_env env;
  alu_base_sequence reset_seq;
  alu_test_sequence test_seq;
 
  rand bit n;
  function new(string name = "alu_test", uvm_component parent);
    super.new(name, parent);
    `uvm_info("TEST_CLASS", "Inside Constructor!", UVM_HIGH)
  endfunction: new

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info("TEST_CLASS", "Build Phase!", UVM_HIGH)

    env = alu_env::type_id::create("env", this);

  endfunction: build_phase


  task run_phase (uvm_phase phase);
    super.run_phase(phase);
    `uvm_info("TEST_CLASS", "Run Phase!", UVM_HIGH)
    phase.raise_objection(this);
    
    phase.drop_objection(this);

  endtask: run_phase


endclass: alu_test
endpackage