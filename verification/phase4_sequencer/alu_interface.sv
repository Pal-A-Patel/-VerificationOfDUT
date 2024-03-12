`ifndef _INTERFACE_
`define _INTERFACE_
interface alu_interface(input logic clk, reset);

  logic [7:0] alu_a_in, alu_b_in;
  logic [3:0] alu_opcode_in;
  logic [7:0] alu_y_out;
  logic alu_co_out;


modport driv_intf (
                    input clk,reset,
                    output alu_a_in,alu_b_in,alu_opcode_in
                    );


  modport DUT_intf(
    input clk, reset, alu_a_in, alu_b_in, alu_opcode_in,
    output alu_y_out, alu_co_out
  );

endinterface: alu_interface
`endif