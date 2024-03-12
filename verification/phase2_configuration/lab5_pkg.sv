`include "uvm_macros.svh"
package lab5_pkg;
    import uvm_pkg::*;


    class alu_test extends uvm_test;
        `uvm_component_utils(alu_test)
       

        function new(string name,uvm_component parent);
            super.new(name,parent);
        endfunction

        task run_phase(uvm_phase phase);
            `uvm_info("","My_test case started",UVM_NONE);
        endtask
    endclass

   
endpackage