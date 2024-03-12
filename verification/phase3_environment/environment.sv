
`include "uvm_macros.svh"
package environment;
    import uvm_pkg::*;
    import agent::*;
class alu_env extends uvm_env;
  `uvm_component_utils(alu_env)


  //Constructor
  function new(string name = "alu_env", uvm_component parent);
    super.new(name, parent);
    `uvm_info("ENV_CLASS", "Inside Constructor!", UVM_HIGH)
  endfunction: new
  

  //Build Phase
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info("ENV_CLASS", "Build Phase!", UVM_HIGH)

    
  endfunction: build_phase
  
  
  //Connect Phase
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    `uvm_info("ENV_CLASS", "Connect Phase!", UVM_HIGH)
    
    
  endfunction: connect_phase


  //Run Phase
  task run_phase (uvm_phase phase);
    super.run_phase(phase);
    
  endtask: run_phase
  
  
endclass: alu_env
endpackage