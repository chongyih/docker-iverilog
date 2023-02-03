Icarus Verilog in a container
===============================

Overview
--------

This image contains the necessary files for running
Icarus Verilog

## Build image
	export DOCKER_BUILDKIT = 0
   	docker build -t iverilog .

## Compiling verilog
`iverilog.sh`: compiles definition and testbench file and passes to vvp to execute
`/code/mdef.v`: module definition file
`/code/tb.v`: testbench file

Run `bash iverilog.sh` to execute the script

## Output
`/code/output.txt` contains either the error message produced during the synthesis
OR the output from the vvp run time engine
