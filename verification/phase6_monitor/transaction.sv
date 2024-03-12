`include "uvm_macros.svh"
package transaction;
    import uvm_pkg::*;
    
class alu_sequence_item extends uvm_sequence_item;
  `uvm_object_utils(alu_sequence_item)

  //Instantiation
  rand logic reset;
  rand logic [7:0] alu_a_in, alu_b_in;
  rand logic [3:0] alu_opcode_in;
  
  logic [7:0] alu_y_out; //output
  bit alu_co_out; // output
  

  //Constructor
  function new(string name = "alu_sequence_item");
    super.new(name);

  endfunction: new

endclass: alu_sequence_item
endpackage