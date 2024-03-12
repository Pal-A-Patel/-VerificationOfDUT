`include "uvm_macros.svh"
package scoreboard;
    import uvm_pkg::*;
    import transaction::*;

class alu_scoreboard extends uvm_test;
  `uvm_component_utils(alu_scoreboard)
  
  uvm_analysis_imp #(alu_sequence_item, alu_scoreboard) scoreboard_port;
  
  alu_sequence_item transactions[$];
  
  
  //--------------------------------------------------------
  //Constructor
  //--------------------------------------------------------
  function new(string name = "alu_scoreboard", uvm_component parent);
    super.new(name, parent);
    `uvm_info("SCB_CLASS", "Inside Constructor!", UVM_HIGH)
  endfunction: new
  
  
  //--------------------------------------------------------
  //Build Phase
  //--------------------------------------------------------
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info("SCB_CLASS", "Build Phase!", UVM_HIGH)
   
    scoreboard_port = new("scoreboard_port", this);
    
  endfunction: build_phase
  
  
  //--------------------------------------------------------
  //Connect Phase
  //--------------------------------------------------------
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    `uvm_info("SCB_CLASS", "Connect Phase!", UVM_HIGH)
    
   
  endfunction: connect_phase
  
  
  //Write Method
  function void write(alu_sequence_item item);
    transactions.push_back(item);
  endfunction: write 
  
  
  
  //Run Phase
  task run_phase (uvm_phase phase);
    super.run_phase(phase);
    `uvm_info("SCB_CLASS", "Run Phase!", UVM_HIGH)
   
    forever begin
      alu_sequence_item curr_trans;
      wait((transactions.size() != 0));
      curr_trans = transactions.pop_front();
      compare(curr_trans);
      
    end
    
  endtask: run_phase
  
  

  //Compare 
  task compare(alu_sequence_item curr_trans);
    logic [7:0] expected;
    logic [7:0] actual;
    
    case(curr_trans.alu_opcode_in)
      0: begin 
	  expected = curr_trans.alu_a_in + curr_trans.alu_b_in; 
        if ((curr_trans.alu_co_out == 0) &&((expected) == curr_trans.alu_y_out ))
         `uvm_info("ADDITION", $sformatf("Transaction Passed! ACT=%d, EXP=%d, A=%d, B=%d",curr_trans.alu_y_out, curr_trans.alu_y_out, curr_trans.alu_a_in, curr_trans.alu_b_in), UVM_LOW)
        else if ((curr_trans.alu_co_out == 1) &&((expected) == curr_trans.alu_y_out ))
         `uvm_info("ADDITION", $sformatf("Transaction Passed! ACT=%d, EXP=%d, A=%d, B=%d",curr_trans.alu_y_out, expected, curr_trans.alu_a_in, curr_trans.alu_b_in), UVM_LOW)
        else
          `uvm_error("ADDITION", $sformatf("Transaction failed! ACT=%d, EXP=%d, A=%d, B=%d", curr_trans.alu_y_out, expected, curr_trans.alu_a_in, curr_trans.alu_b_in))
      end
                  
       1: begin 
      expected = curr_trans.alu_a_in - curr_trans.alu_b_in;
          if ( ( curr_trans.alu_a_in >= curr_trans.alu_b_in ) && ((expected)  == curr_trans.alu_y_out ))
            `uvm_info("SUBTRACTION", $sformatf("PASSED! ACT=%d, EXP=%d, A=%d, B=%d",curr_trans.alu_y_out, expected, curr_trans.alu_a_in, curr_trans.alu_b_in), UVM_LOW)
          else if ( ( curr_trans.alu_a_in < curr_trans.alu_b_in ) && ((expected) == curr_trans.alu_y_out ))
            `uvm_info("SUBTRACTION", $sformatf("PASSED! ACT=%d, EXP=%d, A=%d, B=%d",curr_trans.alu_y_out, expected, curr_trans.alu_a_in, curr_trans.alu_b_in), UVM_LOW)
          else
            `uvm_error("SUBTRACTION", $sformatf("FAILED! ACT=%d, EXP=%d, A=%d, B=%d", curr_trans.alu_y_out, expected, curr_trans.alu_a_in, curr_trans.alu_b_in))
            
      end
      2: begin 
	  expected = curr_trans.alu_a_in * curr_trans.alu_b_in;
          if ((curr_trans.alu_co_out == 0) && ((expected <= 255)) && (((expected) & 8'hFF) == curr_trans.alu_y_out ))
            `uvm_info("MULTIPLICATION", $sformatf("PASSED! ACT=%d, EXP=%d, A=%d, B=%d",curr_trans.alu_y_out, expected, curr_trans.alu_a_in, curr_trans.alu_b_in), UVM_LOW)
          else if ((curr_trans.alu_co_out == 1) && ((expected > 255)) && (((expected) & 8'hFF) == curr_trans.alu_y_out ))
            `uvm_info("MULTIPLICATION", $sformatf("PASSED! ACT=%d, EXP=%d, A=%d, B=%d",curr_trans.alu_y_out, expected, curr_trans.alu_a_in, curr_trans.alu_b_in), UVM_LOW)
          else
            `uvm_error("MULTIPLICATION", $sformatf("FAILED! ACT=%d, EXP=%d, A=%d, B=%d", curr_trans.alu_y_out, expected, curr_trans.alu_a_in, curr_trans.alu_b_in))
                       
      end
      3: begin 
	  expected = curr_trans.alu_a_in / curr_trans.alu_b_in; 
          if ((curr_trans.alu_co_out == 0) && (expected == curr_trans.alu_y_out ))
            `uvm_info("DIVISION", $sformatf("PASSED! ACT=%d, EXP=%d, A=%d, B=%d",curr_trans.alu_y_out, curr_trans.alu_y_out, curr_trans.alu_a_in, curr_trans.alu_b_in), UVM_LOW)
          else if ((curr_trans.alu_co_out == 1) && (curr_trans.alu_a_in < curr_trans.alu_b_in ) && (expected == curr_trans.alu_y_out ))
            `uvm_info("DIVISION", $sformatf("PASSED! ACT=%d, EXP=%d, A=%d, B=%d",curr_trans.alu_y_out, expected, curr_trans.alu_a_in, curr_trans.alu_b_in), UVM_LOW)
          else
            `uvm_error("DIVISION", $sformatf("FAILED! ACT=%d, EXP=%d, A=%d, B=%d", curr_trans.alu_y_out, expected, curr_trans.alu_a_in, curr_trans.alu_b_in))
      end
      4: begin
        expected = ((curr_trans.alu_a_in*2)&255); 
          if ((expected) == curr_trans.alu_y_out )
            `uvm_info("LOGIC SHIFT LEFT", $sformatf("PASSED! ACT=%d, EXP=%d, A=%d, B=%d",curr_trans.alu_y_out, expected, curr_trans.alu_a_in, curr_trans.alu_b_in), UVM_LOW)
          else
            `uvm_error("LOGIC SHIFT LEFT", $sformatf("FAILED! ACT=%d, EXP=%d, A=%d, B=%d", curr_trans.alu_y_out, expected, curr_trans.alu_a_in, curr_trans.alu_b_in))
      end

      5: begin 
        expected = ((curr_trans.alu_a_in/2)&255);
          if ((expected) == curr_trans.alu_y_out )
            `uvm_info("LOGIC SHIFT RIGHT", $sformatf("PASSED! ACT=%d, EXP=%d, A=%d, B=%d",curr_trans.alu_y_out, expected, curr_trans.alu_a_in, curr_trans.alu_b_in), UVM_LOW)
          else
            `uvm_error("LOGIC SHIFT RIGHT", $sformatf("FAILED! ACT=%d, EXP=%d, A=%d, B=%d", curr_trans.alu_y_out, expected, curr_trans.alu_a_in, curr_trans.alu_b_in))
      end

       6: begin
   
          if ((curr_trans.alu_a_in < 128 ) && (((curr_trans.alu_a_in << 1) & 255) == curr_trans.alu_y_out ))
            `uvm_info("ROTATE LEFT", $sformatf("PASSED! ACT=%d, EXP=%d, A=%d, B=%d",curr_trans.alu_y_out, curr_trans.alu_y_out, curr_trans.alu_a_in, curr_trans.alu_b_in), UVM_LOW)
          else if ((curr_trans.alu_a_in >= 128 ) && ((((curr_trans.alu_a_in << 1) + 1) & 255) == curr_trans.alu_y_out ))
            `uvm_info("ROTATE LEFT", $sformatf("PASSED! ACT=%d, EXP=%d, A=%d, B=%d",curr_trans.alu_y_out, curr_trans.alu_y_out, curr_trans.alu_a_in, curr_trans.alu_b_in), UVM_LOW)
          else
            `uvm_error("ROTATE LEFT", $sformatf("FAILED! ACT=%d, EXP=%d, A=%d, B=%d", curr_trans.alu_y_out, expected, curr_trans.alu_a_in, curr_trans.alu_b_in))          
      end

      7: begin 
          if ((curr_trans.alu_a_in % 2 == 0) && (((curr_trans.alu_a_in >> 1) & 255) == curr_trans.alu_y_out ))
            `uvm_info("ROTATE RIGHT", $sformatf("PASSED! ACT=%d, EXP=%d, A=%d, B=%d",curr_trans.alu_y_out, curr_trans.alu_y_out, curr_trans.alu_a_in, curr_trans.alu_b_in), UVM_LOW)
          else if ((curr_trans.alu_a_in % 2 == 1 ) && ((((curr_trans.alu_a_in >> 1) + 128) & 255) == curr_trans.alu_y_out ))
            `uvm_info("ROTATE RIGHT", $sformatf("PASSED! ACT=%d, EXP=%d, A=%d, B=%d",curr_trans.alu_y_out, curr_trans.alu_y_out, curr_trans.alu_a_in, curr_trans.alu_b_in), UVM_LOW)
          else
            `uvm_error("ROTATE RIGHT", $sformatf("FAILED! ACT=%d, EXP=%d, A=%d, B=%d", curr_trans.alu_y_out, expected, curr_trans.alu_a_in, curr_trans.alu_b_in))  
      end

      8: begin
        expected = curr_trans.alu_a_in & curr_trans.alu_b_in; 
         if ((expected) == curr_trans.alu_y_out)
            `uvm_info("LOGICAL-AND", $sformatf("PASSED! ACT=%d, EXP=%d, A=%d, B=%d",curr_trans.alu_y_out, expected, curr_trans.alu_a_in, curr_trans.alu_b_in), UVM_LOW)        
         else
            `uvm_error("LOGICAL-AND", $sformatf("FAILED! ACT=%d, EXP=%d, A=%d, B=%d", curr_trans.alu_y_out, expected, curr_trans.alu_a_in, curr_trans.alu_b_in))          
     end

     9: begin
      expected = curr_trans.alu_a_in | curr_trans.alu_b_in;
          if ((expected) == curr_trans.alu_y_out)
            `uvm_info("LOGICAL-OR", $sformatf("PASSED! ACT=%d, EXP=%d, A=%d, B=%d",curr_trans.alu_y_out, expected, curr_trans.alu_a_in, curr_trans.alu_b_in), UVM_LOW) 
          else
            `uvm_error("LOGICAL-OR", $sformatf("FAILED! ACT=%d, EXP=%d, A=%d, B=%d", curr_trans.alu_y_out, expected, curr_trans.alu_a_in, curr_trans.alu_b_in)) 
    end

    10: begin
      expected = curr_trans.alu_a_in ^ curr_trans.alu_b_in;
          if ((expected) == curr_trans.alu_y_out)
            `uvm_info("LOGICAL-XOR", $sformatf("PASSED! ACT=%d, EXP=%d, A=%d, B=%d",curr_trans.alu_y_out, expected, curr_trans.alu_a_in, curr_trans.alu_b_in), UVM_LOW) 
          else
            `uvm_error("LOGICAL-XOR", $sformatf("FAILED! ACT=%d, EXP=%d, A=%d, B=%d", curr_trans.alu_y_out, expected, curr_trans.alu_a_in, curr_trans.alu_b_in)) 
    end

    11: begin
      expected = (~(curr_trans.alu_a_in | curr_trans.alu_b_in));
          if ((expected) == curr_trans.alu_y_out)
            `uvm_info("LOGICAL-NOR", $sformatf("PASSED! ACT=%d, EXP=%d, A=%d, B=%d",curr_trans.alu_y_out, expected, curr_trans.alu_a_in, curr_trans.alu_b_in), UVM_LOW) 
          else
            `uvm_error("LOGICAL-NOR", $sformatf("FAILED! ACT=%d, EXP=%d, A=%d, B=%d", curr_trans.alu_y_out, expected, curr_trans.alu_a_in, curr_trans.alu_b_in))            
    end   

    12: begin
      expected = (~(curr_trans.alu_a_in & curr_trans.alu_b_in));
          if ((expected) == curr_trans.alu_y_out)
             `uvm_info("LOGICAL-NAND", $sformatf("PASSED! ACT=%d, EXP=%d, A=%d, B=%d",curr_trans.alu_y_out, expected, curr_trans.alu_a_in, curr_trans.alu_b_in), UVM_LOW) 
          else
            `uvm_error("LOGICAL-NAND", $sformatf("FAILED! ACT=%d, EXP=%d, A=%d, B=%d", curr_trans.alu_y_out, expected, curr_trans.alu_a_in, curr_trans.alu_b_in))  
    end

    13: begin
      expected = (~(curr_trans.alu_a_in ^ curr_trans.alu_b_in));
          if ((expected) == curr_trans.alu_y_out)
             `uvm_info("LOGICAL-XNOR", $sformatf("PASSED! ACT=%d, EXP=%d, A=%d, B=%d",curr_trans.alu_y_out, expected, curr_trans.alu_a_in, curr_trans.alu_b_in), UVM_LOW) 
          else
             `uvm_error("LOGICAL-XNOR", $sformatf("FAILED! ACT=%d, EXP=%d, A=%d, B=%d", curr_trans.alu_y_out, expected, curr_trans.alu_a_in, curr_trans.alu_b_in))
    end

    14: begin
      expected = curr_trans.alu_a_in > curr_trans.alu_b_in;
          if ((expected) == curr_trans.alu_y_out)
             `uvm_info("A>B", $sformatf("PASSED! ACT=%d, EXP=%d, A=%d, B=%d",curr_trans.alu_y_out, expected, curr_trans.alu_a_in, curr_trans.alu_b_in), UVM_LOW) 
          else
             `uvm_error("A>B", $sformatf("FAILED! ACT=%d, EXP=%d, A=%d, B=%d", curr_trans.alu_y_out, expected, curr_trans.alu_a_in, curr_trans.alu_b_in))
    end
                
    15: begin
  
          if ((curr_trans.alu_a_in = curr_trans.alu_b_in) != curr_trans.alu_y_out)
              `uvm_info("A=B", $sformatf("PASSED! ACT=%d, EXP=%d, A=%d, B=%d",curr_trans.alu_y_out, expected, curr_trans.alu_a_in, curr_trans.alu_b_in), UVM_LOW) 
          else
              `uvm_error("A=B", $sformatf("FAILED! ACT=%d, EXP=%d, A=%d, B=%d", curr_trans.alu_y_out, expected, curr_trans.alu_a_in, curr_trans.alu_b_in))
    end
            
  
  
    endcase
    
  endtask: compare
endclass: alu_scoreboard
endpackage