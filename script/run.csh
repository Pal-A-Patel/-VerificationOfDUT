#!/bin/csh

source /CMC/scripts/mentor.questasim.2020.1_1.csh
setenv QUESTA_HOME $CMC_MNT_QSIM_HOME
setenv UVM_HOME $QUESTA_HOME/verilog_src/uvm-1.2


# Phase independent
set rootdir = `dirname $0`
echo "rootdir : $rootdir"
set rootdir = `cd $rootdir && pwd` 
echo "rootdir : $rootdir"
set script_name = $0:t
#echo script $script_name
set phase_no = `echo $script_name:r | sed -e  s/run_//`
#echo phase $phase_no
echo "running $phase_no"
set file_name = "configuration"
set tbench_top tbench_top
switch ($phase_no)
  case 'phase1':
    set phase_name = top
    set file_name = uvm_top
    breaksw
  case 'phase2':
    set phase_name = configuration
    set file_name = uvm_configuration
    breaksw
  case 'phase3':
    set phase_name = environment
    set file_name = uvm_environment
    breaksw
  case 'phase4':
    set phase_name = sequencer
    set file_name = uvm_sequencer
    breaksw
  case 'phase5':
    set phase_name = driver
    set file_name = uvm_driver
    breaksw
  case 'phase6':
    set phase_name = monitor
    set file_name = uvm_monitor
    breaksw
  case 'phase7':
    set phase_name = scoreboard
    set file_name = uvm_scoreboard
    breaksw
  case 'phase8' :
    set phase_name = coverage
    set file_name = uvm_coverage
    breaksw
  case 'phase9':
    set phase_name = testcases
    set file_name = uvm_testcases
    
endif
    breaksw
  default:
    echo Unknown phase number: $phase_no
    breaksw
  endsw
endif

set testcase_list = ( "testa_addition", "test_subtraction" )
set workdir = "$rootdir/../verification/${phase_no}_$phase_name"
echo $workdir
if (! -d "$workdir" ) then
  echo "ERROR: $workdir doesn't exist!"
else
  echo "Working directory: $workdir"
  cd workdir

  if (! -e work) then
	  vlib work
  endif

  vmap work work
  
    vlog -f ../../script/${file_name}.f
    vsim -c tbench_top -L $QUESTA_HOME/uvm-1.2 +UVM_TESTNAME -do "../../script/${phase_no}_${phase_name}.do"
  # endif
 
  endif

