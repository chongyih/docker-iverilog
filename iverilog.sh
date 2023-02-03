#!/bin/sh
iverilog -o /code/main.out /code/mdef.v /code/tb.v 2> /code/output.txt
if [ $? -ne 0 ]
then
	exit 1
else
	vvp -n /code/main.out &> /code/output.txt
fi