`include "uvm_macros.svh"

package agent;
 import uvm_pkg::*;
 import sequencer::*;
class alu_agent extends uvm_agent;
  `uvm_component_utils(alu_agent)
    alu_sequencer seqr;
    
  //Constructor
  function new(string name = "alu_agent", uvm_component parent);
    super.new(name, parent);
    `uvm_info("AGENT_CLASS", "Inside Constructor!", UVM_HIGH)
  endfunction: new
  
  
  //Build Phase
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info("AGENT_CLASS", "Build Phase!", UVM_HIGH)
    seqr = alu_sequencer::type_id::create("seqr", this);
  endfunction: build_phase
  
  
  //Connect Phase
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    `uvm_info("AGENT_CLASS", "Connect Phase!", UVM_HIGH)
    
  endfunction: connect_phase
  

  //Run Phase
  task run_phase (uvm_phase phase);
    super.run_phase(phase);
    
  endtask: run_phase
  
  
endclass: alu_agent
endpackage