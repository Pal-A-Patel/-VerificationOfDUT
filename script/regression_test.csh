#!/bin/csh

source /CMC/scripts/mentor.questasim.2020.1_1.csh

setenv QUESTA_HOME $CMC_MNT_QSIM_HOME
setenv UVM_HOME $QUESTA_HOME/verilog_src/uvm-1.2

set rootdir = `dirname $0`
echo "rootdir: $rootdir"
set rootdir = `cd $rootdir && pwd`
echo "rootdir : $rootdir"


set workdir = "$rootdir/../verification/regression_test"
echo "workdir $workdir"
cd workdir
if (! -e work) then
	echo "No work Directory. Create work directory"
	vlib work
endif
vmap work work
#rm a log file if exist
rm -f ../../doc/uvm_xsw_switch_log.log
# loop into all the tests
set testcase_list = ("alu_addition_test" "alu_subtraction_test" "alu_multiplication_test" "alu_division_test" "shift_left_test" "alu_test" "shift_right_test" "rotate_left_test" "rotate_right_test" "logical_AND_test" "logical_OR_test" "logical_XOR_test" "logical_NOR_test" "logical_NAND_test" "logical_XNOR_test" "A_is_equal_B_test" "A_is_greater_B_test" )

# testing with random_op_code
cd "$workdir/../.."
foreach i ($testcase_list)
	vlog -f script/uvm_regression.f
	vsim -c tbench_top -L $QUESTA_HOME/uvm-1.2 +UVM_TESTNAME=$i <<!
	run -all
	#exit
!
	


end






