+incdir+.
+incdir+$UVM_HOME/src
$UVM_HOME/src/uvm_pkg.sv
dut/*.svp
dut/*.sv +incdir+"./dut"
./verification/regression_test/alu_interface.sv +incdir+"./verification/regression_test"

./verification/regression_test/transaction.sv +incdir+"./verification/regression_test"
./verification/regression_test/sequences.sv +incdir+"./verification/regression_test"
./verification/regression_test/driver.sv +incdir+"./verification/regression_test"
./verification/regression_test/sequencer.sv +incdir+"./verification/regression_test"
./verification/regression_test/monitor.sv +incdir+"./verification/regression_test"
./verification/regression_test/scoreboard.sv +incdir+"./verification/regression_test"
./verification/regression_test/agent.sv +incdir+"./verification/regression_test"
./verification/regression_test/environment.sv +incdir+"./verification/regression_test"
./verification/regression_test/lab5_pkg.sv +incdir+"./verification/regression_test"
./verification/regression_test/tbench_top.sv +incdir+"./verification/regression_test"