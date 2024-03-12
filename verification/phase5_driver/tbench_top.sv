`include "uvm_macros.svh"
module tbench_top;

	///Intantiation

    import uvm_pkg::*;
    import lab5_pkg::*;
    bit clk,reset;

    dut_top  dut1 (.*);
    alu_interface i_intf(.*); 
    
    
    initial
    begin
      clk = 0;
      forever #5 clk = ~clk;
    end

    initial
    begin
     reset = 1;
     repeat(3) @(negedge clk);
     reset = 0;
    end

  ///Interface Settting

  initial
  begin: blk
    uvm_config_db #(virtual alu_interface)::set(null, "*","vif", i_intf);
    uvm_top.finish_on_completion  = 1;
  run_test("alu_test");
  end

endmodule