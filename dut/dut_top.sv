`include "uvm_macros.svh"
module dut_top(alu_interface.DUT_intf i_intf);
    import uvm_pkg::*;
    alu alu_core(
        .clk(i_intf.clk),
        .reset(i_intf.reset),
        .alu_a_in(i_intf.alu_a_in),
        .alu_b_in(i_intf.alu_b_in),
        .alu_opcode_in(i_intf.alu_opcode_in),
        .alu_y_out(i_intf.alu_y_out),
        .alu_co_out(i_intf.alu_co_out)
    );
endmodule