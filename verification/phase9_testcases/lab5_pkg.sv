`include "uvm_macros.svh"

package lab5_pkg;
    import uvm_pkg::*;
    import agent::*;
    import environment::*;
    import sequences::*;
    import transaction::*;
    import sequencer::*;
class alu_test extends uvm_test;
  `uvm_component_utils(alu_test)

  alu_env env;
  alu_base_sequence reset_seq;
  alu_test_sequence test_seq;

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
    reset_seq = alu_base_sequence::type_id::create("reset_seq");
    reset_seq.start(env.agnt.seqr);
    #10;
    repeat(100) begin
      test_seq = alu_test_sequence::type_id::create("test_seq");
	  test_seq.alu_opcode_in = $random;
      test_seq.start(env.agnt.seqr);
      #10;
    end 
    phase.drop_objection(this);

  endtask: run_phase


endclass: alu_test

class alu_addition_test extends uvm_test;
  `uvm_component_utils(alu_addition_test)

  alu_env env;
  alu_base_sequence reset_seq;
  alu_test_sequence test_seq;

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

    //reset_seq
    reset_seq = alu_base_sequence::type_id::create("reset_seq");
    reset_seq.start(env.agnt.seqr);
    #10;

    repeat(100) begin
      //test_seq
      test_seq = alu_test_sequence::type_id::create("test_seq");
	    test_seq.alu_opcode_in = 0;
      test_seq.start(env.agnt.seqr);
      #10;
    end
    
    phase.drop_objection(this);

  endtask: run_phase


endclass: alu_addition_test


class alu_subtraction_test extends uvm_test;
  `uvm_component_utils(alu_subtraction_test)

  alu_env env;
  alu_base_sequence reset_seq;
  alu_test_sequence test_seq;

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

    //reset_seq
    reset_seq = alu_base_sequence::type_id::create("reset_seq");
    reset_seq.start(env.agnt.seqr);
    #10;

    repeat(100) begin
      //test_seq
      test_seq = alu_test_sequence::type_id::create("test_seq");
	    test_seq.alu_opcode_in = 1;
      test_seq.start(env.agnt.seqr);
      #10;
    end
    
    phase.drop_objection(this);
  endtask: run_phase
endclass: alu_subtraction_test


class alu_multiplication_test extends uvm_test;
  `uvm_component_utils(alu_multiplication_test)

  alu_env env;
  alu_base_sequence reset_seq;
  alu_test_sequence test_seq;

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

    //reset_seq
    reset_seq = alu_base_sequence::type_id::create("reset_seq");
    reset_seq.start(env.agnt.seqr);
    #10;

    repeat(100) begin
      //test_seq
      test_seq = alu_test_sequence::type_id::create("test_seq");
	    test_seq.alu_opcode_in = 2;
      test_seq.start(env.agnt.seqr);
      #10;
    end
    
    phase.drop_objection(this);
  endtask: run_phase
endclass: alu_multiplication_test

class alu_division_test extends uvm_test;
  `uvm_component_utils(alu_division_test)

  alu_env env;
  alu_base_sequence reset_seq;
  alu_test_sequence test_seq;

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

    //reset_seq
    reset_seq = alu_base_sequence::type_id::create("reset_seq");
    reset_seq.start(env.agnt.seqr);
    #10;

    repeat(100) begin
      //test_seq
      test_seq = alu_test_sequence::type_id::create("test_seq");
	    test_seq.alu_opcode_in = 3;
      test_seq.start(env.agnt.seqr);
      #10;
    end
    
    phase.drop_objection(this);
  endtask: run_phase
endclass: alu_division_test

class shift_right_test extends uvm_test;
  `uvm_component_utils(shift_right_test)

  alu_env env;
  alu_base_sequence reset_seq;
  alu_test_sequence test_seq;

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

    //reset_seq
    reset_seq = alu_base_sequence::type_id::create("reset_seq");
    reset_seq.start(env.agnt.seqr);
    #10;

    repeat(100) begin
      //test_seq
      test_seq = alu_test_sequence::type_id::create("test_seq");
	    test_seq.alu_opcode_in = 5;
      test_seq.start(env.agnt.seqr);
      #10;
    end
    
    phase.drop_objection(this);
  endtask: run_phase
endclass: shift_right_test


class shift_left_test extends uvm_test;
  `uvm_component_utils(shift_left_test)

  alu_env env;
  alu_base_sequence reset_seq;
  alu_test_sequence test_seq;

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

    //reset_seq
    reset_seq = alu_base_sequence::type_id::create("reset_seq");
    reset_seq.start(env.agnt.seqr);
    #10;

    repeat(100) begin
      //test_seq
      test_seq = alu_test_sequence::type_id::create("test_seq");
	    test_seq.alu_opcode_in = 4;
      test_seq.start(env.agnt.seqr);
      #10;
    end
    
    phase.drop_objection(this);
  endtask: run_phase
endclass: shift_left_test


class rotate_left_test extends uvm_test;
  `uvm_component_utils(rotate_left_test)

  alu_env env;
  alu_base_sequence reset_seq;
  alu_test_sequence test_seq;

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

    //reset_seq
    reset_seq = alu_base_sequence::type_id::create("reset_seq");
    reset_seq.start(env.agnt.seqr);
    #10;

    repeat(100) begin
      //test_seq
      test_seq = alu_test_sequence::type_id::create("test_seq");
	    test_seq.alu_opcode_in = 6;
      test_seq.start(env.agnt.seqr);
      #10;
    end
    
    phase.drop_objection(this);
  endtask: run_phase
endclass: rotate_left_test


class rotate_right_test extends uvm_test;
  `uvm_component_utils(rotate_right_test)

  alu_env env;
  alu_base_sequence reset_seq;
  alu_test_sequence test_seq;

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

    //reset_seq
    reset_seq = alu_base_sequence::type_id::create("reset_seq");
    reset_seq.start(env.agnt.seqr);
    #10;

    repeat(100) begin
      //test_seq
      test_seq = alu_test_sequence::type_id::create("test_seq");
	    test_seq.alu_opcode_in = 7;
      test_seq.start(env.agnt.seqr);
      #10;
    end
    
    phase.drop_objection(this);
  endtask: run_phase
endclass: rotate_right_test


class logical_AND_test extends uvm_test;
  `uvm_component_utils(logical_AND_test)

  alu_env env;
  alu_base_sequence reset_seq;
  alu_test_sequence test_seq;

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

    //reset_seq
    reset_seq = alu_base_sequence::type_id::create("reset_seq");
    reset_seq.start(env.agnt.seqr);
    #10;

    repeat(100) begin
      //test_seq
      test_seq = alu_test_sequence::type_id::create("test_seq");
	    test_seq.alu_opcode_in = 8;
      test_seq.start(env.agnt.seqr);
      #10;
    end
    
    phase.drop_objection(this);
  endtask: run_phase
endclass: logical_AND_test


class logical_OR_test extends uvm_test;
  `uvm_component_utils(logical_OR_test)

  alu_env env;
  alu_base_sequence reset_seq;
  alu_test_sequence test_seq;

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

    //reset_seq
    reset_seq = alu_base_sequence::type_id::create("reset_seq");
    reset_seq.start(env.agnt.seqr);
    #10;

    repeat(100) begin
      //test_seq
      test_seq = alu_test_sequence::type_id::create("test_seq");
	    test_seq.alu_opcode_in = 9;
      test_seq.start(env.agnt.seqr);
      #10;
    end
    
    phase.drop_objection(this);
  endtask: run_phase
endclass: logical_OR_test


class logical_XOR_test extends uvm_test;
  `uvm_component_utils(logical_XOR_test)

  alu_env env;
  alu_base_sequence reset_seq;
  alu_test_sequence test_seq;

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

    //reset_seq
    reset_seq = alu_base_sequence::type_id::create("reset_seq");
    reset_seq.start(env.agnt.seqr);
    #10;

    repeat(100) begin
      //test_seq
      test_seq = alu_test_sequence::type_id::create("test_seq");
	    test_seq.alu_opcode_in = 10;
      test_seq.start(env.agnt.seqr);
      #10;
    end
    
    phase.drop_objection(this);
  endtask: run_phase
endclass: logical_XOR_test



class logical_NOR_test extends uvm_test;
  `uvm_component_utils(logical_NOR_test)

  alu_env env;
  alu_base_sequence reset_seq;
  alu_test_sequence test_seq;


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

    //reset_seq
    reset_seq = alu_base_sequence::type_id::create("reset_seq");
    reset_seq.start(env.agnt.seqr);
    #10;

    repeat(100) begin
      //test_seq
      test_seq = alu_test_sequence::type_id::create("test_seq");
	    test_seq.alu_opcode_in = 11;
      test_seq.start(env.agnt.seqr);
      #10;
    end
    
    phase.drop_objection(this);
  endtask: run_phase
endclass: logical_NOR_test



class logical_NAND_test extends uvm_test;
  `uvm_component_utils(logical_NAND_test)

  alu_env env;
  alu_base_sequence reset_seq;
  alu_test_sequence test_seq;

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

    //reset_seq
    reset_seq = alu_base_sequence::type_id::create("reset_seq");
    reset_seq.start(env.agnt.seqr);
    #10;

    repeat(100) begin
      //test_seq
      test_seq = alu_test_sequence::type_id::create("test_seq");
	    test_seq.alu_opcode_in = 12;
      test_seq.start(env.agnt.seqr);
      #10;
    end
    
    phase.drop_objection(this);
  endtask: run_phase
endclass: logical_NAND_test



class logical_XNOR_test extends uvm_test;
  `uvm_component_utils(logical_XNOR_test)

  alu_env env;
  alu_base_sequence reset_seq;
  alu_test_sequence test_seq;

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

    //reset_seq
    reset_seq = alu_base_sequence::type_id::create("reset_seq");
    reset_seq.start(env.agnt.seqr);
    #10;

    repeat(100) begin
      //test_seq
      test_seq = alu_test_sequence::type_id::create("test_seq");
	    test_seq.alu_opcode_in = 13;
      test_seq.start(env.agnt.seqr);
      #10;
    end
    
    phase.drop_objection(this);
  endtask: run_phase
endclass: logical_XNOR_test


class A_is_greater_B_test extends uvm_test;
  `uvm_component_utils(A_is_greater_B_test)

  alu_env env;
  alu_base_sequence reset_seq;
  alu_test_sequence test_seq;

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

    //reset_seq
    reset_seq = alu_base_sequence::type_id::create("reset_seq");
    reset_seq.start(env.agnt.seqr);
    #10;

    repeat(100) begin
      //test_seq
      test_seq = alu_test_sequence::type_id::create("test_seq");
	    test_seq.alu_opcode_in = 14;
      test_seq.start(env.agnt.seqr);
      #10;
    end
    
    phase.drop_objection(this);
  endtask: run_phase
endclass: A_is_greater_B_test


class A_is_equal_B_test extends uvm_test;
  `uvm_component_utils(A_is_equal_B_test)

  alu_env env;
  alu_base_sequence reset_seq;
  alu_test_sequence test_seq;

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

    //reset_seq
    reset_seq = alu_base_sequence::type_id::create("reset_seq");
    reset_seq.start(env.agnt.seqr);
    #10;

    repeat(100) begin
      //test_seq
      test_seq = alu_test_sequence::type_id::create("test_seq");
	    test_seq.alu_opcode_in = 15;
      test_seq.start(env.agnt.seqr);
      #10;
    end
    
    phase.drop_objection(this);
  endtask: run_phase
endclass: A_is_equal_B_test

endpackage